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
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12" style="margin-top:10%;">
				<h1 style="text-align:center;">毕业设计在线管理系统</h1>
				<div class="span6 offset3" style="margin-top:25px;">
					<form class="form-horizontal" name="loginform"
						action="login-check.jsp" method="post">
						<div class="control-group">
							<label class="control-label"><strong>帐号：</strong> </label>
							<div class="controls">
								<div class="input-prepend">
									<span class="add-on"><i class="icon-user"></i> </span> <input
										id="input" name="id" placeholder="input user name" type="text">
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputPassword"><strong>密码：</strong>
							</label>
							<div class="controls">
								<div class="input-prepend">
									<span class="add-on"><i class="icon-lock"></i> </span> <input
										id="inputPassword" name="password"
										placeholder="input password" type="password">
								</div>
							</div>
						</div>
						<div class="countrol-group form-inline"
							style="margin-bottom:10px;">
							<label class="radio" style="margin-left:180px;"> <input
								type="radio" name="optionsRadios" id="optionsRadios1"
								value="teacher">教师</label> <label class="radio"
								style="margin-left:30px;"> <input type="radio"
								name="optionsRadios" id="optionsRadios2" value="student" checked>学生
							</label>
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
			<div class="span10" style="text-align:center;">
				<img src="img/logo/html5-logo.png" width="63" height="64"
					alt="HTML5 Powered" title="HTML5 Powered"> <img
					src="img/logo/css3-logo.png" width="63" height="64"
					alt="CSS3 Powered" title="CSS3 Powered"> <img
					src="img/logo/js-logo.png" width="63" height="64"
					alt="JavaScript Powered" title="JavaScript Powered">


			</div>
		</div>

	</div>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/myscript.js"></script>

</body>
</html>
