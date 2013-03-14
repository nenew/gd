<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dao.LoginDao"%>
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

<title>login-cheack</title>

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
	<%
		String studentid = request.getParameter("id");
		String studentpw = request.getParameter("password");
		LoginDao check = new LoginDao();
		String studentpassword = check.getPassword(studentid);
		if (studentpassword.equals(studentpw)) {
			out.print("登录成功");
		} else {
			Cookie[] cookies = request.getCookies();
			String cName = null;
			String cValue = null;
			int flag = 0;
			int times = 0;
			for (int i = 0; i < cookies.length; i++) {
				cName = cookies[i].getName();
				cValue = cookies[i].getValue();
				if (cName.equals("trytimes")) {
					cValue = (Integer.parseInt(cValue) + 1) + "";
					Cookie temp = new Cookie("trytimes", cValue);
					response.addCookie(temp);
					flag = 1;
					times = Integer.parseInt(cValue);
				}
				if (flag == 0) {
					Cookie tt = new Cookie("trytimes", "1");
					tt.setMaxAge(600);
					response.addCookie(tt);
					times = 1;
				}

			}
			out.print("登录失败" + times + "次");

		}
	%>
</body>
</html>
