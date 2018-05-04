$(document).ready(function () {

    $('#login').click(function () {
        values = {
            "username": $("#inputUser").val(),
            "password": $("#inputPassword").val()
        };
        ajax("loginUser", values, function (data) {
            deleteAllCookies();
            createCookie("userid", data[0].UserID, 1);
            window.location.replace("index.html");
        });
    });

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
