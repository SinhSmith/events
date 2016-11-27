var DateFilterEnum = {
    AllDates : 0,
    Today: 1,
    Tomorrow: 2,
    ThisWeek: 3,
    ThisWeekend: 4,
    NextWeek: 5,
    NextMonth: 6,
    CustomDate:7
}

var DisplayEventsManagement = DisplayEventsManagement || {};
DisplayEventsManagement = {
    init: function () {
        // support ajax to upload images
        window.addEventListener("submit", function (e) {
            DisplayEventsManagement.showSpin();
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

                                    DisplayEventsManagement.hideSpin();
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

        this.initElement();
        this.bindEventForElement();
    },
    controls: {
        spin: null
    },
    initElement:function(){
        // Init components for page

        $('#Txt_CustomDate_StartDate').datetimepicker({
            onChangeDateTime: $.proxy(DisplayEventsManagement.updateFiltersModel, DisplayEventsManagement),
            format: "d/m/Y",
            mask: true,
            timepicker: false
        });
        $('#Txt_CustomDate_EndDate').datetimepicker({
            onChangeDateTime: $.proxy(DisplayEventsManagement.updateFiltersModel,DisplayEventsManagement),
            format: "d/m/Y",
            mask: true,
            timepicker: false
        });

        
    },
    initPagingControl: function (numberItems, itemsOnPage) {
        // Init paging control 

        $(".js-pagination-container").empty();
        $(".js-pagination-container").pagination({
            items: numberItems || 0,
            itemsOnPage: itemsOnPage,
            cssStyle: 'light-theme',
            prevText: '<',
            nextText: '>',
            onPageClick: onPaging,
            currentPage: DisplayEventsManagement.model.filterRules.Index
        });

        function onPaging(pageNumber, event) {
            DisplayEventsManagement.model.filterRules.Index = pageNumber;
            DisplayEventsManagement.searchEventWithFilters();
        }
    },
    bindEventForElement: function () {
        // Init event for elements in page

        $("#Txt_EventSearchBox").unbind("change").bind("change", function () {
            DisplayEventsManagement.updateFiltersModel();
            DisplayEventsManagement.searchEventWithFilters();
        });

        // Bind event for filter by event topic controls
        $(".ckb-event-topic").unbind("change").bind("change", function () {
            var id = $(this).data("id");
            if (id == 0) {
                $(".ckb-event-topic:not([data-id = 0])").prop("checked", false);
            } else {
                $(".ckb-event-topic[data-id = 0]").prop("checked", false);
            }
            DisplayEventsManagement.updateFiltersModel();
            DisplayEventsManagement.searchEventWithFilters();
        });

        // Bind event for filter by event type controls
        $(".ckb-event-type").unbind("change").bind("change", function () {
            var id = $(this).data("id");
            if (id == 0) {
                $(".ckb-event-type:not([data-id = 0])").prop("checked", false);
            } else {
                $(".ckb-event-type[data-id = 0]").prop("checked", false);
            }
            DisplayEventsManagement.updateFiltersModel();
            DisplayEventsManagement.searchEventWithFilters();
        });

        // Bind event for filter price controls
        $("input[name='rdo_price_filter']").unbind("change").bind("change", function () {
            DisplayEventsManagement.updateFiltersModel();
            DisplayEventsManagement.searchEventWithFilters();
        });

        // Bind event for filter date controls
        $("input[name='rdo_date_filter']").unbind("change").bind("change", function (e) {
            DisplayEventsManagement.updateFiltersModel();
            if ($($("input[name='rdo_date_filter']:checked")[0]).data("id") == DateFilterEnum.CustomDate) {
                $(".custom-date-section").removeClass("hidden");
            } else {
                $(".custom-date-section").removeClass("hidden").addClass("hidden");
                DisplayEventsManagement.searchEventWithFilters();
            }
        });

        $("#Btn_UpdateCustomDateFilter").unbind("click").bind("click", function () {
            DisplayEventsManagement.searchEventWithFilters();
        })

        // Bind event for sort controls
        $(".js-sort-btn").unbind("click").bind("click", function () {
            var id = $(this).data("id");
            $(".js-sort-btn").removeClass("is-selected");
            $(this).addClass("is-selected");
            DisplayEventsManagement.model.filterRules.SortBy = id;
            DisplayEventsManagement.searchEventWithFilters();
        });

        // Bind event for bookmark buttons
        $("#EventList a.js-d-bookmark").unbind("click").bind("click", function (e) {
            var that = this;
            var userName = $("#currentUserName").val();
            if (userName == null || userName == "") {
                DisplayEventsManagement.showBookMarkLoginPopUp();
            } else {

                var isSaved = $(that).hasClass("saved");
                var eventId = $(that).data("eventid");
                if (isSaved) {
                    DisplayEventsManagement.removeBookMarkEvent(eventId, function () {
                        $(that).removeClass("saved");
                        $(that).removeClass("bookmarked");
                        $(that).find("i").removeClass("ico-bookmarked").addClass("ico-bookmark");
                    });
                } else {
                    DisplayEventsManagement.bookMarkEvent(eventId, function () {
                        $(that).removeClass("saved").addClass("saved");
                        $(that).removeClass("bookmarked").addClass("bookmarked");
                        $(that).find("i").removeClass("ico-bookmark").addClass("ico-bookmarked");
                    });
                }
            }
        });
    },
    getEventsInLocation: function (country,state, city) {
        /// <summary>
        /// Request to server to get all events in specific location
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>s

        DisplayEventsManagement.showSpin();
        $.ajax({
            url: '/Home/GetEventsInCurrentLocation',
            type: 'POST',
            data: { country: country,state:state, city: city },
            success: function (result) {
                console.log(result);
                $("#content .js-popular-events .js-events-list").empty();
                $("#content .js-popular-events .js-events-list").append(result);
            },
            error: function () {
                console.log("Get events fail!");
            },
            complete: function () {
                DisplayEventsManagement.hideSpin();
            }
        });
    },
    googleApiCallBackFunction: function () {
        /// <summary>
        /// This function will be call when google api ready for use
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        DisplayEventsManagement.init();
        this.initLocationAutoComplete();
    },
    getAddressDetails: function (arrAddress) {
        /// <summary>
        /// Filter returned data to get address  
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        var resultAddress = {
            City: {
                long_name: "",
                short_name: ""
            },
            State: {
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
        });

        return resultAddress;
    },
    initLocationAutoComplete: function () {
        // Create location searchbox and map

        var map = new google.maps.Map(document.getElementById('LocationMap'), {
            //center: { lat: -33.8688, lng: 151.2195 },
            zoom: 13,
            mapTypeId: 'roadmap'
        });

        // Create the search box and link it to the UI element.
        var input = document.getElementById("SearchLocation_AutoComplete");
        var searchBox = new google.maps.places.SearchBox(input);

        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function () {
            searchBox.setBounds(map.getBounds());
        });

        var markers = [];

        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function () {
            var map = new google.maps.Map(document.getElementById('LocationMap'), {
                //center: { lat: -33.8688, lng: 151.2195 },
                zoom: 13,
                mapTypeId: 'roadmap'
            });
            var places = searchBox.getPlaces();
            if (places.length == 0) {
                return;
            }
            if (places.length > 0) {
                DisplayEventsManagement.model.selectedLocation = DisplayEventsManagement.getAddressDetails(places[0]);
                DisplayEventsManagement.updateFiltersModel();
                DisplayEventsManagement.searchEventWithFilters();
            }

            // Clear out the old markers.
            markers.forEach(function (marker) {
                marker.setMap(null);
            });
            markers = [];

            // For each place, get the icon, name and location.
            var bounds = new google.maps.LatLngBounds();
            places.forEach(function (place) {
                if (!place.geometry) {
                    console.log("Returned place contains no geometry");
                    return;
                }
                var icon = {
                    url: place.icon,
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(25, 25)
                };

                // Create a marker for each place.
                markers.push(new google.maps.Marker({
                    map: map,
                    icon: icon,
                    title: place.name,
                    position: place.geometry.location
                }));

                if (place.geometry.viewport) {
                    // Only geocodes have viewport.
                    bounds.union(place.geometry.viewport);
                } else {
                    bounds.extend(place.geometry.location);
                }
            });
            map.fitBounds(bounds);
        });

        $(input).unbind("focus").bind("focus", function () {
            $(this).val("");
        });
    },
    initControlsInFilterPanel:function(){
        // Init Collapse control
    },
    handleLocationError: function (browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
    },
    searchEventWithFilters:function(){
        // Request to server to get list events match with filter rules

        DisplayEventsManagement.showSpin();

        $.ajax({
            url: '/Event/SearchEvent',
            type: 'POST',
            data: JSON.stringify(DisplayEventsManagement.model.filterRules),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (result) {
                if (result.Events) {
                    DisplayEventsManagement.updateFilterRules(result);
                    DisplayEventsManagement.updateListEvents(result.Events);
                }
            },
            error: function (e) {
                console.log("Get events fail!");
            },
            complete: function () {
                DisplayEventsManagement.hideSpin();
            }
        });
    },
    generateEventItem: function (event) {
        // summary event item template 

        var itemTemplate = "";
        itemTemplate += "<div class=\"list-card-v2 l-mar-top-2 js-d-poster\" >";
        itemTemplate += "    <a href=\"\/Event\/EventDetails?id="+event.Id+"\"";
        itemTemplate += "       class=\"list-card__main js-event-link js-xd-janus-checkpoint-link\">";
        itemTemplate += "        <div class=\"list-card__header\">";
        itemTemplate += "            <div class=\"list-card__image\" style=\"background-color:#5b5355;\">";
        itemTemplate += "                    <img src=\""+event.CoverImage+"\" alt=\"Image not found\" title=\""+event.Title+"\" class=\"js-poster-image\" \/>";
        itemTemplate += "            <\/div>";
        itemTemplate += "            <span class=\"list-card__label\">" + event.ListOrderPricePrice.join(" - ")+ "<\/span>";
        itemTemplate += "        <\/div>";
        itemTemplate += "        <div class=\"list-card__body\">";
        itemTemplate += "            <time class=\"list-card__date\" style=\"box-sizing:content-box;\">";
        itemTemplate +=                 event.StartDate;
        itemTemplate += "            <\/time>";
        itemTemplate += "            <div class=\"list-card__title\">";
        itemTemplate +=                 event.Title;
        itemTemplate += "            <\/div>";
        itemTemplate += "            <div class=\"list-card__venue\">";
        itemTemplate +=                 event.Location_State+", "+event.Country;
        itemTemplate += "            <\/div>";
        itemTemplate += "        <\/div>";
        itemTemplate += "    <\/a>";
        itemTemplate += "    <div class=\"list-card__footer\">";
        itemTemplate += "        <div class=\"list-card__tags\">";
        //itemTemplate += "            <a>"+event.EventTopic+"<\/a>";
        //itemTemplate += "            <a>"+event.EventType+"<\/a>";
        itemTemplate += "        <\/div>";
        itemTemplate += "        <div class=\"list-card__actions\">";
        itemTemplate += "            <a href=\"\" class=\"js-share-event-card share-action\" title=\"Share\">";
        itemTemplate += "                <i class=\"ico-share ico--medium\"><\/i>";
        itemTemplate += "                <span class=\"is-hidden-accessible\">Share this event<\/span>";
        itemTemplate += "            <\/a>";
        if (event.IsBookMarked) {
            itemTemplate += "            <a class=\"js-d-bookmark bookmarked saved\" data-eventId='" + event.Id + "'>";
            itemTemplate += "                <i class=\"ico-bookmarked ico--medium\"><\/i>";
            itemTemplate += "                <span class=\"is-hidden-accessible\">";
            itemTemplate += "                    Event Bookmarked";
            itemTemplate += "                <\/span>";
            itemTemplate += "            <\/a>";
        } else {
            itemTemplate += "            <a class=\"js-d-bookmark\" data-eventId='" + event.Id + "'>";
            itemTemplate += "                <i class=\"ico-bookmark ico--medium\"><\/i>";
            itemTemplate += "                <span class=\"is-hidden-accessible\">";
            itemTemplate += "                    Event Bookmarked";
            itemTemplate += "                <\/span>";
            itemTemplate += "            <\/a>";
        }

        itemTemplate += "        <\/div>";
        itemTemplate += "    <\/div>";
        itemTemplate += "<\/div>";

        return itemTemplate;
    },
    updateFiltersModel: function () {
        // Update search string
        this.model.filterRules.SearchString = $("#Txt_EventSearchBox").val().trim();

        // Update location
        this.model.filterRules.Country = this.model.selectedLocation.Country.short_name;
        this.model.filterRules.State = this.model.selectedLocation.State.short_name;
        this.model.filterRules.City = this.model.selectedLocation.City.short_name;

        // Update list event topics
        this.model.filterRules.Topics = [];
        var listCheckBoxElement = $(".ckb-event-topic:checked");
        $.each(listCheckBoxElement, function (index, item) {
            var id = $(item).data("id");
            if (id != 0) {
                DisplayEventsManagement.model.filterRules.Topics.push(id);
            }
        });

        // Update list event types
        this.model.filterRules.EventTypes = [];
        var listCheckBoxElement = $(".ckb-event-type:checked");
        $.each(listCheckBoxElement, function (index, item) {
            var id = $(item).data("id");
            if (id != 0) {
                DisplayEventsManagement.model.filterRules.EventTypes.push(id);
            }
        });

        // Update price
        this.model.filterRules.Price = $($("input[name='rdo_price_filter']:checked")[0]).data("id");

        // Update date
        this.model.filterRules.DateFilterType = $($("input[name='rdo_date_filter']:checked")[0]).data("id");
        if (DisplayEventsManagement.model.filterRules.DateFilterType == DateFilterEnum.AllDates) {
            DisplayEventsManagement.model.filterRules.StartDate = $("#Txt_CustomDate_StartDate").val() || null;
            DisplayEventsManagement.model.filterRules.EndDate = $("#Txt_CustomDate_EndDate").val() || null;
        } else {
            // Reset value of datetimepicker control
            $("#Txt_CustomDate_StartDate").val("");
            $("#Txt_CustomDate_EndDate").val("");
            // Reset model
            DisplayEventsManagement.model.filterRules.StartDate = null;
            DisplayEventsManagement.model.filterRules.EndDate = null;
        }
    },
    getFilterRules: function () {
        // Get filter rules from layout

        this.model.filterRules.Country = this.model.selectedLocation.Country.short_name;
        this.model.filterRules.State = this.model.selectedLocation.State.long_name;
        this.model.filterRules.City = this.model.selectedLocation.City.long_name;

        return this.model.filterRules;
    },
    updateFilterRules:function(model){
        // Update filter rule model and filter layout

        this.model.filterRules.Topics = model.Topics;
        this.model.filterRules.EventTypes = model.EventTypes;
        
        // init paging control
        DisplayEventsManagement.initPagingControl(model.TotalEvents, this.model.filterRules.NumberOfResultsPerPage);
    },
    updateListEvents:function(events){
        // Update list event results

        $("#EventList").empty();

        if (events && events.length > 0) {
            $.each(events, function (index, event) {
                $("#EventList").append(DisplayEventsManagement.generateEventItem(event));
            });

            $("#EventList a.js-d-bookmark").unbind("click").bind("click", function (e) {
                var that = this;
                var userName = $("#currentUserName").val();
                if (userName == null || userName == "") {
                    DisplayEventsManagement.showBookMarkLoginPopUp();
                } else {

                    var isSaved = $(that).hasClass("saved");
                    var eventId = $(that).data("eventid");
                    if (isSaved) {
                        DisplayEventsManagement.removeBookMarkEvent(eventId, function () {
                            $(that).removeClass("saved");
                            $(that).removeClass("bookmarked");
                            $(that).find("i").removeClass("ico-bookmarked").addClass("ico-bookmark");
                        });
                    } else {
                        DisplayEventsManagement.bookMarkEvent(eventId, function () {
                            $(that).removeClass("saved").addClass("saved");
                            $(that).removeClass("bookmarked").addClass("bookmarked");
                            $(that).find("i").removeClass("ico-bookmark").addClass("ico-bookmarked");
                        });
                    }
                }
            });
        } else {
            $("#EventList").append("<h3>Sorry, no  events found. Try another search or adjust your filters.</h3>")
        }
        
    },
    updateDataAndLayoutInSearchMode:function(model){
        // Call when page in search mode

        // Update model
        this.model.filterRules.City = model.City;
        this.model.filterRules.State = model.State;
        this.model.filterRules.Country = model.Country;
        this.model.selectedLocation.City.short_name = model.City;
        this.model.selectedLocation.State.short_name = model.State;
        this.model.selectedLocation.Country.short_name = model.Country;
        this.model.filterRules.DateFilterType = model.DateFilterType;
        this.model.filterRules.Topics = model.Topics;
        this.model.filterRules.EventTypes = model.EventTypes;

        // Update layout
        var address = "";
        if (this.model.filterRules.State != null && this.model.filterRules.State != "") {
            address = address + this.model.filterRules.State;
        }
        if (this.model.filterRules.Country != null && this.model.filterRules.Country != "") {
            address = address + ", " + this.model.filterRules.Country;
        }
        $("#SearchLocation_AutoComplete").val(address);
        if(this.model.filterRules.Topics && this.model.filterRules.Topics.length>0){
            $.each(this.model.filterRules.Topics,function(index,item){
                $("#ckb-event-topic-" + item).prop("checked", true);
            });
        } else {
            $("#ckb-event-topic-0").prop("checked", true);
        }

        if (this.model.filterRules.EventTypes && this.model.filterRules.EventTypes.length > 0) {
            $.each(this.model.filterRules.EventTypes, function (index, item) {
                $("#ckb-event-type-" + item).prop("checked", true);
            });
        } else {
            $("#ckb-event-type-0").prop("checked", true);
        }

        // init paging control
        DisplayEventsManagement.initPagingControl(model.TotalEvents, this.model.filterRules.NumberOfResultsPerPage);
        // Update map
        DisplayEventsManagement.updateMapForNewLocation(model.City + ", " + model.State + ", " + model.Country);
    },
    updateMapForNewLocation: function (address) {

        var map = new google.maps.Map(document.getElementById('LocationMap'), {
            //center: { lat: -33.8688, lng: 151.2195 },
            zoom: 13,
            mapTypeId: 'roadmap'
        });
        geocoder = new google.maps.Geocoder();
        var address = address; //input box value
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
    showBookMarkLoginPopUp: function () {
        // Show pop up to inform client login before bookmark a event

        $("#BookMark_Login_Modal").modal("hide");
        $("#BookMark_Login_Modal").modal("show");
    },
    bookMarkEvent: function (eventId, callback) {
        // Bookmark a event

        DisplayEventsManagement.showSpin();
        $.ajax({
            type: "post",
            url: "/UserResources/AddEventBookMark",
            data: { eventId: eventId },
            dataType: 'json',
            success: function (result) {
                if (result.Success) {
                    if (callback && typeof (callback) == 'function') {
                        callback();
                    }
                    console.log("Bookmark this event successful!");
                } else {
                    console.log("Error: bookmark this event fail!");
                }
            },
            error: function () {
                console.log("Error: bookmark this event fail!");
            },
            complete: function () {
                DisplayEventsManagement.hideSpin();
            }
        });
    },
    removeBookMarkEvent: function (eventId, callback) {
        // Bookmark a event

        DisplayEventsManagement.showSpin();
        $.ajax({
            type: "post",
            url: "/UserResources/RemoveEventBookMark",
            data: { eventId: eventId },
            dataType: 'json',
            success: function (result) {
                if (result.Success) {
                    if (callback && typeof (callback) == 'function') {
                        callback();
                    }
                    console.log("Remove Bookmark of this event successful!");
                } else {
                    console.log("Error: Remove bookmark this event fail!");
                }
            },
            error: function () {
                console.log("Error: Remove bookmark this event fail!");
            },
            complete: function () {
                DisplayEventsManagement.hideSpin();
            }
        });
    },
    showSpin: function (target) {
        /// <summary>
        /// Create spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>s

        $("#EventList").append(DisplayEventsManagement.controls.spin.spin().el);
    },
    hideSpin: function () {
        /// <summary>
        /// Hide spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        DisplayEventsManagement.controls.spin.stop();
    },
    model: {
        selectedLocation:{
            Country:{
                long_name:"",
                short_name:""
            },
            State:{
                long_name:"",
                short_name:""
            },
            City:{
                long_name:"",
                short_name:""
            }
        },
        filterRules:{
            Topics: [],
            EventTypes: [],
            SortBy: 1,
            Price: 2,
            DateFilterType:0,
            StartDate: null,
            EndDate: null,
            Index: 1,
            Country: "",
            State: "",
            City: "",
            SearchString:"",
            NumberOfResultsPerPage: 10
        }
    }
}