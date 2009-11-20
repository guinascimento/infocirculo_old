function selectAll() {
	for (i = 0; i < document.form.elements.length; i++) {
		if (document.form.elements[i].type == "checkbox") {
			document.form.elements[i].checked = 1
		}
	}
}

function unselectAll() {
	for (i = 0; i < document.form.elements.length; i++) {
		if (document.form.elements[i].type == "checkbox") {
			document.form.elements[i].checked = 0;
		}
	}
}

function reject(id) {
	$("#people"+ id).addClass("delete_background").fadeIn("slow");

	if (confirm("Tem certeza ?")) {
		jQuery.ajax(
			{
				data:'authenticity_token=' + encodeURIComponent('738Mq3yYmZdPlNlRHp3guAWEuEg0NM57pjODApL0cbw='),
				dataType:'script',
				type:'post',
				url:'/people/remove_connection/'+id
			}
		);
		$("#people"+ id).fadeOut("slow");
		return false;
	} else {
		$("#people"+ id).removeClass("delete_background");
	}
}

function accept(id) {
	jQuery.ajax(
		{
			data:'authenticity_token=' + encodeURIComponent('738Mq3yYmZdPlNlRHp3guAWEuEg0NM57pjODApL0cbw='),
			dataType:'script',
			type:'post',
			url:'/people/remove_connection/'+id
		}
	);
	$("#people"+ id).fadeOut("slow");
	return false;
}