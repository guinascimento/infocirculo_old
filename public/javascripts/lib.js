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