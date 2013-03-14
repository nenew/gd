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

<title>登录———毕业设计在线管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>
	<% 			Cookie[] cookies = request.getCookies();
	for (int i = 0; i < cookies.length-1; i++) {
				out.print(cookies[i].getName());
				out.print(cookies[i].getValue());
				}
	%>
	<div class=login-main>
		<form class=login-form name="loginform" action="login-check.jsp" method="post">
		帐号：<input type="text" name="id" class=login-main-input />
		<br>
		密码：<input type="text" name="password" class=login-main-input />
		<br>
		<input type="radio" name="type" value="teacher"  /> 教师
		<input type="radio" name="type" value="student" checked="checked"  /> 学生
		<br>
		<input type="submit" value="登录" class=login-main-submit />
		<input type="button" value="找回密码" class=login-main-submit onclick=/>
		</form>
	</div>
</body>
</html>
