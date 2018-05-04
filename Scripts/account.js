$(document).ready(function () {
    values = {
        "userid": getCookie("userid")
    };
	ajax("getUserClothingItems", values, function (data) {
		var clothingcontainer = $("#clothingItems");
        var toadd = "";
        console.log(data);
		$.each(data, function (index, val) {
            toadd += "<div class='col-md-4'><div class='card mb-4 box-shadow'>";
            toadd += "<img class='card-img-top' src='" + val.Picture + "' alt='Card image cap'>";
            toadd += "<div class='card-body'><h3><a style='color: #878E95' href='clothing.html'>" + val.Name + "</a></h3>";
            toadd += "<p class='card-text'>" + val.Description + "</p>";
            toadd += "<div class='btn-group'><button type='button' class='btn btn-sm btn-outline-secondary'>Favorite</button><button type='button' class='btn btn-sm btn-outline-secondary'>Rate</button></div>";
            toadd += "<small class='text-muted float-right'>" + val.categoryName + "|" + val.subCategoryName + "</small>";
            toadd += "</div></div></div></div>";
            clothingcontainer.append(toadd);
            toadd = "";
		});
	});

	ajax("getUserFavorites", values, function (data) {
		var favoritescontainer = $("#favoriteItems");
        var toadd = "";
        console.log(data);
		$.each(data, function (index, val) {
            toadd += "<div class='col-md-4'><div class='card mb-4 box-shadow'>";
            toadd += "<img class='card-img-top' src='" + val.Picture + "' alt='Card image cap'>";
            toadd += "<div class='card-body'><h3><a style='color: #878E95' href='clothing.html'>" + val.Name + "</a></h3>";
            toadd += "<p class='card-text'>" + val.Description + "</p>";
            toadd += "<div class='btn-group'><button type='button' class='btn btn-sm btn-outline-secondary'>Favorite</button><button type='button' class='btn btn-sm btn-outline-secondary'>Rate</button></div>";
            toadd += "<small class='text-muted float-right'>" + val.categoryName + "|" + val.subCategoryName + "</small>";
            toadd += "</div></div></div></div>";
            clothingcontainer.append(toadd);
            toadd = "";
		});
    });

    $("#logout").click(function () {
        deleteAllCookies();
        window.location.replace("index.html");
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
