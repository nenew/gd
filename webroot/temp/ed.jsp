<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>editor pageo</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="img/favicon.ico" type="image/x-icon" rel="shortcut icon">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>


	<form name="loginform" action="editor-con.jsp" method="post">
		<div>
			<button type="submit" class="btn btn-primary">提交修改</button>
			<input id="input" name="id" type="text">
			<textarea name="te" id ="tt" onfocus="tinyMCE.execCommand('mceAddControl', false, 'tt');">
hello world
			</textarea>
			<textarea id="bb"></textarea>
		</div>

	</form>


	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/myscript.js"></script>
	<script type="text/javascript" src="editor/tinymce.min.js"></script>
	<script type="text/javascript">
		tinyMCE
				.init({
					// General options
//					mode : "textareas",
					mode : "textareas",
					theme : "modern",
//					language : "cn",
					plugins : "lists,pagebreak,save,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,autosave",

					// Theme options
					theme_advanced_buttons1 : "newdocument,save,|,bold,italic,underline,strikethrough,|,cut,copy,paste,pastetext,pasteword,|,undo,redo,|,link,unlink|,fullscreen",
					theme_advanced_toolbar_location : "top",
					theme_advanced_toolbar_align : "left",
					theme_advanced_statusbar_location : "bottom",
					theme_advanced_path : false,

					theme_advanced_resizing : true,

					// Example content CSS (should be your site CSS)
//					content_css : "css/content.css",

					// Style formats
					style_formats : [ {
						title : 'Bold text',
						inline : 'b'
					}, {
						title : 'Red text',
						inline : 'span',
						styles : {
							color : '#ff0000'
						}
					}, {
						title : 'Red header',
						block : 'h1',
						styles : {
							color : '#ff0000'
						}
					}, {
						title : 'Example 1',
						inline : 'span',
						classes : 'example1'
					}, {
						title : 'Example 2',
						inline : 'span',
						classes : 'example2'
					}, {
						title : 'Table styles'
					}, {
						title : 'Table row 1',
						selector : 'tr',
						classes : 'tablerow1'
					} ],

				});
	</script>

</body>
</html>
