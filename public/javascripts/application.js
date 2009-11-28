$(function() {
    // countdown timer
    $(".countdown").each(function(i, element) {
        var time = $(element).text().match(/^(?:(\d+):)?(\d{1,2}):(\d{2})$/);
        var seconds = (time[1] || 0) * 3600 + time[2] * 60 + time[3] * 1;
        $(element).countdown({ until: seconds, layout: "{mnn}:{snn}"});
    });
});
