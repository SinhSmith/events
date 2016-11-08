var OrderTicketManagement = OrderTicketManagement || {};
OrderTicketManagement = {
    init: function () {
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

        this.bindEventForElement();
    },
    controls: {
        spin: null
    },
    bindEventForElement: function () {
        // Bind events for controls

        $("#Btn_CompleteRegistration").unbind("click").bind("click", function () {
            if (OrderTicketManagement.validateInformationForm()) {
                $.ajax({
                    url: '/Event/ConfirmOrderTickets',
                    type: 'POST',
                    data: OrderTicketManagement.model,
                    success: function (result) {
                        console.log(result);
                        if (result.Success) {
                            window.location.replace("/Event/OrderSuccessful");
                        } else {
                            alert(result.Message);
                        }
                    },
                    error: function () {
                        console.log("Get events fail!");
                    }
                });
            }
        });
    },
    validateInformationForm: function () {
        // Validate form

        var valid = false;
        
        var firstName = $("#Txt_FirstName").val();
        var lastName = $("#Txt_LastName").val();
        var emailAddress = $("#Txt_EmailAddress").val();
        var orderId = $("#InputHidden_OrderId").val();
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
    model:{
        OrderId: null,
        FirstName:"",
        LastName:"",
        EmailAddress:""
    }
}


var orderTimeControl = {
    limit: 480,
    left: 478,
    now: new Date(),
    endTime: ''
},
gUpdateCountdownTimeoutId = null; //This global variable is a hack for #7215. Sorry

orderTimeControl.endTime = new Date(orderTimeControl.now.getTime() + orderTimeControl.left * 1000);

function displayTime(field, numSeconds) {
    var timeMinutes = parseInt(numSeconds / 60, 10),
        timeSeconds = parseInt(numSeconds - timeMinutes * 60, 10);

    if (timeSeconds < 10) {
        timeLabel = timeMinutes + ":0" + timeSeconds + " ";
    } else {
        timeLabel = timeMinutes + ":" + timeSeconds + " ";
    }

    document.getElementById(field).innerHTML = timeLabel;
}

displayTime("time_limit", orderTimeControl.limit);
displayTime("time_limit2", orderTimeControl.limit);
displayTime("time_left", orderTimeControl.left);


function updateCountdown() {
    var now = new Date();

    if (now < orderTimeControl.endTime) {
        displayTime("time_left", (orderTimeControl.endTime - now) / 1000);
        gUpdateCountdownTimeoutId = window.setTimeout("updateCountdown();", 1000);
    } else {
        display_error_msg("alert", "exceeded", "register");
        if (regurl.indexOf('?') == -1)
            regurl += '?';
        else
            regurl += '&';
        document.location.href = regurl + "err=29";
    }
}

gUpdateCountdownTimeoutId = window.setTimeout("updateCountdown();", 1000);
