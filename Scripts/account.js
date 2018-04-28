$(document).ready(function () {
	values =	{	"userid": inputUserID.val(), 
				};
	ajax("getClothingItems", values , function (data) {
		var clothingcontainer = $("#clothingItems");
		var toadd = "<div class='row'>";
		var count = 1
		$.each(data, function (index, val) {
			if (count > 3){
				toadd += "</div>";
				count = 1;
				clothingcontainer.append(toadd)
				toadd = "";
			}else{
				toadd += "<div class='col-md-4'><div class='card mb-4 box-shadow'>";
				toadd += "<img class='card-img-top' src='" + val.Picture + "' alt='Card image cap'>";
				toadd += "<div class='card-body'><h3><a style='color: #878E95' href='clothing.html'>" + val.Name + "</a></h3>";
				toadd += "<p class='card-text'>" + val.Description + "</p>";
				toadd += "<div class='btn-group'><button type='button' class='btn btn-sm btn-outline-secondary'>Favorite</button><button type='button' class='btn btn-sm btn-outline-secondary'>Rate</button></div>";
				toadd += "<small class='text-muted'>" + val.categoryName + "|" + val.subCategoryName + "</small>";
				toadd += "</div></div></div></div>";
			}
		});
	});

	ajax("getClothingItems", values , function (data) {
		var favoritescontainer = $("#favoriteItems");
		var toadd = "<div class='row'>";
		var count = 1
		$.each(data, function (index, val) {
			if (count > 3){
				toadd += "</div>";
				count = 1;
				favoritescontainer.append(toadd)
				toadd = "";
			}else{
				toadd += "<div class='col-md-4'><div class='card mb-4 box-shadow'>";
				toadd += "<img class='card-img-top' src='" + val.Picture + "' alt='Card image cap'>";
				toadd += "<div class='card-body'><h3><a style='color: #878E95' href='clothing.html'>" + val.Name + "</a></h3>";
				toadd += "<p class='card-text'>" + val.Description + "</p>";
				toadd += "<div class='btn-group'><button type='button' class='btn btn-sm btn-outline-secondary'>Favorite</button><button type='button' class='btn btn-sm btn-outline-secondary'>Rate</button></div>";
				toadd += "<small class='text-muted'>" + val.categoryName + "|" + val.subCategoryName + "</small>";
				toadd += "</div></div></div></div>";
			}
		});
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
