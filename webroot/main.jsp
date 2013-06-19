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
	Thesis thesis = new Thesis();
	if(!thesisdao.findByProperty("main.id", id).isEmpty()){
	thesis = (Thesis)thesisdao.findByProperty("main.id", id).iterator().next();
	};
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
									<li><a href="changepw.jsp">修改密码</a>
									</li>
									<li><a href="logout">注销登录</a>
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
									<li><a href="choose.jsp">课题选择</a>
									</li>
									<li><a href="proposal-fill.jsp">开题报告</a>
									</li>
									<li><a href="proposal-result.jsp">开题成绩</a>
									</li>
									<li><a href="thesis-upload.jsp">论文提交</a>
									</li>
									<li><a href="thesis-result.jsp">毕设成绩</a>
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
							<li><a href="profile.jsp">信息维护</a>
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
							out.print("姓名：" + user.getName() + "<br>");
							if (profile.getPhonenum() == null||profile.getEmail() ==null) {
								out.print("请先填写个人信息！");
							} else {
								out.print("专业：" + profile.getDepartment() + "<br>");
								out.print("年级：" + profile.getGrade() + "<br>");
								out.print("电话：" + profile.getPhonenum() + "<br>");
								out.print("邮箱：" + profile.getEmail() + "<br>");
							}
						%>
					</div>
				</div>
				<div class="span3 boxshadow" style="margin-left:6.38298%;">
					<div class="boxhead">选题信息</div>
					<div class="boxcontent">
						<%
							if (proposal.getThesistitle() == null) {
								out.print("请先选题！");
							} else {
								Profile teacher = new Profile();
								Iterator <?>teacheriterator =proposal.getMain().getProfiles().iterator();
								while(teacheriterator.hasNext()) teacher = (Profile)teacheriterator.next();
								
								out.print("课题名称：" + proposal.getThesistitle() + "<br>");
								out.print("导师姓名：" + proposal.getMain().getName() + "<br>");
								if(teacher.getPhonenum()==null){
								out.print("导师电话：未填写<br>");
								}else{
								out.print("导师电话：" + teacher.getPhonenum() + "<br>");}
								if(teacher.getEmail()==null){
								out.print("导师邮箱：未填写<br>");
								}else{
								out.print("导师邮箱：" + teacher.getEmail() + "<br>");
								}
							}
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
					<div class="boxhead">毕设进度</div>
					<div class="boxcontent">
						<div>
						<% 
							if(proposaldao.findByStudentid(id).isEmpty()){
								out.print("<div style=\"width:20%;float:left;text-align:center;\">选题进行中</div>");
							}else{
								out.print("<div style=\"width:20%;float:left;text-align:center;\">选题完成</div>");
								if(null == proposal.getVerification()){
									out.print("<div style=\"width:20%;float:left;text-align:center;\">开题进行中</div>");
								}else{
									out.print("<div style=\"width:20%;float:left;text-align:center;\">开题完成</div>");
									if(thesis.getVeryfication()!=null) {
										out.print("<div style=\"width:40%;float:left;text-align:center;\">设计完成</div>");
										out.print("<div style=\"width:20%;float:left;text-align:center;\">论文审核完成</div>");
									}else{
										out.print("<div style=\"width:30%;float:left;text-align:center;\">设计进行中</div>");
										
									}
									
								}
							}
						%>
							
						</div>
						<div class="progress progressfix">
						<% 
							if(proposaldao.findByStudentid(id).isEmpty()){
								out.print("<div class=\"progress progress-striped active progress-striped-fix\"> <div class=\"bar\" style=\"width: 20%;\"></div></div>");
							}else{
								out.print("<div class=\"bar bar-warning\" style=\"width: 20%;\"></div>");
								if(null == proposal.getVerification()){
									out.print("<div class=\"progress progress-striped active progress-striped-fix\"> <div class=\"bar\" style=\"width: 20%;\"></div></div>");
								}else{
									out.print("<div class=\"bar bar-success\" style=\"width: 20%;\"></div>");
									if(thesis.getVeryfication()!=null) {
										out.print("<div class=\"bar bar-info\" style=\"width: 40%;\"></div>");
										out.print("<div class=\"bar bar-success\" style=\"width: 20%;\"></div>");
									}else{
										out.print("<div class=\"progress progress-striped active progress-striped-fix\"> <div class=\"bar\" style=\"width: 30%;\"></div></div>");
										
									}
									
								}
							}
						%>
							
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
