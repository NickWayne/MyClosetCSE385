$(document).ready(function () {
    values = {
        "Fname": inputFName.value(),
        "Lname": inputLName.value(),
        "phone": inputPhone.value(),
        "email": inputEmail.value(),
        "username": inputUser.value(),
        "password": inputPassword.value()
    };
    ajax("addUser", values, function (data) {
        
    });

    values = {
        "username": inputUser.value(),
        "password": inputPassword.value()
    };

    ajax("getuserID", values, function (data) {
        document.cookie = "username:" + data[0].Username;
    });
    //===================================================================================================
    // Generic method for AJAX calls
    //===================================================================================================
    function ajax(method, data, fn) {
        $.ajax({
            type: 'POST',
            url: 'MyClosetAPI.asmx/' + method,
            dataType: 'json',
            data: data,
            success: fn
        });
    }

});
