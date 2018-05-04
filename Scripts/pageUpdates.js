$(document).ready(function () {

    if (!getCookie("userid")) {
        $("#accountButton").text("Log In");
        $("#accountButton").attr("href", "login.html")
    }

    //===================================================================================================
    // Generic method for AJAX calls
    //===================================================================================================
    function ajax(method, data, fn) {
        $.ajax({
            type: 'POST',
            url: '../MyClosetAPI.asmx/' + method,
            dataType: 'json',
            data: data,
            success: fn
        });
    }

});
