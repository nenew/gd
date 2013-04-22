<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" import="java.net.URLDecoder"
	import="hibernate.*" import="org.hibernate.Transaction"
	import="java.sql.*"%>
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

<title>课题选择——毕业设计在线管理系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/choose.css" rel="stylesheet">
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
							<li class="dropdown dropdownfix"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown"> <%
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
							<li><a href="main.jsp">概况信息</a>
							</li>
							<li class="dropdown active"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">毕业设计<b class="caret"> </b>
							</a>
								<ul class="dropdown-menu">
									<li class="active"><a href="choose.jsp">课题选择</a>
									</li>
									<li><a href="proposal-fill.jsp">开题报告</a>
									</li>
									<li><a href="#">进度信息</a>
									</li>
									<li><a href="#">论文提交</a>
									</li>
								</ul>
							</li>
							<li class="dropdown dropdowntrasparent"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">消息中心<b class="caret"> </b>
							</a>
								<ul class="dropdown-menu">
									<li><a href="#">发信息</a>
									</li>
									<li><a href="#">收件箱</a>
									</li>
									<li><a href="#">发件箱</a>
									</li>
								</ul>
							</li>
							<li><a href="profile.jsp">信息维护</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid containerfix">
			<div class="row-fluid">
				<div class="span12 contentitle">课题选择</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow">
					<div class="boxhead">可选列表</div>
					<div class="boxcontent">
						<div>
							<table class="tablefix">
								<tr>
									<th width="20%">课题名称</th>
									<th width="40%">题目简介</th>
									<th width="10%">指导教师</th>
									<th width="10%">教师职称</th>
									<th width="10%"></th>
								</tr>

								<%
									Proposal proposal = new Proposal();
									ProposalDAO proposaldao = new ProposalDAO();
									Profile profile = new Profile();
									proposaldao.getSession().clear();
									proposaldao.getSession().beginTransaction().commit();
									Iterator<?> iterator = proposaldao.findAll().iterator();
									while (iterator.hasNext()) {
										proposal = (Proposal) iterator.next();

										out.print("<tr><td>");
										out.print(proposal.getThesistitle());
										out.print("</td><td>");
										out.print(proposal.getContent());
										out.print("</td><td>");
										out.print(proposal.getMain().getName());
										out.print("</td><td>");
										Set<Profile> set = proposal.getMain().getProfiles();
										Iterator<Profile> i=set.iterator();
										while (i.hasNext()) {
											Profile p = i.next();
											out.print(p.getTitle());
										}
										;
										out.print("</td><td align=\"center\">");
										out.print("<button class=\"btn btn-primary\">选择</button>");
										out.print("</td></tr>");

									}
								%>
							</table>

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
