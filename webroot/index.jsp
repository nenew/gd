<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" import="java.net.URLDecoder"
	import="hibernate.*" import="org.hibernate.Transaction"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>登录——毕业设计在线管理系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/index.css" rel="stylesheet">
<link href="img/favicon.ico" type="image/x-icon" rel="shortcut icon">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>
	<div id="main">
		<div id="header">
			<div class="navbar headfix">
				<div class="navbar-inner navfix">
					<a class="brand" href="#">毕业设计在线管理系统</a>
				</div>
			</div>
		</div>
		<div class="container-fluid containerfix">
			<div class="row-fluid">
				<div class="span9 offset1 mainarea">
					<div class="login">
						<div class="boxhead">登录系统</div>
						<div class="boxcontent">
							<form class="formfix" name="loginform" action="login-check.jsp"
								method="post">
								<div class="control-group">
									<div class="controls">
										<label class="control-label">帐号：</label>

										<div class="input-prepend">
											<span class="add-on"><i class="icon-user"></i> </span> <input
												id="inputusername" name="id" placeholder="输入用户名" type="text"
												onblur="check();" onfocus="checkagain();" autofocus>
										</div>
									</div>
								</div>
								<div class="control-group">
									<div class="controls">
										<label class="control-label">密码：</label>

										<div class="input-prepend">
											<span class="add-on"><i class="icon-lock"></i> </span> <input
												id="inputPassword" name="password" placeholder="输入密码"
												type="password">
										</div>
									</div>
								</div>
								<div class="control-group form-inline">
									<div class="controls">
										<label class="checkbox" style="margin-right:30px;"> <input
											type="checkbox"> 记住密码&nbsp; &nbsp; &nbsp; <a href="#">忘记密码?</a>
										</label>


										<button type="submit" class="btn btn-primary">登录</button>

									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div class="footext">Copyright © 2013 nenew.net. All Rigths
			Reserved.</div>
		<div class="footech"></div>
	</div>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/myscript.js"></script>
</body>
</html>
