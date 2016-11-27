var Mode = {
    Display: 0,
    Edit: 1
};
var TicketType = {
    Free: "0",
    Paid: "1",
    Donation: "2"
};

var TicketEvent = function () {
   this.Id = null;
   this.Name = "";
   this.Quantity = 0;
   this.Price = 0;
   this.Description = "";
   this.IsShowDescription = true;
   this.SaleChanel = 0;
   this.MinimunTicketOrder = 1;
   this.MaximunTicketOrder = 10;
   this.StartSaleDateTime = null
   this.EndSaleDateTime = null;
   this.Type = 0;
}

var EventManagement = EventManagement || {};

EventManagement = {
    init: function () {
        // support ajax to upload images
        window.addEventListener("submit", function (e) {
            EventManagement.showSpin();
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

                                    EventManagement.hideSpin();
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
        this.initElement();

        // bind events
        //$("#Btn_UploadImage").unbind("click").bind("click", EventManagement.upLoadImage)
    },
    controls: {
        spin: null
    },
    constants:{
        datetimeFormat:"dd/MM/yyyy hh:mm:ss"
    },
    bindEventForElement:function(){
        // Bind event for element in form

        $("#add-ticket-button").unbind("click").bind("click", $.proxy(this.onCreateTicket, this));
        $("#TicketType").unbind("change").bind("change", $.proxy(this.removeAllTicket, this));
        $("#UpdateCoverImage").unbind("click").bind("click", function () {
            var requestData = new FormData();
            // get cover image file
            var totalFiles = document.getElementById("CoverImage").files.length;
            for (var i = 0; i < totalFiles; i++) {
                var file = document.getElementById("CoverImage").files[i];

                requestData.append("coverImage", file);
            }
            var eventId = $("#EventId").val();
            requestData.append("eventId", eventId);

            $.ajax({
                url: '/Admin/Event/UpdateCoverImage',
                data: requestData,
                type: 'POST',
                contentType: false,
                processData: false,
                success: function (data) {
                    if (data.success) {
                        $("#EventCoverImage").attr("src", data.newImagePath);
                    } else {

                    }
                },
                error: function () {
                    alert("Update cover image fail!");
                }
            });
        });
        $("#Btn_ResetAddressPanel").unbind("click").bind("click", function () {
            EventManagement.updateModeLocationPanel(true);
        });
        $("#Btn_EnableDetailAddressPanel").unbind("click").bind("click", function () {
            EventManagement.updateModeLocationPanel(false);
        });

        $('#event_form').submit(function (event) {
            if (this.checkValidity()) {
                EventManagement.createEvent("/Admin/Event/Create", "/Admin/Event/Index");
            } else {
                EventManagement.showAllErrorMessages($('#event_form'));
            }
            event.preventDefault();
        });

        $("#createevent_form").submit(function (event) {
            if (this.checkValidity()) {
                EventManagement.createEvent("/Event/CreateEvent","/Home");
            } else {
                EventManagement.showAllErrorMessages($("#createevent_form"));
            }
            event.preventDefault();
        });
    },
    initElement: function () {
        //////////////
        // Init controls in create/edit event form
        /////////////

        // init CKEditor
        CKEDITOR.replace('Description');
        CKEDITOR.replace('OrganizationDescription');

        onDateTimeChange = function (currentDateTime) {
            console.log(currentDateTime);
        };

        // init date picker
        $('#Event_StartDate_Dpk').datetimepicker({
            //onChangeDateTime: onDateTimeChange,
            format: "d/m/Y H:i:s",
            //mask: true,
            onShow: function (ct) {
                //this.setOptions({
                //    maxDate: $('#Event_EndDate_Dpk').val() ? $('#Event_EndDate_Dpk').val() : false,
                //    maxTime: $('#Event_EndDate_Dpk').val() ? $('#Event_EndDate_Dpk').val() : false
                //})
            },
            timepicker: true
        });
        $('#Event_EndDate_Dpk').datetimepicker({
            format: "d/m/Y H:i:s",
            //mask: true,
            onShow: function (ct) {
                //this.setOptions({
                //    minDate: $('#Event_StartDate_Dpk').val() ? $('#Event_StartDate_Dpk').val() : false,
                //    minTime: $('#Event_StartDate_Dpk').val() ? $('#Event_StartDate_Dpk').val() : false
                //})
            },
            timepicker: true
        });

        this.initControlForTicketForms();
    },
    googleApiCallBackFunction: function () {
        /// <summary>
        /// This function will be call when google api ready for use
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        EventManagement.init();
        EventManagement.initLocationAutoComplete();
    },
    initLocationAutoComplete: function () {
        // Create location searchbox and map

        //var map = new google.maps.Map(document.getElementById('LocationMap'), {
        //    //center: { lat: -33.8688, lng: 151.2195 },
        //    zoom: 13,
        //    mapTypeId: 'roadmap'
        //});

        // Create the search box and link it to the UI element.
        var input = document.getElementById("Location_AutoComplete");
        var searchBox = new google.maps.places.SearchBox(input);

        // Bias the SearchBox results towards current map's viewport.
        //map.addListener('bounds_changed', function () {
        //    searchBox.setBounds(map.getBounds());
        //});

        //var markers = [];

        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function () {
            var places = searchBox.getPlaces();
            if (places.length == 0) {
                return;
            }
            if (places.length > 0) {
                var address = EventManagement.getAddressDetails(places[0]);
                EventManagement.updateAddressDetailsLayout(address);
                EventManagement.updateModeLocationPanel(false);
            }

            // Clear out the old markers.
            //markers.forEach(function (marker) {
            //    marker.setMap(null);
            //});
            //markers = [];

            // For each place, get the icon, name and location.
            //var bounds = new google.maps.LatLngBounds();
            //places.forEach(function (place) {
            //    if (!place.geometry) {
            //        console.log("Returned place contains no geometry");
            //        return;
            //    }
            //    var icon = {
            //        url: place.icon,
            //        size: new google.maps.Size(71, 71),
            //        origin: new google.maps.Point(0, 0),
            //        anchor: new google.maps.Point(17, 34),
            //        scaledSize: new google.maps.Size(25, 25)
            //    };

            //    // Create a marker for each place.
            //    markers.push(new google.maps.Marker({
            //        map: map,
            //        icon: icon,
            //        title: place.name,
            //        position: place.geometry.location
            //    }));

            //    if (place.geometry.viewport) {
            //        // Only geocodes have viewport.
            //        bounds.union(place.geometry.viewport);
            //    } else {
            //        bounds.extend(place.geometry.location);
            //    }
            //});
            //map.fitBounds(bounds);
        });

        $(input).unbind("focus").bind("focus", function () {
            $(this).val("");
        });
    },
    getAddressDetails: function (arrAddress) {
        /// <summary>
        /// Filter returned data to get address  
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        var resultAddress = {
            Address1:{
                long_name: "",
                short_name: ""
            },
            City: {
                long_name: "",
                short_name: ""
            },
            State:{
                long_name: "",
                short_name: ""
            },
            Country: {
                long_name: "",
                short_name: ""
            },
        };

        $.each(arrAddress.address_components, function (i, address_component) {
            if (address_component.types[0] == "country") {
                console.log("country:" + address_component.long_name);
                resultAddress.Country.short_name = address_component.short_name;
                resultAddress.Country.long_name = address_component.long_name;

            }

            if (address_component.types[0] == "administrative_area_level_1") {
                console.log("state:" + address_component.long_name);
                resultAddress.State.short_name = address_component.short_name;
                resultAddress.State.long_name = address_component.long_name;
            }

            if (address_component.types[0] == "administrative_area_level_2") {
                console.log("city:" + address_component.long_name);
                resultAddress.City.short_name = address_component.short_name;
                resultAddress.City.long_name = address_component.long_name;
            }

            if (address_component.types[0] == "route") {
                console.log("route:" + address_component.long_name);
                resultAddress.Address1.short_name = resultAddress.Address1.short_name+ " " + address_component.short_name;
                resultAddress.Address1.long_name = resultAddress.Address1.long_name + " " + address_component.long_name;
            }

            if (address_component.types[0] == "street_number") {
                console.log("street_number:" + address_component.long_name);
                resultAddress.Address1.short_name = address_component.short_name + " " + resultAddress.Address1.short_name;
                resultAddress.Address1.long_name = address_component.long_name + " " + resultAddress.Address1.long_name;
            }
        });

        return resultAddress;
    },
    updateAddressDetailsLayout:function(address){
        // Update value for controls, which using for show address details

        this.model.Location_StreetName = "";
        $("#Location_StreetName").val("");
        this.model.Location_Address = address.Address1.long_name;
        $("#Location_Address").val(address.Address1.long_name || "");
        this.model.Location_Address2 = "";
        $("#Location_Address2").val("");
        this.model.Location_City = address.City.long_name;
        $("#Location_City").val(address.City.long_name || "");
        this.model.Location_State = address.State.long_name;
        $("#Location_State").val(address.State.long_name || "");
        this.model.ZipCode = "";
        $("#Location_ZipCode").val("");
        this.model.Country = address.Country.short_name;
        $("#Country").val(address.Country.short_name || "");
    },
    updateModeLocationPanel:function(isAutoCompleteMode){
        // Update layout depend on mode 
        if (isAutoCompleteMode) {
            $(".autocomplate-location-panel").removeClass("hidden");
            $(".detail-location-panel").removeClass("hidden").addClass("hidden");
        } else {
            $(".autocomplate-location-panel").removeClass("hidden").addClass("hidden");
            $(".detail-location-panel").removeClass("hidden");
        }
    },
    initControlForTicketForms: function () {
        // Init control for exist ticket forms in edit mode 

        var listTicketForms = $("#create_tickets_wrapper #List_Tickets .create-tickets--ticket");

        if (listTicketForms && listTicketForms.length > 0) {
            $.each(listTicketForms, function (index, ticketElement) {
                if (ticketElement) {
                    var startDate = $(ticketElement).find("input[name='TicketStartSaleDate']");
                    var endDate = $(ticketElement).find("input[name='TicketEndSaleDate']");

                    // init date picker
                    $(startDate).datetimepicker({
                        format: "d/m/Y H:i:s",
                        timepicker: true
                    });
                    $(endDate).datetimepicker({
                        format: "d/m/Y H:i:s",
                        timepicker: true
                    });
                }
            });
        }
    },
    deleteEvent: function (id, eventTitle) {
        var title = "Delete event";
        var message = "Are you want to delete " + eventTitle + " event?";
        MessageBox.showMessageBox(title, message, function () {
            $.ajax({
                url: '/Admin/Event/Delete',
                data: { id: id },
                type: 'POST',
                success: function () {
                    window.location.replace("/Admin/Event/Index");
                },
                error: function () {
                    alert("Delete event fail!");
                }
            });
        });
    },
    createEvent: function (serviceUrl, returnUrl) {
        // Create new event

        var requestData = new FormData();
        // get data
        this.getDataOfEvent();
        // get cover image file
        var totalFiles = document.getElementById("CoverImage").files.length;
        for (var i = 0; i < totalFiles; i++)
        {
            var file = document.getElementById("CoverImage").files[i];

            requestData.append("coverImage", file);
        }

        for (key in this.model) {
            if (key == "Tickets") {
                for (var i = 0; i < this.model.Tickets.length; i++) {
                    for (ticketKey in this.model.Tickets[i]) {
                        requestData.append("Tickets[" + i + "]." + ticketKey, EventManagement.model.Tickets[i][ticketKey]);
                    }
                }
            } else {
                requestData.append(key, EventManagement.model[key]);
            }
        }
        //requestData.append("requestModel", this.model);

        // Request to server to create new event
        $.ajax({
            url:serviceUrl,
            data: requestData,
            type: 'POST',
            contentType: false,
            processData: false,
            success: function () {
                window.location.replace(returnUrl);
            },
            error: function () {
                alert("Create event fail!");
            }
        });
    },
    onCreateEventBtnClick: function () {
        $('#event_form').submit();
        $('#event_form').removeClass("validateform").addClass("validateform");
    },
    onCreateEventBtnOnClientSideClick: function () {
        $('#createevent_form').submit();
        $('#createevent_form').removeClass("validateform").addClass("validateform");
    },
    onUpdateEventBtnClick:function(){
        $('#event_form').submit();
        $('#event_form').removeClass("validateform").addClass("validateform");
    },
    updateEvent:function(){
        // Update event

        var requestData = new FormData();
        // get data
        this.getDataOfEvent();
        // get cover image file
        var totalFiles = document.getElementById("CoverImage").files.length;
        for (var i = 0; i < totalFiles; i++) {
            var file = document.getElementById("CoverImage").files[i];

            requestData.append("coverImage", file);
        }

        for (key in this.model) {
            if (key == "Tickets") {
                for (var i = 0; i < this.model.Tickets.length; i++) {
                    for (ticketKey in this.model.Tickets[i]) {
                        requestData.append("Tickets[" + i + "]." + ticketKey, EventManagement.model.Tickets[i][ticketKey]);
                    }
                }
            } else {
                requestData.append(key, EventManagement.model[key]);
            }
        }

        // Request to server to create new event
        $.ajax({
            url: '/Admin/Event/Edit',
            data: requestData,
            type: 'POST',
            contentType: false,
            processData: false,
            success: function () {
                window.location.replace("/Admin/Event/Index");
            },
            error: function () {
                alert("Update event fail!");
            }
        });
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
    getDataOfEvent:function(){
        // collect data of new event and update to model
        this.model.Id = $("#EventId").val() || null;
        this.model.Title = $("#Title").val()|| "";
        this.model.Location_StreetName = $("#Location_StreetName").val() || "";
        this.model.Location_Address = $("#Location_Address").val() || "";
        this.model.Location_Address2 = $("#Location_Address2").val() || "";
        this.model.Location_City = $("#Location_City").val() || "";
        this.model.Location_State = $("#Location_State").val() || "";
        this.model.ZipCode = $("#Location_ZipCode").val();
        this.model.Country = $("#Country").val()|| "";
        this.model.StartDate = $("#Event_StartDate_Dpk").val() || "";
        this.model.EndDate = $("#Event_EndDate_Dpk").val() || "";
        this.model.Description = CKEDITOR.instances.Description.getData() || "";
        this.model.OrganizationName = $("#OrganizationName").val()|| "";
        this.model.OrganizationDescription = CKEDITOR.instances.OrganizationDescription.getData() || "";
        this.model.PaymentEmail = $("#PaymentEmail").val() || "";
        this.model.EventType = $("#EventType").val()|| "";
        this.model.EventTopic = $("#EventTopic").val() || "";
        this.model.Status = $("#EventStatus").val() || "";
        this.model.SortOrder = $("#EventOrder").val() || "";
        this.model.IsVerified = $("#IsVerified").prop("checked") || false;
        this.model.IsShowRemainingNumberTicket = $("#IsShowRemainingNumberTicket").prop("checked") || false;
        this.model.Tickets = this.getDataOfTickets() || [];
    },
    getDataOfTickets:function(){
        // Get list tickets
        var retListTickets = [];
        var listTicketElements = $("#List_Tickets .create-tickets--ticket");
        if (listTicketElements && listTicketElements.length>0) {
            $.each(listTicketElements, function (index, ticketElement) {
                var ticket = new TicketEvent();
                ticket.Id = $(ticketElement).find("[name = 'TicketId']").val() || null;
                ticket.Name = $(ticketElement).find("[name = 'TicketName']").val() || "";
                ticket.Quantity = $(ticketElement).find("[name = 'TicketQuantity']").val()|| 0;
                ticket.Price = $(ticketElement).find("[name = 'TicketPrice']").val() || 0;
                ticket.Description = $(ticketElement).find("[name = 'TicketDescription']").val()|| "";
                ticket.IsShowDescription = $(ticketElement).find("[name = 'IsShowDescription']").prop("checked") || true;
                ticket.SaleChanel = $(ticketElement).find("[name = 'SaleChanel']").val()|| 0;
                ticket.MinimunTicketOrder = $(ticketElement).find("[name = 'OrderTicketMinimun']").val() || 1;
                ticket.MaximunTicketOrder = $(ticketElement).find("[name = 'OrderTicketMaximun']").val() || 10;
                ticket.StartSaleDateTime = $(ticketElement).find("[name = 'TicketStartSaleDate']").val() || ""
                ticket.EndSaleDateTime = $(ticketElement).find("[name = 'TicketEndSaleDate']").val() || "";
                ticket.Type = $("#TicketType").val();

                retListTickets.push(ticket);
            });
        }

        return retListTickets;
    },
    onCreateTicket: function () {
        // Add new ticket depend on ticket type
        var ticketType = $("#TicketType").val();

        if (ticketType) {
            this.addNewTicket(ticketType);
        } else {
            alert("Please choose type of ticket before add ticket");
        }
    },
    addNewTicket:function(type){
        // Add a new ticket on list

        var listTicketConatiner = $("#create_tickets_wrapper #List_Tickets");
        var ticketElement;

        switch (type) {
            case TicketType.Free:
                ticketElement = listTicketConatiner.append($(this.template.getFreeTicketTemplate()));
                break;
            case TicketType.Paid:
                ticketElement = listTicketConatiner.append($(this.template.getPaidTicketTemplate()));
                break;
            case TicketType.Donation:
                ticketElement = listTicketConatiner.append($(this.template.getDonationTicketTemplate()));
                break;
            default:
                ticketElement = listTicketConatiner.append($(this.template.getFreeTicketTemplate()));
                break;
        }

        if (ticketElement == null) { return; }

        var startDate = $(ticketElement).find("input[name='TicketStartSaleDate']");
        var endDate = $(ticketElement).find("input[name='TicketEndSaleDate']");
        // init date picker
        $(startDate).datetimepicker({
            //onChangeDateTime: onDateTimeChange,
            format: "d/m/Y H:i:s",
            //mask: true,
            onShow: function (ct) {
                //this.setOptions({
                //    maxDate: $(endDate).val() ? $(endDate).val() : false,
                //    maxTime: $(endDate).val() ? $(endDate).val() : false
                //})
            },
            timepicker: true
        });
        $(endDate).datetimepicker({
            format: "d/m/Y H:i:s",
            //mask: true,
            onShow: function (ct) {
                //this.setOptions({
                //    minDate: $(startDate).val() ? $(endDate).val() : false,
                //    minTime: $(startDate).val() ? $(endDate).val() : false
                //})
            },
            timepicker: true
        });
    },
    onRemoveTicketBtnClick:function(e){
        // On remove ticket button click

        $(e).closest(".create-tickets--ticket").remove();
    },
    removeAllTicket:function(){
        // Remove all ticket in list and update capacity of form

        $("#create_tickets_wrapper #List_Tickets").empty();
        $("#TotalTicketCapacity").text("0");
    },
    expandTicketSettingForm: function (e) {
        // Collapse or expand tiket setting details

        var settingDetailsPanel = $(e).closest(".create-tickets--ticket").find(".ticket-settings.settings");
        if (settingDetailsPanel) {
            $(settingDetailsPanel).toggleClass("hidden");
        }
    },
    onBackToIndexBtnClick:function(){
        // Redirect to index page of event management area

        window.location.replace("/Admin/Event/Index");
    },
    onBackToIndexClientSideBtnClick: function () {
        // Redirect to index page of event management area

        window.location.replace("/Home/Index");
    },
    showSpin: function (target) {
        /// <summary>
        /// Create spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>s

        $("#images").append(EventManagement.controls.spin.spin().el);
    },
    hideSpin: function () {
        /// <summary>
        /// Hide spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        EventManagement.controls.spin.stop();
    },
    model: {
        Id : null,
        Title : "",
        StartDate : null,
        EndDate : null, 
        Description :"",
        OrganizationName : "",
        OrganizationDescription :"",
        CoverImage :null,
        PaymentEmail :"",
        EventType :"",
        EventTopic :"",
        SubTopic : "",
        IsShowRemainingNumberTicket :false,
        Location_StreetName :"",
        Location_Address :"",
        Location_Address2 :"",
        Location_City :"",
        Location_State :"",
        ZipCode :"",
        Country :"",
        Status : 0,
        SortOrder :null,
        IsVerified :false,
        Tickets :[]
    },
    template: {
        getFreeTicketTemplate: function () {
            // Get html template of free ticket form

            var template = $("#CreateTicketTemplates .free-ticket").clone();
            return template;
        },
        getPaidTicketTemplate: function () {
            // Get html template of paid ticket form

            var template = $("#CreateTicketTemplates .paid-ticket").clone();
            return template;
        },
        getDonationTicketTemplate: function () {
            // Get html template of donation ticket form

            var template = $("#CreateTicketTemplates .donation-ticket").clone();
            return template;
        },
    }
};