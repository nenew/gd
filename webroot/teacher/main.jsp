<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" import="java.net.URLDecoder"
	import="hibernate.*" import="org.hibernate.Transaction"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/teacher/";
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
	Transaction tx = profiledao.getSession().beginTransaction();
	tx.commit();

	//								Iterator<?> iterator = profiledao.findByProperty("main.id",
	//										user.getId()).iterator();
	Iterator<?> iterator = profiledao.findByProperty("main.id", id)
			.iterator();
	while (iterator.hasNext()) {
		profile = (Profile) iterator.next();
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
									<li><a href="proposal-push.jsp">课题发布</a>
									</li>
									<li><a href="proposal-edit.jsp">课题修改</a>
									</li>
									<li><a href="proposal-verify.jsp">开题审核</a>
									</li>
									<li><a href="thesis-verify.jsp">论文审核</a>
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
							if (profile.getPhonenum() == null) {
								out.print("请先填写个人信息！");
							} else {
								out.print("专业：" + profile.getDepartment() + "<br>");
								if(profile.getTitle().equalsIgnoreCase("ASSOCIATEPROFESSOR")){out.print("职称：副教授<br>");}
								if(profile.getTitle().equalsIgnoreCase("ROFESSOR")){out.print("职称：教授<br>");}
								if(profile.getTitle().equalsIgnoreCase("lecturer")){out.print("职称：讲师<br>");}
								out.print("电话：" + profile.getPhonenum() + "<br>");
								out.print("邮箱：" + profile.getEmail() + "<br>");
							}
						%>
					</div>
				</div>
				<div class="span3 boxshadow" style="margin-left:6.38298%;">
					<div class="boxhead">课题信息</div>
					<div class="boxcontent">
						<%
							ManagementDAO managementdao = new ManagementDAO();
							if (managementdao.findByProperty("main.id", id).isEmpty())
							 {
								out.print("请先发布课题！");
							} else {
								Management management = (Management)managementdao.findByProperty("main.id", id).iterator().next();
								out.print("可发布课题数目："+ management.getLimitnum() + "<br>");
								out.print("已发布课题数目：" + proposaldao.counts("main.id", id) + "<br>");
								int count = 0;
								int verify=0;
								Iterator counts = proposaldao.findByProperty("main.id", id).iterator();
								while(counts.hasNext()){
									proposal = (Proposal)counts.next();
									if(proposal.getStudentid()!=null){count++;}
									if(proposal.getVerification()!=null){verify++;}
								}
								out.print("已被选课题数目：" + count + "<br>");
								out.print("已开题课题数目：" + verify + "<br>");

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
					<div class="boxhead">学生信息</div>
					<div class="boxcontent">
						    <table class="table table-hover">
						    <thead>
                <tr>
                  <th>序号</th>
                  <th>课题名称</th>
                  <th>学生姓名</th>
                  <th>学生电话</th>
                  <th>学生邮箱</th>
                  
                </tr>
              </thead>
              <tbody>
              <% 
              	Iterator <?>info = proposaldao.findByProperty("main.id", id).iterator();
              	MainDAO maindao = new MainDAO();
              	int index = 1;
              	if(info.hasNext()){
              	while(info.hasNext()){
              		proposal = (Proposal)info.next();
              		if(proposal.getStudentid()!=null){
              			out.print("<tr><td><span class=\"badge\">"+index++ +"</span></td>");
              			out.print("<td>"+proposal.getThesistitle()+"</td>");
              			out.print("<td>"+maindao.findById(proposal.getStudentid()).getName()+"</td>");
              			profile = (Profile)maindao.findById(proposal.getStudentid()).getProfiles().iterator().next();
              			if(profile.getPhonenum()!=null){
              				out.print("<td>"+profile.getPhonenum()+"</td>");
              			}else{
              				out.print("<td>暂未填写</td>");
              			}
              			if(profile.getEmail()!=null){
              				out.print("<td>"+profile.getEmail()+"</td>");
              			}else{
              				out.print("<td>暂未填写</td></tr>");
              			}
              		}
              	}	
              	}else	{
              		out.print("<tr><td>暂无学生</td></tr>");
              	}
              %>
              </tbody>
   						 </table>
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
