function check() {
	if (document.getElementById("inputEmail").value == "123") {
		var test = document.getElementById("inputEmail");
		test.setAttribute("id", "inputError");
		test.parentNode.parentNode.setAttribute("class", "control-group error");
		var info = document.createElement("span");
		var infotext = document.createTextNode("不能输入123！！！！");
		info.appendChild(infotext);
		info.setAttribute("class", "help-inline");
		test.parentNode.appendChild(info);
	}
}
	function checkagain() {
		var test = document.getElementById("inputError");
		test.setAttribute("id", "inputEmail");
		test.parentNode.parentNode.setAttribute("class", "control-group");
		var info = document.createElement("span");
		test.parentNode.lastChild.innerHTML="";
		test.parentNode.appendChild(info);
	}

