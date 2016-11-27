var OrderTicketManagement = OrderTicketManagement || {};
OrderTicketManagement = {
    init: function (orderId,eventId,remainOrderSessionTime) {
        // support ajax to upload images
        window.addEventListener("submit", function (e) {
            OrderTicketManagement.showSpin();
            var form = e.target;
            if (form.getAttribute("enctype") === "multipart/form-data") {
                if (form.dataset.ajax) {
                    e.preventDefault();
                    e.stopImmediatePropagation();
                    var xhr = new XMLHttpRequest();
                    xhr.open(form.method, form.action);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            if (form.dataset.ajaxUpdate) {
                                var updateTarget = document.querySelector(form.dataset.ajaxUpdate);
                                if (updateTarget) {
                                    updateTarget.innerHTML = xhr.responseText;

                                    OrderTicketManagement.hideSpin();
                                }
                            }
                        }
                    };
                    xhr.send(new FormData(form));
                }
            }
        }, true);

        // Init spin
        this.controls.spin = new Spinner({
            lines: 13 // The number of lines to draw
            , length: 28 // The length of each line
            , width: 14 // The line thickness
            , radius: 42 // The radius of the inner circle
            , scale: 1 // Scales overall size of the spinner
            , corners: 1 // Corner roundness (0..1)
            , color: '#000' // #rgb or #rrggbb or array of colors
            , opacity: 0.25 // Opacity of the lines
            , rotate: 0 // The rotation offset
            , direction: 1 // 1: clockwise, -1: counterclockwise
            , speed: 1 // Rounds per second
            , trail: 60 // Afterglow percentage
            , fps: 20 // Frames per second when using setTimeout() as a fallback for CSS
            , zIndex: 2e9 // The z-index (defaults to 2000000000)
            , className: 'spinner' // The CSS class to assign to the spinner
            , top: '50%' // Top position relative to parent
            , left: '50%' // Left position relative to parent
            , shadow: true // Whether to render a shadow
            , hwaccel: false // Whether to use hardware acceleration
            , position: 'fixed' // Element positioning
        }).spin();

        if (orderId) {
            this.model.OrderId = orderId;
        }
        if (eventId) {
            this.regurl = "/Event/EventDetails?id=" + eventId;
        } else {
            this.regurl = "/Home";
        }

        if (remainOrderSessionTime) {
            this.orderTimeControl.left = remainOrderSessionTime;
        }

        this.bindEventForElement();
        this.countDownTime();
    },
    controls: {
        spin: null
    },
    gUpdateCountdownTimeoutId: null,
    orderTimeControl : {
        limit:480,
        left: 480,
        now: new Date(),
        endTime: ''
    },
    regurl: '',
    checkingRequestTime:0,
    countDownTime: function () {
        this.orderTimeControl.endTime = new Date(this.orderTimeControl.now.getTime() + this.orderTimeControl.left * 1000);
        this.displayTime("time_limit", this.orderTimeControl.limit);
        this.displayTime("time_limit2", this.orderTimeControl.limit);
        this.displayTime("time_left", this.orderTimeControl.left);

        this.gUpdateCountdownTimeoutId = window.setTimeout("OrderTicketManagement.updateCountdown();", 1000);
    },
    updateCountdown: function () {
        var now = new Date();

        if (now < this.orderTimeControl.endTime) {
            this.displayTime("time_left", (this.orderTimeControl.endTime - now) / 1000);
            this.checkingRequestTime += 1;
            if (this.checkingRequestTime >= 10) {
                this.checkTimeOutSession();
                this.checkingRequestTime = 0;
            }
            gUpdateCountdownTimeoutId = window.setTimeout("OrderTicketManagement.updateCountdown();", 1000);
        } else {
            alert("Exceeded time for register!");
            var url = this.regurl;
            if (url.indexOf('?') == -1)
                url += '?';
            else
                url += '&';
            window.location.replace(url + "err=29");
        }
    },
    checkTimeOutSession:function(){
        $.ajax({
            url: '/Event/CheckOrderSessionTimeOut',
            data: { orderId: this.model.OrderId },
            type: "POST",
            success: function (result) {
                if (!result.Success) {
                    alert("Error :" + result.Message);
                    window.location.replace(OrderTicketManagement.regurl);
                }
            },
            error: function (ex) {
                console.log("Check session timeout error");
            }
        });
    },
    displayTime: function (field, numSeconds) {
        var timeMinutes = parseInt(numSeconds / 60, 10),
        timeSeconds = parseInt(numSeconds - timeMinutes * 60, 10);

        if (timeSeconds < 10) {
            timeLabel = timeMinutes + ":0" + timeSeconds + " ";
        } else {
            timeLabel = timeMinutes + ":" + timeSeconds + " ";
        }

        document.getElementById(field).innerHTML = timeLabel;
    },
    bindEventForElement: function () {
        // Bind events for controls

        $("#Btn_CompleteRegistration").unbind("click").bind("click", function () {
            $("#registrationForm").submit();
        });

        $("#registrationForm").submit(function (event) {
            $("#registrationForm").removeClass("validateform").addClass("validateform");
            if (this.checkValidity()) {
                OrderTicketManagement.orderTicket();
            } else {
                OrderTicketManagement.showAllErrorMessages($("#registrationForm"));
            }
            event.preventDefault();
        });
    },
    validateInformationForm: function () {
        // Validate form

        var valid = false;

        var firstName = $("#Txt_FirstName").val();
        var lastName = $("#Txt_LastName").val();
        var emailAddress = $("#Txt_EmailAddress").val();
        var orderId = $("#OrderId").val();
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (firstName != "" && lastName != "" && emailAddress != "" && re.test(emailAddress)) {
            this.model.FirstName = firstName;
            this.model.LastName = lastName;
            this.model.EmailAddress = emailAddress;
            this.model.OrderId = orderId;
            return true;
        } else {
            return false;
        }

        return valid;
    },
    showAllErrorMessages: function (formControl) {
        // Validate event informations
        var errorList = $('ul.errorMessages', formControl);

        errorList.empty();

        //Find all invalid fields within the form.
        formControl.find(':invalid').each(function (index, node) {

            //Find the field's corresponding label
            var fieldName = $(node).data("fieldname");
            //Opera incorrectly does not fill the validationMessage property.
            var message = node.validationMessage || 'Invalid value.';
            errorList
                .show()
                .append('<li><span>' + fieldName + '</span> ' + message + '</li>');
        });
    },
    orderTicket: function () {
        // Request to server to order ticket

        $.ajax({
            url: '/Event/ConfirmOrderTickets',
            type: 'POST',
            data: $("#registrationForm").serialize(),
            success: function (result) {
                console.log(result);
                if (result.Success) {
                    window.location.replace("/Event/OrderSuccessful");
                } else {
                    alert("Error :" + result.Message);
                    window.location.replace(OrderTicketManagement.regurl);
                }
            },
            error: function () {
                console.log("Get events fail!");
            }
        });
    },
    showSpin: function (target) {
        /// <summary>
        /// Create spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>s

        $("#images").append(OrderTicketManagement.controls.spin.spin().el);
    },
    hideSpin: function () {
        /// <summary>
        /// Hide spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        OrderTicketManagement.controls.spin.stop();
    },
    model: {
        OrderId: null,
        FirstName: "",
        LastName: "",
        EmailAddress: ""
    }
}



