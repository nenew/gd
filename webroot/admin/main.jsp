<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" import="java.net.URLDecoder"
	import="hibernate.*" import="org.hibernate.Transaction"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/admin/";
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	if (request.getSession().getAttribute("islogin") == null
			|| !request.getSession().getAttribute("islogin")
					.equals("yes")) {
		response.sendRedirect("../index.jsp");
		return;
	}
	Integer id = (Integer) request.getSession().getAttribute("id");
	String name = (String) request.getSession().getAttribute("name");
	Integer priority = (Integer) request.getSession().getAttribute(
			"priority");

	MainDAO userdao = new MainDAO();
	Main user = userdao.findById(id);
	Profile profile = new Profile();
	ProfileDAO profiledao = new ProfileDAO();
	profiledao.getSession().clear();
	ProposalDAO proposaldao = new ProposalDAO();
	Proposal proposal = new Proposal();
	MessageDAO messagedao = new MessageDAO();
	Message message = new Message();
	ThesisDAO thesisdao = new ThesisDAO();
	Transaction tx = profiledao.getSession().beginTransaction();
	tx.commit();

	//								Iterator<?> iterator = profiledao.findByProperty("main.id",
	//										user.getId()).iterator();
	Iterator<?> iterator = profiledao.findByProperty("main.id", id)
			.iterator();
	while (iterator.hasNext()) {
		profile = (Profile) iterator.next();
	}

	Iterator<?> iterator2 = proposaldao.findByStudentid(id)
			.iterator();
	while (iterator2.hasNext()) {
		proposal = (Proposal) iterator2.next();
	}
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
							<li class="dropdown dropdownfix"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown"> <%
 	out.print(name);
 %><b class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="../changepw.jsp">修改密码</a>
									</li>
									<li><a href="../logout">注销登录</a>
									</li>

								</ul></li>
						</ul>

					</div>
					<div class="menu">
						<ul class="nav nav-pills">
							<li class="active"><a href="main.jsp">概况信息</a>
							</li>
							<li class="dropdown  dropdowntrasparent"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">毕业设计<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="teacherset.jsp">教师分配</a>
									</li>
									<li><a href="dutyset.jsp">毕设配置</a>
									</li>
									<li><a href="proposal-result.jsp">开题成绩</a></li>
									<li><a href="thesis-result.jsp">毕设成绩</a></li>
								</ul>
							</li>
							<li class="dropdown  dropdowntrasparent"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">管理功能<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="addstudent.jsp">添加学生</a>
									</li>
									<li><a href="delstudent.jsp">学生管理</a>
									</li>
									<li><a href="addteacher.jsp">添加教师</a>
									</li>
									<li><a href="delteacher.jsp">教师管理</a>
									</li>
									<li><a href="addadmin.jsp">添加管理员</a>
									</li>
									<li><a href="deladmin.jsp">管理员管理</a>
									</li>
								</ul>
							</li>
							<li class="dropdown  dropdowntrasparent"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">消息中心<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="message.jsp">发信息</a>
									</li>
									<li><a href="inbox.jsp">收件箱</a>
									</li>
									<li><a href="outbox.jsp">发件箱</a>
									</li>
								</ul>
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
					<div class="boxhead">人员统计</div>
					<div class="boxcontent">
						<%
							MainDAO maindao = new MainDAO();
							out.print("本系统目前拥有用户："  + maindao.count() + "名<br>");
							out.print("学生用户："  + maindao.count("priority",1) + "名<br>");
							out.print("   教师用户："  + maindao.count("priority",2) + "名<br>");
							out.print("   管理员用户：" + maindao.count("priority",3) + "名<br>");
							
							
						%>
					</div>
				</div>
				<div class="span3 boxshadow" style="margin-left:6.38298%;">
					<div class="boxhead">毕设信息</div>
					<div class="boxcontent">
						<%
							out.print("本系统目前拥有课题："  + proposaldao.counts() + "个<br>");
							out.print("已被选的课题："+proposaldao.countsnull("studentid")+"个<br>");
							out.print("开题审核完成的课题："+proposaldao.countsnull("verification")+"个<br>");
							out.print("论文审核完成的课题："+thesisdao.countsnull("veryfication")+"个<br>");
						%>
					</div>
				</div>
				<div class="span3 boxshadow" style="margin-left:6.38298%;">
					<div class="boxhead">短信息</div>
					<div class="boxcontent">
						<%
						    int count = 0 ;
							int incount = 0;
							int outcount = 0;
							String newmsg;
							Iterator <?>messageiterator = messagedao.findByToid(id).iterator();
							while(messageiterator.hasNext()) {
								message=(Message)messageiterator.next();
								if(message.getIsread()==false){count++;};
								incount++;
							}
							messageiterator =messagedao.findByProperty("main.id", id).iterator();
							while(messageiterator.hasNext()) {
								message=(Message)messageiterator.next();
								outcount++;
							}
							if(count != 0) {newmsg = "<span class=\"label label-info\"><a href=\"inbox.jsp\">" + count + "</a></span>";}
							else {newmsg = count+"";}
							out.print("您有 " + newmsg + " 条新信息<br>");
							out.print("已接收 " + incount + " 条短消息<br>");
							out.print("已发送  " + outcount + " 条短消息<br>");

						%>
					</div>
				</div>
			</div>
			<div class="row-fluid">

				<div class="span10 offset1 boxshadow">
					<div class="boxhead">管理功能</div>
					<div class="boxcontent">
					<div class="clearfix" style="margin-top:15px;margin-bottom:15px;">
					<div style="float:left;width:12%;margin-left:15%;"><a href="teacherset.jsp"><button class="function5"></button></a><div style="padding-left:5px;">教师分配</div></div>
					<div style="float:left;width:12%;"><a href="dutyset.jsp"><button class="function2"></button></a><div style="padding-left:5px;">毕设分配</div></div>
					<div style="float:left;width:12%;"><a href="proposal-result.jsp"><button class="function6"></button></a><div style="padding-left:5px;">开题成绩</div></div>
					<div style="float:left;width:12%;"><a href="thesis-result.jsp"><button class="function1"></button></a><div style="padding-left:5px;">毕设成绩</div></div>
					<div style="float:left;width:12%;"><a href="message.jsp"><button class="function3"></button></a><div style="padding-left:8px;">发送消息</div></div>
					<div style="float:left;width:12%;"><a href="addstudent.jsp"><button class="function4"></button></a><div style="padding-left:8px;">添加学生</div></div>

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