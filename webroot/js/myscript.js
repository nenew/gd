function check() {
	if (document.getElementById("inputusername").value == "123") {
		var test = document.getElementById("inputusername");
		test.setAttribute("id", "inputError");
		test.parentNode.parentNode.parentNode.setAttribute("class",
				"control-group error");
		var info = document.createElement("span");
		var infotext = document.createTextNode("不能输入123！！！！");
		info.appendChild(infotext);
		info.setAttribute("class", "help-inline");
		info.setAttribute("id", "usercheck");
		test.parentNode.parentNode.appendChild(info);
	}

}
function checkagain() {
	var test = document.getElementById("inputError");
	test.setAttribute("id", "inputusername");
	test.parentNode.parentNode.parentNode
			.setAttribute("class", "control-group");
	test.parentNode.parentNode.lastChild.innerHTML = "";
}

function too() {
	$('.ggggg').tooltip('show');
}
