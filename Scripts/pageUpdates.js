$(document).ready(function () {

    if (!getCookie("userid")) {
        $("#accountButton").text("Log In");
        $("#accountButton").attr("href", "login.html")
    }

});
