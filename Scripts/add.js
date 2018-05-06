$(document).ready(function () {

    ajax("getCategories", {}, function (data) {
        var cat = $('#categories');
        $.each(data, function (index, val) {
            cat.append('<option value="' + val.CategoryID + '">' + val.Name + '</option>')
        });
    });

    $('#categories').change(function () {
        $('#catopt').remove();
        ajax("getSubCategories", { "catID": $(this).val()}, function (data) {
            var cat = $('#subcategories');
            cat.empty();
            cat.show();
            $.each(data, function (index, val) {
                cat.append('<option value="' + val.SubCatID + '">' + val.Name + '</option>')
            });
        });
    });
	$('#addItem').click(function () {
        values = {
            "subcat": $('#subcategories').val(),
            "userid": getCookie("userid"),
            "name": $('#inputName').val(), 
            "description": $('#inputDescription').val(),
            "color": $('#inputColor').val(),
            "size": $('#inputSize').val(),
            "condition": $('#inputCondition').val(),
            "picture": $('#inputPicture').val(),
	    };
		ajax("addClothingItem", values , function (data) {
            window.location.replace("account.html");
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
