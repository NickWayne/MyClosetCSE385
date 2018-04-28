$(document).ready(function () {
	$('#addItem').click(function () {
		values =	{	"subcat": inputSubCategory.val(), 
						"userid": inputUserID.val(), 
						"name": inputName.value(), 
						"description": picture.value(),
						"color": inputColor.value(),
						"size": inputSize.value(),
						"condtion": inputCondition.value(),
						"picture": inputPicture.value(),
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
