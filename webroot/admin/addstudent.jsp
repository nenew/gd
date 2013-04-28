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
	Transaction tx = profiledao.getSession().beginTransaction();
	tx.commit();

	//								Iterator<?> iterator = profiledao.findByProperty("main.id",
	//										user.getId()).iterator();
	Iterator<?> iterator = profiledao.findByProperty("main.id", id)
	.iterator();
	while (iterator.hasNext()) {
		profile = (Profile) iterator.next();
	}

	Iterator<?> iterator2 = proposaldao.findByStudentid(id).iterator();
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
<link href="css/addstudent.css" rel="stylesheet">
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
							<li class="dropdown  dropdowntrasparent"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">毕业设计<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="teacherset.jsp">教师分配</a>
									</li>
									<li><a href="dutyset.jsp">毕设配置</a>
									</li>
								</ul>
							</li>
							<li class="dropdown  dropdowntrasparent"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">管理功能<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="addstudent.jsp">添加学生</a>
									</li>
									<li><a href="delstudent.jsp">删除学生</a>
									</li>
									<li><a href="addteacher.jsp">添加教师</a>
									</li>
									<li><a href="delteacher.jsp">删除教师</a>
									</li>
									<li><a href="addadmin.jsp">添加管理员</a>
									</li>
									<li><a href="deladmin.jsp">删除管理员</a>
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
				<div class="span12 contentitle">添加学生</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow">
					<div class="boxhead">填写信息</div>
					<div class="boxcontent">
						<div id="formcontainer">
							<form class="form-horizontal" id="proposal" action="addstudent"
								method="post">
								<div class="control-group">
									<label class="control-label">姓名：</label>
									<div class="controls">
										<input type="text" id="inputname" name="inputname"
											placeholder="输入学生姓名"> <span>(不可更改)</span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">学号：</label>
									<div class="controls">
										<input type="number" id="inputnum" name="inputnum"
											placeholder="输入学生学号"> <span>(不可更改)</span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">密码：</label>
									<div class="controls">
										<input type="number" id="inputpassword" name="inputpassword"
											placeholder="输入初始密码">
									</div>
								</div>
								<div class="control-group">
									<div class="controls">
										<button class="btn btn-primary" id="ajax" type="button">提交</button>
										<button class="btn btn-primary">提交哦哦哦</button>
									</div>
								</div>
							</form>
						</div>
						<div id="info" style="display:none;">
						</div>
						<div style="clear:both;"></div>

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
	<script>
		$(document).ready(
				function() {
					$('#ajax').click(
							function() {
								$('#send').addClass("disabled").text("添加中...");
								var data = {
									"inputname" : $('input[name="inputname"]')
											.val(),
									"inputnum" : $('input[name="inputnum"]')
											.val(),
									"inputpassword" : $('input[name="inputpassword"]')
											.val()
								};
								$.post('addstudent', data, function(data,
										textStatus, jqXHR) {
									$('#info').html(data).slideDown().delay(2500).slideUp();

									})
										;

								});
							});
				
	</script>
</body>
</html>