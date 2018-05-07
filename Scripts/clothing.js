$(document).ready(function () {
    ajax("getSpecificClothingItem", { "clothingid": getCookie("clothingid") }, function (data) {
        var clothingcontainer = $("#clothingItem");
        var toadd = "";
        $.each(data, function (index, val) {
            toadd += "<h1 class='jumbotron- heading'>" + val.Name + "</h1>";
            toadd += "<p class='lead text-muted'>" + val.Description + "</p>";
            toadd += "<p>Uploaded by " + val.Fname + " " + val.Lname + "</p>";
            toadd += "<img class='card-img-top img-fluid' src='" + val.Picture + "' alt='Card image cap'>";
            toadd += "<br>";
            toadd += "<p class='lead text-muted'>" + val.cat + "|" + val.subCat + "</p>";
            toadd += "<p>Color: " + val.Color + "</p>";
            toadd += "<p>Size: " + val.Size + "</p>";
            toadd += "<p>Condition: " + val.Condition + "</p>";
            clothingcontainer.append(toadd);
            toadd = "";
        });
    });

    ajax("getRatings", { "clothingid": getCookie("clothingid") }, function (data) {
        var raitings = $("#raitings");
        var toadd = "";
        $.each(data, function (index, val) {
            toadd += "<div class='rating'>";
            toadd += "<p>" + val.Rating + "/10 Stars</p>";
            toadd += "<p>" + val.Description + "</p>";
            toadd += "<p><strong>" + val.Fname + " " + val.Lname + "</strong></p>";
            toadd += "</div>";
            raitings.find("#addRaiting").before(toadd);
            toadd = "";
        });
    });
    $('#btnAddRating').click(function () {
        ajax("addRating", {
            "UserID": getCookie("userid"),
            "ClothingID": getCookie("clothingid"),
            "Rating": $('#inputRating').val(),
            "Description": $('#inputDescription').val()
        }, function (data) {
            window.location.replace("clothing.html");
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
