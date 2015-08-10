/**
 * Created by brockwhittaker on 7/16/15.
 */

$(".get-access").click(function () {
    $("#popup-signin").fadeIn(500);
    popUpVisibile = true;
});

$("#popup-signin").click(function (e) {
    if (e.target.id === "popup-signin") {
        $("#popup-signin").fadeOut(500);
    }
});

$(document).on('keyup', function (e) {
    if (e.keyCode == 27 || e.which == 27) {
        $("#popup-signin").fadeOut(500);
    }
})