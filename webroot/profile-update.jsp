<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" import="java.net.URLDecoder"
	import="hibernate.*" import="org.hibernate.Transaction"
	import="java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("userid");
		String phonenum = request.getParameter("phonenum");
		String email = request.getParameter("email");
		ProfileDAO profiledao = new ProfileDAO();
		Profile profile = profiledao.findById(Integer.valueOf(userid));
		profile.setPhonenum(phonenum);
		profile.setEmail(email);
		profiledao.attachClean(profile);
		profiledao.getSession().beginTransaction().commit();
		out.print("来自网址：" + request.getRequestURI() + "<br>成功");
		session.setAttribute("profileupdatestatus", "1");
//		response.sendRedirect("profile.jsp");
//		response.sendRedirect("index.jsp");
	%>
</body>
</html>
