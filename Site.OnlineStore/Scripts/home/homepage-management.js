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

        //this.bindEventForElement();
        //this.initElement();
        this.getEventsInLocation();
    },
    controls: {
        spin: null
    },
    getEventsInLocation: function (country, city) {
        /// <summary>
        /// Request to server to get all events in specific location
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>s

        // Request to server to create new event
        $.ajax({
            url: '/Home/GetEventsInCurrentLocation',
            type: 'POST',
            data: { country: "VN", city: "da nang" },
            success: function (result) {
                console.log(result);
                $("#content .js-popular-events .js-events-list").empty();
                $("#content .js-popular-events .js-events-list").append(result);
            },
            error: function () {
                alert("Get events fail!");
            }
        });
    },
    getCurrentLocation: function () {

        //var map = new google.maps.Map(document.getElementById('map'), {
        //    center: { lat: -34.397, lng: 150.644 },
        //    zoom: 6
        //});
        //var infoWindow = new google.maps.InfoWindow({ map: map });

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                //var pos = {
                //    lat: position.coords.latitude,
                //    lng: position.coords.longitude
                //};

                //infoWindow.setPosition(pos);
                //infoWindow.setContent('Location found.');
                //map.setCenter(pos);

                console.log(position);
            }, function () {
                //handleLocationError(true, infoWindow, map.getCenter());
                alert("error");
            });
        } else {
            // Browser doesn't support Geolocation
            //handleLocationError(false, infoWindow, map.getCenter());
            alert("error");
        }

    },
    handleLocationError: function (browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
    },
    showSpin: function (target) {
        /// <summary>
        /// Create spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>s

        $("#images").append(HomePageManagement.controls.spin.spin().el);
    },
    hideSpin: function () {
        /// <summary>
        /// Hide spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        HomePageManagement.controls.spin.stop();
    }
}