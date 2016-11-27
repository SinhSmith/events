var SavedEventsAndTicketsDisplay = {
    init: function () {
        // support ajax to upload images
        window.addEventListener("submit", function (e) {
            SavedEventsAndTicketsDisplay.showSpin();
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

                                    SavedEventsAndTicketsDisplay.hideSpin();
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
        // Bind events for controls

        $('#TabStripEvents a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        })

        $("#savedevents a.js-d-bookmark").unbind("click").bind("click", function (e) {
            var that = this;
            var isSaved = $(that).hasClass("saved");
            var eventId = $(that).data("eventid");
            if (isSaved) {
                SavedEventsAndTicketsDisplay.removeBookMarkEvent(eventId,function () {
                    $(that).removeClass("saved");
                    $(that).removeClass("bookmarked");
                    $(that).find("i").removeClass("ico-bookmarked").addClass("ico-bookmark");
                });
            } else {
                SavedEventsAndTicketsDisplay.bookMarkEvent(eventId,function () {
                    $(that).removeClass("saved").addClass("saved");
                    $(that).removeClass("bookmarked").addClass("bookmarked");
                    $(that).find("i").removeClass("ico-bookmark").addClass("ico-bookmarked");
                });
            }
        });
    },
    bookMarkEvent: function (eventId, callback) {
        // Bookmark a event

        SavedEventsAndTicketsDisplay.showSpin("#savedevents");
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
                SavedEventsAndTicketsDisplay.hideSpin();
            }
        });
    },
    removeBookMarkEvent: function (eventId, callback) {
        // Bookmark a event

        SavedEventsAndTicketsDisplay.showSpin("#savedevents");
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
                SavedEventsAndTicketsDisplay.hideSpin();
            }
        });
    },
    showSpin: function (target) {
        /// <summary>
        /// Create spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>s

        $(target).append(SavedEventsAndTicketsDisplay.controls.spin.spin().el);
    },
    hideSpin: function () {
        /// <summary>
        /// Hide spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        SavedEventsAndTicketsDisplay.controls.spin.stop();
    },
};