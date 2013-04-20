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

<title>概况预览——毕业设计在线管理系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/main.css" rel="stylesheet">
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
					<div class="nav-collapse collapse user" data-toggle="collapse"
						data-target=".nav-collapse">
						<ul class="nav">
							<li class="litext">欢迎光临:</li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <%
 	Cookie cookie1 = new Cookie("username", URLEncoder.encode("软软小乖乖",
 			"UTF-8"));
 	cookie1.setMaxAge(60000000);
 	Cookie cookie2 = new Cookie("id", URLEncoder.encode("1", "UTF-8"));
 	cookie2.setMaxAge(60000000);
 	response.addCookie(cookie1);
 	response.addCookie(cookie2);
 	Cookie[] cookies = request.getCookies();
 	if (cookies != null) {
 		for (int i = 0; i < cookies.length; i++) {
 			if (cookies[i].getName().equals("username"))
 				out.print(URLDecoder.decode(cookies[i].getValue(),
 						"UTF-8"));
 		}
 	} else
 %><jsp:forward page="/" /> <b class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="#">修改密码</a>
									</li>
									<li><a href="#">注销登录</a>
									</li>

								</ul></li>
						</ul>

					</div>
					<div class="menu">
						<ul class="nav nav-pills">
							<li class="active"><a href="main.jsp">概况信息</a>
							</li>
							<li><a href="choose.jsp">课题选择</a>
							</li>
							<li><a href="proposal-fill.jsp">开题报告</a>
							</li>
							<li><a href="#">信息维护</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid containerfix">
			<div class="row-fluid">
				<div class="span12 contentitle">概况信息</div>
			</div>
			<div class="row-fluid">
				<div class="span3 offset1 boxshadow">
					<div class="boxhead">个人信息</div>
					<div class="boxcontent">
						<%
							Main user = new Main();
							MainDAO userdao = new MainDAO();
							Profile profile = new Profile();
							ProfileDAO profiledao = new ProfileDAO();
							profiledao.getSession().clear();
							Transaction tx = profiledao.getSession().beginTransaction();
							tx.commit();

							for (int i = 0; i < cookies.length; i++) {
								if (cookies[i].getName().equals("id"))
									user = userdao.findById(Integer.parseInt(URLDecoder.decode(
											cookies[i].getValue(), "UTF-8")));
//								Iterator<?> iterator = profiledao.findByProperty("main.id",
//										user.getId()).iterator();
								Iterator<?> iterator = profiledao.findByProperty("main.id",
										1).iterator();
								while (iterator.hasNext())
									profile = (Profile) iterator.next();
							}
							out.print("姓名：" + user.getName() + "<br>");
							out.print("专业：" + profile.getDepartment() + "<br>");
							out.print("年级：" + profile.getGrade() + "<br>");
							out.print("电话：" + profile.getPhonenum() + "<br>");
							out.print("邮箱：" + profile.getEmail() + "<br>");
						%>
					</div>
				</div>
				<div class="span3 boxshadow" style="margin-left:6.38298%;">
					<div class="boxhead">选题信息</div>
					<div class="boxcontent">
						<%
							for (int i = 0; i < cookies.length; i++) {
								if (cookies[i].getName().equals("id"))
									user = userdao.findById(Integer.parseInt(URLDecoder.decode(
											cookies[i].getValue(), "UTF-8")));
								Iterator<?> iterator = profiledao.findByProperty("main.id",
										user.getId()).iterator();
								while (iterator.hasNext())
									profile = (Profile) iterator.next();
							}
							out.print("姓名：" + user.getName() + "<br>");
							out.print("专业：" + profile.getDepartment() + "<br>");
							out.print("年级：" + profile.getGrade() + "<br>");
							out.print("电话：" + profile.getPhonenum() + "<br>");
							out.print("邮箱：" + profile.getEmail() + "<br>");
						%>
					</div>
				</div>
				<div class="span3 boxshadow" style="margin-left:6.38298%;">
					<div class="boxhead">短信息</div>
					<div class="boxcontent">
						<%
							for (int i = 0; i < cookies.length; i++) {
								if (cookies[i].getName().equals("id"))
									user = userdao.findById(Integer.parseInt(URLDecoder.decode(
											cookies[i].getValue(), "UTF-8")));
								Iterator<?> iterator = profiledao.findByProperty("main.id",
										user.getId()).iterator();
								while (iterator.hasNext())
									profile = (Profile) iterator.next();
							}
							out.print("姓名：" + user.getName() + "<br>");
							out.print("专业：" + profile.getDepartment() + "<br>");
							out.print("年级：" + profile.getGrade() + "<br>");
							out.print("电话：" + profile.getPhonenum() + "<br>");
							out.print("邮箱：" + profile.getEmail() + "<br>");
						%>
					</div>
				</div>
			</div>
			<div class="row-fluid">

				<div class="span10 offset1 boxshadow">
					<div class="boxhead">毕设进度</div>
					<div class="boxcontent">
						<div>
							<div style="width:20%;float:left;text-align:center;">选题完成</div>
							<div style="width:20%;float:left;text-align:center;">开题完成</div>
							<div style="width:30%;float:left;text-align:center;">设计进行中</div>
						</div>
						<div class="progress progressfix">
							<div class="bar bar-warning" style="width: 20%;"></div>
							<div class="bar bar-success" style="width: 20%;"></div>
							<div
								class="progress progress-striped active progress-striped-fix">
								<div class="bar" style="width: 30%;"></div>
							</div>

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
