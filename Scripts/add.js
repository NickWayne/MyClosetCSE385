$(document).ready(function () {
	$('#addItem').click(function () {
		values =	{	"subcat": inputSubCategory.val(), 
						"userid": inputUserID.val(), 
						"name": inputName.val(), 
						"description": picture.val(),
						"color": inputColor.val(),
						"size": inputSize.val(),
						"condtion": inputCondition.val(),
						"picture": inputPicture.val(),
					};
		ajax("addClothingItem", values , function (data) {
			alert("Clothing Item Added!");
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
