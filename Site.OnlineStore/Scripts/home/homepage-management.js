var HomePageManagement = HomePageManagement || {};
HomePageManagement = {
    init: function () {
        // support ajax to upload images
        window.addEventListener("submit", function (e) {
            HomePageManagement.showSpin();
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

                                    HomePageManagement.hideSpin();
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
    bindEventForElement: function () {
        // Bind event for controls in page

        $("a.category-card").unbind("click").bind("click", function () {
            var filterType = $(this).data("type");
            var id = $(this).data("id");
            HomePageManagement.searchEventByCategory(filterType, id);
        });

        $("a.js-d-bookmark").unbind("click").bind("click", function (e) {
            debugger
            var that = this;
            var userName = $("#currentUserName").val();
            if (userName == null || userName == "") {
                HomePageManagement.showBookMarkLoginPopUp();
            } else {
            
                var isSaved = $(that).hasClass("saved");
                var eventId = $(that).data("eventid");
                if (isSaved) {
                    HomePageManagement.removeBookMarkEvent(eventId,function () {
                        $(that).removeClass("saved");
                        $(that).removeClass("bookmarked");
                    });
                } else {
                    HomePageManagement.bookMarkEvent(eventId,function () {
                        $(that).removeClass("saved").addClass("saved");
                        $(that).removeClass("bookmarked").addClass("bookmarked");
                    });
                }
            }
        });
    },
    searchEventByCategory: function (filterType, id) {
        // search events by category

        var url = "/Event/SearchEvent/?";
        url += "City=" + this.model.CurrentLocation.City.short_name + "&";
        url += "State=" + this.model.CurrentLocation.State.short_name + "&";
        url += "Country=" + this.model.CurrentLocation.Country.short_name + "&";
        switch (filterType) {
            case 0:
                url += "Topic=" + id + "&";
                break;
            case 1:
                url += "EventType=" + id + "";
                break;
        }

        window.location.replace(url);
    },
    getEventsInLocation: function (country, state, city) {
        /// <summary>
        /// Request to server to get all events in specific location
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>s

        HomePageManagement.showSpin();

        $.ajax({
            url: '/Home/GetEventsInCurrentLocation',
            type: 'POST',
            data: { country: country, state: state, city: city },
            success: function (result) {
                console.log(result);
                $("#content .js-popular-events .js-events-list").empty();
                $("#content .js-popular-events .js-events-list").append(result);
                HomePageManagement.bindEventForElement();
            },
            error: function () {
                console.log("Get events fail!");
            }, complete: function () {
                HomePageManagement.hideSpin();
            }
        });
    },
    googleApiCallBackFunction: function () {
        /// <summary>
        /// This function will be call when google api ready for use
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        this.getCurrentLocation();
        this.initLocationAutoComplete();
    },
    getCurrentLocation: function () {
        /// <summary>
        /// Using google api to get information of current location
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>s

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var geocoder = new google.maps.Geocoder();
                var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

                geocoder.geocode({ 'latLng': latlng }, function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        var address = HomePageManagement.getAddressDetails(results[0]);
                        HomePageManagement.model.CurrentLocation = address;
                        $("#Txt_CityFilter").val(address.City.short_name);
                        $("#Txt_StateFilter").val(address.State.short_name);
                        $("#Txt_CountryFilter").val(address.Country.short_name);

                        HomePageManagement.getEventsInLocation(address.Country.short_name, address.State.short_name, address.City.short_name);
                        // Update title on list events in current location
                        $(".js-search-bar .js-displayed-consumer-location").empty().append(address.City.long_name + ", " + address.State.long_name + ", " + address.Country.long_name);
                    };
                });
            }, function () {
                console.log("Cannot get current location");
            });
        } else {
            // Browser doesn't support Geolocation
            console.log("Browser doesn't support Geolocation");
        }

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
        // Create the search box and link it to the UI element.
        var input = document.getElementById("EventLocation_AutoComplete");
        var searchBox = new google.maps.places.SearchBox(input);

        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function () {
            var places = searchBox.getPlaces();

            if (places.length > 0) {
                HomePageManagement.model.CurrentLocation = HomePageManagement.getAddressDetails(places[0]);
                $("#Txt_CityFilter").val(HomePageManagement.model.CurrentLocation.City.short_name);
                $("#Txt_StateFilter").val(HomePageManagement.model.CurrentLocation.State.short_name);
                $("#Txt_CountryFilter").val(HomePageManagement.model.CurrentLocation.Country.short_name);
            }
        });
    },
    handleLocationError: function (browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
    },
    redirectToDisplayEventsPage: function (city, state, country, searchString, datefilter) {
        var token = $('input[name="__RequestVerificationToken"]').val();
        $.post("/Event/SearchEvent", { City: city, State: state, country: country, SearchString: searchString, DateFilterType: datefilter, __RequestVerificationToken: token });
    },
    showSpin: function (target) {
        /// <summary>
        /// Create spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>s

        $(".js-events-list").append(HomePageManagement.controls.spin.spin().el);
    },
    hideSpin: function () {
        /// <summary>
        /// Hide spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        HomePageManagement.controls.spin.stop();
    },
    showBookMarkLoginPopUp:function(){
        // Show pop up to inform client login before bookmark a event

        $("#BookMark_Login_Modal").modal("hide");
        $("#BookMark_Login_Modal").modal("show");
    },
    bookMarkEvent: function (eventId, callback) {
        // Bookmark a event

        HomePageManagement.showSpin();
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
                HomePageManagement.hideSpin();
            }
        });
    },
    removeBookMarkEvent: function (eventId, callback) {
        // Bookmark a event

        HomePageManagement.showSpin();
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
                HomePageManagement.hideSpin();
            }
        });
    },
    model: {
        CurrentLocation: null
    }
}