<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>登录——毕业设计在线管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/bootstrap-responsive.css" rel="stylesheet">
<link href="css/addons.css" rel="stylesheet">
<link href="img/favicon.ico" type="image/x-icon" rel="shortcut icon">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	<div class="navbar navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<button data-target=".nav-collapse" data-toggle="collapse"
					class="btn btn-navbar" type="button">
					t<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="./index.jsp" class="brand"><strong>毕业设计在线管理系统</strong>
				</a>
				<div class="nav-collapse collapse headerul" data-toggle="collapse"
					data-target=".nav-collapse">
					<ul class="nav">
						<li class="text">欢迎光临:</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">小粽子同学<b class="caret"></b> </a>
							<ul class="dropdown-menu">
								<li><a href="#">修改密码</a></li>
								<li><a href="#">注销登录</a></li>

							</ul>
						</li>
					</ul>

				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid" style="margin-top:45px;">
		<div class="row-fluid">
			<div class="span3" style="background-color:#666666;">
				<ul class="nav nav-list" style="position:fixed;">
					<li><a href="#overview"><i class="icon-chevron-right"></i>
							Overview</a></li>
					<li><a href="#transitions"><i class="icon-chevron-right"></i>
							Transitions</a></li>
					<li><a href="#modals"><i class="icon-chevron-right"></i>
							Modal</a></li>
					<li><a href="#dropdowns"><i class="icon-chevron-right"></i>
							Dropdown</a></li>
					<li><a href="#scrollspy"><i class="icon-chevron-right"></i>
							Scrollspy</a></li>
					<li><a href="#tabs"><i class="icon-chevron-right"></i> Tab</a>
					</li>
					<li><a href="#tooltips"><i class="icon-chevron-right"></i>
							Tooltip</a></li>
					<li><a href="#popovers"><i class="icon-chevron-right"></i>
							Popover</a></li>
					<li><a href="#alerts"><i class="icon-chevron-right"></i>
							Alert</a></li>
					<li><a href="#buttons"><i class="icon-chevron-right"></i>
							Button</a></li>
					<li><a href="#collapse"><i class="icon-chevron-right"></i>
							Collapse</a></li>
					<li><a href="#carousel"><i class="icon-chevron-right"></i>
							Carousel</a></li>
					<li><a href="#typeahead"><i class="icon-chevron-right"></i>
							Typeahead</a></li>
					<li><a href="#affix"><i class="icon-chevron-right"></i>
							Affix</a></li>
				</ul>
			</div>
			<div class="span9" style="background-color:#987565;height:7000px;"></div>
		</div>
	</div>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/myscript.js"></script>
</body>
</html>
