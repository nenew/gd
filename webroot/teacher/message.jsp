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
	ProposalDAO proposaldao = new ProposalDAO();
	Proposal proposal = new Proposal();
	MainDAO maindao = new MainDAO();
	Main main = new Main();
	proposaldao.getSession().clear();
	proposaldao.getSession().beginTransaction().commit();
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>发消息——毕业设计在线管理系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/message.css" rel="stylesheet">
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
							<li><a href="main.jsp">概况信息</a>
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
							<li class="dropdown  dropdowntrasparent active"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">消息中心<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li class="active"><a href="message.jsp">发信息</a>
									</li>
									<li><a href="inbox.jsp">收件箱</a></li>
									<li><a href="outbox.jsp">发件箱</a></li>
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
				<div class="span12 contentitle">发消息</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow well">
					<div class="alert alert-success"
						style="display: none;margin-left:180px;margin-right:180px;">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>发送成功!</strong>
					</div>
					<form class="form-horizontal" action="message-sender" method="post">
						<div class="control-group">
							<label class="control-label">收件人：</label>
							<div class="controls">
								<select name="receiver">
									<%	
										Iterator<?> iterator = proposaldao.findByProperty("main.id", id).iterator();
										if(iterator.hasNext()!=false){
										while (iterator.hasNext()) {
												proposal =(Proposal) iterator.next();
												main =maindao.findById(proposal.getStudentid());
												out.print("<option value=\"" + main.getId()
										+ "\">"	+ main.getName() + "</option>");}
										}
										
										Iterator<?> admins = maindao.findByPriority(3).iterator();
										while (admins.hasNext()) {
										main = (Main) admins.next();
										out.print("<option value=\"" + main.getId() + "\">"
										+ main.getName() + "</option>");
										}
									%>

								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">内容：</label>
							<div class="controls" style="margin-right:180px;">
								<textarea rows="8" style="width:100%;" name="content"></textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">
								<button type="button" class="btn btn-primary" id="send">发送</button>
							</label>
						</div>
					</form>
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
	<script>
		$(document).ready(
				function() {
					$('#send').click(
							function() {
								$('#send').addClass("disabled").text("发送中...");
								var data = {
									"receiver" : $('select[name="receiver"]')
											.val(),
									"content" : $('textarea[name="content"]')
											.val()
								};
								$.post('../message-sender', data, function(data,
										textStatus, jqXHR) {
									//						alert(textStatus+jqXHR);
									if (jqXHR.success(function() {
										//										$('.alert').slideDown().delay(1500)
										//												.slideUp();
										$('.alert').slideDown();
										$('#send').remove();

									}))
										;
									//									if (jqXHR.error(function() {
									//										alert("失败");
									//									}))
									//										;
									//									alert(jqXHR.status + jqXHR.statusText);

								});
							});
				}

		);
	</script>
</body>
</html>
