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
	if (request.getSession().getAttribute("islogin") == null
	|| !request.getSession().getAttribute("islogin")
			.equals("yes")) {
		response.sendRedirect("index.jsp");
		return;
	}
	Integer id = (Integer) request.getSession().getAttribute("id");
	String name = (String) request.getSession().getAttribute("name");
	Integer priority = (Integer) request.getSession().getAttribute(
	"priority");
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>开题成绩——毕业设计在线管理系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/proposal-result.css" rel="stylesheet">
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
 	out.print(name);
 %><b class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="#">修改密码</a></li>
									<li><a href="#">注销登录</a></li>

								</ul>
							</li>
						</ul>

					</div>
					<div class="menu">
						<ul class="nav nav-pills">
							<li><a href="main.jsp">概况信息</a></li>
							<li class="dropdown active"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">毕业设计<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="choose.jsp">课题选择</a></li>
									<li><a href="proposal-fill.jsp">开题报告</a></li>
									<li class="active"><a href="proposal-result.jsp">开题成绩</a>
									</li>
									<li><a href="thesis-upload.jsp">论文提交</a></li>
									<li><a href="thesis-result.jsp">毕设成绩</a></li>
								</ul></li>
							<li class="dropdown dropdowntrasparent"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">消息中心<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="message.jsp">发信息</a>
									</li>
									<li><a href="inbox.jsp">收件箱</a>
									</li>
									<li><a href="outbox.jsp">发件箱</a>
									</li>
								</ul></li>
							<li><a href="profile.jsp">信息维护</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid containerfix">
			<div class="row-fluid">
				<div class="span12 contentitle">开题成绩</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow">
					<div class="boxhead">成绩信息</div>
					<div class="boxcontent">
						<%
							ProposalDAO proposaldao = new ProposalDAO();
							proposaldao.getSession().clear();
							proposaldao.getSession().beginTransaction().commit();
							 if(proposaldao.findByStudentid(id).isEmpty()) {
										response.sendRedirect("choose.jsp"); return; }
							Proposal proposal =(Proposal) proposaldao.findByStudentid(id) .iterator().next();
							 if(proposal.getIsapproved() == null) {
										response.sendRedirect("proposal-fill.jsp"); return; }
							 if(proposal.getVerification() == null) { 
							 out.print("<div class=\"alert alert-info alertfix\">请耐心等待，开题报告还未审核！<br></div>"); 
							 }else{
							 if(proposal.getVerification().equalsIgnoreCase("yes")) { 
							 out.print("<div class=\"alert alert-success alertfix\">恭喜，开题报告已通过审核！<br><a class=\"btn btn-primary btn-large\" href=\"thesis-upload.jsp\">上传毕业论文</a></div>"); 
							 }
							 if(proposal.getVerification().equalsIgnoreCase("no")) { 
							 out.print("<div class=\"alert alert-danger alertfix\">抱歉，开题报告未通过审核！<br><a class=\"btn btn-primary btn-large\" href=\"proposal-fill.jsp\">修改开题报告</a></div>"); 
							 }
							 }
						%>

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
</body>
</html>