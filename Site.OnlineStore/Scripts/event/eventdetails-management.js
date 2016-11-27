var EventDetailsManagement = EventDetailsManagement || {};
EventDetailsManagement = {
    init: function () {
        // support ajax to upload images
        window.addEventListener("submit", function (e) {
            EventDetailsManagement.showSpin();
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

                                    EventDetailsManagement.hideSpin();
                                }
                            }
                        }
                    };
                    xhr.send(new FormData(form));
                }
            }
        }, true);

        $(document).on("keypress", "form", function (event) {
            return event.keyCode != 13;
        });

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
    bindEventForElement:function(){
        // Bind events for controls

        $("#Btn_OrderTicket").unbind("click").bind("click", function () {
            if (EventDetailsManagement.validateOrderTicketForm()) {
                $('#Form_OrderTicket').submit();
            }
        });

        $('#Form_OrderTicket').submit(function (event) {
            EventDetailsManagement.onOrderTicketFormSubmit();
            event.preventDefault();
        });

        $("#Txt_EventSearchBox").unbind("change").bind("change", function () {
            window.location.replace("/Event/SearchEvent/?SearchString="+$(this).val());
        });

        $("#track_event").unbind("click").bind("click", function (e) {
            var isSaved = $(e.target).hasClass("saved");
            if (isSaved) {
                EventDetailsManagement.removeBookMarkEvent();
            } else {
                EventDetailsManagement.bookMarkEvent();
            }
        });
    },
    validateOrderTicketForm:function(){
        // Validate form

        var valid = false;
        $("#Form_OrderTicket .ticket_table_select").each(function (index, element) {
            var value = parseInt($(element).val());
            if (value != NaN && value > 0) {
                valid = true;
                return
            }
        });

        return valid;
    },
    googleApiCallBackFunction: function () {
        /// <summary>
        /// This function will be call when google api ready for use
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        this.init();
        this.updateMapForNewLocation();
    },
    updateMapForNewLocation: function () {

        var map = new google.maps.Map(document.getElementById('map_canvas'), {
            //center: { lat: -33.8688, lng: 151.2195 },
            zoom: 13,
            mapTypeId: 'roadmap'
        });
        geocoder = new google.maps.Geocoder();
        var address = this.model.Address; //input box value
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                console.log(results[0].geometry.location);
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });
            }
        });
    },
    bookMarkEvent:function(){
        // Bookmark a event

        var eventId = $("[name = 'EventId']").val();

        EventDetailsManagement.showSpin("#track_event_container");
        $.ajax({
            type: "post",
            url: "/UserResources/AddEventBookMark",
            data: { eventId: eventId },
            dataType: 'json',
            success: function (result) {
                if (result.Success) {
                    $("#track_event").removeClass("saved").addClass("saved");
                    console.log("Bookmark this event successful!");
                } else {
                    console.log("Error: bookmark this event fail!");
                }
            },
            error: function () {
                console.log("Error: bookmark this event fail!");
            },
            complete: function () {
                EventDetailsManagement.hideSpin();
            }
        });
    },
    removeBookMarkEvent: function () {
        // Bookmark a event

        var eventId = $("[name = 'EventId']").val();

        EventDetailsManagement.showSpin("#track_event_container");
        $.ajax({
            type: "post",
            url: "/UserResources/RemoveEventBookMark",
            data: { eventId: eventId },
            dataType: 'json',
            success: function (result) {
                if (result.Success) {
                    $("#track_event").removeClass("saved");
                    console.log("Remove Bookmark of this event successful!");
                } else {
                    console.log("Error: Remove bookmark this event fail!");
                }
            },
            error: function () {
                console.log("Error: Remove bookmark this event fail!");
            },
            complete: function () {
                EventDetailsManagement.hideSpin();
            }
        });
    },
    onOrderTicketFormSubmit:function(e){
        // Request to Order ticket page

        $.ajax({
            type: "POST",
            url: "/Event/OrderTicket",
            data: $("#Form_OrderTicket").serialize(), // serializes the form's elements.
            success: function (data) {
                if (data.Success) {
                    window.location.replace("/Event/OrderTicketPage?orderId=" + data.OrderGuid);
                } else {
                    alert(data.Message);
                }
            },
            error: function () {
                alert("Order event fail!");
            }
        });
    },
    showSpin: function (target) {
        /// <summary>
        /// Create spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>s

        $(target).append(EventDetailsManagement.controls.spin.spin().el);
    },
    hideSpin: function () {
        /// <summary>
        /// Hide spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        EventDetailsManagement.controls.spin.stop();
    },
    model:{
        Address: "",
        OrderRequest: {
            EventId: null,
            Tickets: [],
            Owner:null
        }
    }
}