var UserEventManagement = {
    init: function () {
        // support ajax to upload images
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

        $('#Btn_SearchEvent').unbind("click").bind("click", function () {
            debugger
            var searchString = $("#Txt_Search").val();
            var eventType = $("#TabStripEvents li.active").data("type");
            UserEventManagement.searchEvent(searchString, eventType);
        });

        $("#TabStripEvents a").unbind("click").bind("click", function () {
            $("#Txt_Search").val("");
            var eventType = $($(this).closest("li")).data("type");
            UserEventManagement.searchEvent("", eventType);
        });
    },
    searchEvent:function(searchString, type){
        UserEventManagement.showSpin(".js-event-list-block.tab-content");

        $.ajax({
            url: '/UserResources/SearchEventOfUser',
            type: 'POST',
            data: JSON.stringify({searchString:searchString,type:type}),
            dataType: 'html',
            contentType: 'application/json; charset=utf-8',
            success: function (result) {
                $(".js-event-list-container.active.tab-pane").empty().html(result);
            },
            error: function (e) {
                console.log("Get events fail!");
            },
            complete: function () {
                UserEventManagement.hideSpin();
            }
        });
    },
    showSpin: function (target) {
        /// <summary>
        /// Create spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>s

        $(target).append(UserEventManagement.controls.spin.spin().el);
    },
    hideSpin: function () {
        /// <summary>
        /// Hide spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        UserEventManagement.controls.spin.stop();
    }
}