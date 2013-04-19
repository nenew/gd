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

<title>Bootstrap demo</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
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
	<div class="container">
		<div class="row" style="margin:0 auto;">
			<div class="span12">
				<div class="navbar">
					<div class="navbar-inner">
						<a class="brand" href="#">毕业设计在线管理系统</a>
						<ul class="nav">
							<li class="active"><a href="#"><strong>首页</strong> </a></li>
							<li><a href="#"><strong>新闻通知</strong> </a></li>
							<li><a href="#"><strong>资料下载</strong> </a></li>
						</ul>

						<ul class="nav pull-right">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">管理 <b class="caret"></b> </a>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a>
									</li>
									<li><a href="#">Another action</a>
									</li>
									<li><a href="#">Something else here</a>
									</li>
									<li class="divider"></li>
									<li><a href="#">Separated link</a>
									</li>
								</ul>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div  style="margin:200px auto 0 auto;">
			<form class="form-horizontal">
				<div class="control-group">
					<label class="control-label" for="inputEmail">Email</label>
					<div class="controls">
						<input type="text" id="inputEmail" placeholder="Email"
							onfocus="checkagain();">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="inputPassword">Password</label>
					<div class="controls">
						<input type="password" id="inputPassword" placeholder="Password">
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<label class="checkbox"> <input type="checkbox">
							Remember me </label>
						<button type="button" class="btn" onclick="check();">Sign
							in</button>
					</div>
				</div>
			</form>
		</div>
		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/myscript.js">
			
		</script>

	</div>
</body>
</html>
