$(document).ready(function () {
    values = {
        "userid": getCookie("userid")
    };
	ajax("getUserClothingItems", values, function (data) {
		var clothingcontainer = $("#clothingItems");
        var toadd = "";
		$.each(data, function (index, val) {
            toadd += "<div class='col-md-4'><div class='card mb-4 box-shadow'>";
            toadd += "<img class='card-img-top' src='" + val.Picture + "' alt='Card image cap'>";
            toadd += "<div class='card-body'><h3><a style='color: #878E95' href='clothing.html' class='clothingitem'>" + val.Name + "</a></h3>";
            toadd += "<input hidden id=" + val.ClothingID + "></input>";
            toadd += "<p class='card-text'>" + val.Description + "</p>";
            toadd += "<div class='btn-group'><button type='button' class='btn btn-sm btn-outline-secondary'>Rate</button>";
            toadd += "<button type='button' class='btn btn-sm btn-outline-danger delete-button'>Delete</button></div>";
            toadd += "<small class='text-muted float-right'>" + val.cat + "|" + val.subCat + "</small>";
            toadd += "</div></div></div></div>";
            clothingcontainer.append(toadd);
            toadd = "";
		});
		$(".delete-button").click(function () {
		    values = {
		        "clothingID": $(this).parent().parent().find("input").attr('id'),
		        "userID": getCookie("userid")
		    };
		    ajax("deleteClothingItem", values, function (data) {
		        window.location.replace("account.html");
		    });
		});
	});

    $("#logout").click(function () {
        deleteAllCookies();
        window.location.replace("index.html");
    });

    $('.clothingitem, .rate').click(function () {
        var base = $(this);
        createCookie("clothingid", base.parent().parent().find("input").attr('id'), 1)
        window.location.replace("clothing.html");
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
