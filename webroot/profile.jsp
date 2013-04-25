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
	if (request.getSession().getAttribute("islogin") == null || !request.getSession().getAttribute("islogin").equals("yes"))
		{response.sendRedirect("index.jsp");return;}
		
	Integer id = (Integer) request.getSession().getAttribute("id");
	String name = (String) request.getSession().getAttribute("name");
	Integer priority = (Integer) request.getSession().getAttribute(
	"priority");
	Profile profile = new Profile();
	ProfileDAO profiledao = new ProfileDAO();
	profiledao.getSession().clear();
	profiledao.getSession().beginTransaction().commit();
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

<title>信息维护——毕业设计在线管理系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/profile.css" rel="stylesheet">
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
							<li><a href="main.jsp">概况信息</a>
							</li>
							<li class="dropdown  dropdowntrasparent"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">毕业设计<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="choose.jsp">课题选择</a>
									</li>
									<li><a href="proposal-fill.jsp">开题报告</a>
									</li>
									<li><a href="#">进度信息</a>
									</li>
									<li><a href="thesis-upload.jsp">论文提交</a>
									</li>
								</ul>
							</li>
							<li class="dropdown  dropdowntrasparent"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">消息中心<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="message.jsp">发信息</a></li>
									<li><a href="inbox.jsp">收件箱</a></li>
									<li><a href="outbox.jsp">发件箱</a></li>
								</ul>
							</li>
							<li class="active"><a href="profile.jsp">信息维护</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid containerfix">
			<div class="row-fluid">
				<div class="span12 contentitle">信息维护</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow">
					<div class="boxhead">更新信息</div>
					<div class="boxcontent">
						<%
							//	String pus = (String) session.getAttribute("profileupdatestatus");
											//	if (pus != null && pus.equals("1")) {
											//		session.setAttribute("profileupdatestatus", "0");
											//		out.print("<div class=\"alert alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>更新成功.</strong></div>");
											//	}
						%>
						<div class="alert alert-success" style="display: none;">
							<button type="button" class="close" data-dismiss="alert">×</button>
							<strong>更新成功!</strong>
						</div>
						<form name="proposal" id="proposal" action="profile-update"
							method="post">
							<div>
								姓名：<%
								out.print(profile.getMain().getName());
							%><br> 学号：<%
								out.print(profile.getMain().getNum());
							%><br> 年级：
								<%
								out.print(profile.getGrade());
							%><br> 电话：<input type="number" name="phonenum"
									value="<%out.print(profile.getPhonenum());%>"> <br>
								邮箱：<input type="email" name="email"
									value="<%out.print(profile.getEmail());%>"> <br> <input
									name="userid" type="hidden" value="1" />
							</div>
							<button class="btn btn-primary" type="submit">提交</button>
							<button class="btn btn-primary" id="ajax" type="button">ajax</button>
						</form>
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

								var data = {
									"userid" : $('input[name="userid"]').val(),
									"phonenum" : $('input[name="phonenum"]')
											.val(),
									"email" : $('input[name="email"]').val()
								};
								$.post('profile-update', data, function(
										data, textStatus, jqXHR) {
									//						alert(textStatus+jqXHR);
									if (jqXHR.success(function() {
										$('.alert').slideDown().delay(1500)
												.slideUp();
									}))
										;
									//					if (jqXHR.error(function() {
									//							alert("失败");
									//					}))
									//										;
									//					alert(jqXHR.status + jqXHR.statusText);

								});

							});
				}

		);
	</script>


</body>
</html>
