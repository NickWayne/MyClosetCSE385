$(document).ready(function () {
    $('#createAccount').click(function () {
        console.log("adding User")
        values = {
            "Fname": $("#inputFName").val(),
            "Lname": $("#inputLName").val(),
            "phone": $("#inputPhone").val(),
            "email": $("#inputEmail").val(),
            "username": $("#inputUser").val(),
            "password": $("#inputPassword").val()
        };
        ajax("addUser", values, function (data) {
            document.cookie = "userid:" + data[0].UserID;
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
