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
			<div>
				<hr>
			</div>
			<div class="container menus">

				<ul class="nav nav-pills" style="float:left;">
					<li class="active"><a href="#">概况信息</a></li>
					<li><a href="#">课题选择</a></li>

					<li><a href="#">开题报告</a></li>

					<li><a href="#">信息维护</a></li>


				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid cont">
		<div class="row-fluid">
			<div class="span10 offset1">
				<div class="span12" style="margin-bottom:10px;">
					<span style="font-size:30px;"><img src="img/icons/home.png"
						style="vertical-align:text-bottom;">信息概况：</span>
				</div>
				<div class="row-fluid">
					<div class="span4 menushadow">
						<div class="me">
							<h4>个人信息</h4>
						</div>
						<div class="menucontent">
							姓名：宗软软<br> 学号：0911043000<br> 班级：电信0901<br>
							电话:13300000000<br> 邮箱：abr@123.com<br>
						</div>
					</div>
					<div class="span4 menushadow">
						<div class="me">
							<h4>选题信息</h4>
						</div>
						<div class="menucontent">
							<div>尚未设置</div>
						</div>
					</div>
					<div class="span4 menushadow">
						<div class="me">
							<h4>短信息</h4>
						</div>
						<div class="menucontent">
							<div>尚未设置</div>
						</div>
					</div>
				</div>
				<div class="row-fluid" style="margin-top:15px;">
					<div class="span4 menushadow">
						<div class="me">
							<h4>个人信息</h4>
						</div>
						<div class="menucontent">
							姓名：宗软软<br> 学号：0911043000<br> 班级：电信0901<br>
							电话:13300000000<br> 邮箱：abr@123.com<br>
						</div>
					</div>
					<div class="span4 menushadow">
						<div class="me">
							<h4>选题信息</h4>
						</div>
						<div class="menucontent">
							<div>尚未设置</div>
						</div>
					</div>
					<div class="span4 menushadow">
						<div class="me">
							<h4>短信息</h4>
						</div>
						<div class="menucontent">
							<div>尚未设置</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="container">
			Powered by <strong><a href="#" data-toggle="tooltip"
				title="http://www.nenew.net"
				style="color: #c2c2c2;text-shadow: 1px 1px 1 #FFFFFF;">nenew</a> </strong><br>
			<strong>Email:</strong><a href="mailto:nenew.net@gmail.com"
				data-toggle="tooltip" title="发送邮件给奶牛同学"
				style="color: #c2c2c2;text-shadow: 1px 1px 1 #FFFFFF;">nenew.net@gmail.com</a>
		</div>
	</div>
	<!-- 
	<div class="container-fluid header">
		<div class="row-fluid">
			<div class="span3">
				<div class="nav nav-list" style="position:fixed">
					<div class="accordion" id="mainmenu"
						style="background-color:#FFFFFF;border-radius: 6px 6px 6px 6px">
						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#mainmenu" href="#collapseOne">第一级菜单</a>
							</div>
							<div id="collapseOne" class="accordion-body collapse in">
								<div class="accordion-inner">
									<ul class="nav nav-list bs-docs-sidenav">
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#mainmenu" href="#collapseTwo">第二级菜单</a>
							</div>
							<div id="collapseTwo" class="accordion-body collapse">
								<div class="accordion-inner">
									<ul class="nav nav-list bs-docs-sidenav">
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#mainmenu" href="#collapseThree">第三级菜单</a>
							</div>
							<div id="collapseThree" class="accordion-body collapse">
								<div class="accordion-inner">
									<ul class="nav nav-list bs-docs-sidenav">
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
										<li><a href="#">链接1</a></li>
									</ul>
								</div>
							</div>
						</div>

					</div>
				</div>

			</div>
			<div class="span9" style="background-color:#987565;height:7000px;"></div>
		</div>
	</div>
	
	 -->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/myscript.js"></script>
</body>
</html>
