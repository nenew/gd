<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" import="java.net.URLDecoder"
	import="hibernate.*" import="org.hibernate.Transaction"
	import="java.text.SimpleDateFormat" import="java.text.SimpleDateFormat"%>
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

	MessageDAO messagedao = new MessageDAO();
	Message message = new Message();
	MainDAO maindao = new MainDAO();
	Iterator<?> iterator = messagedao.findByProperty("main.id", id).iterator();
	int index = 1;
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>发件箱——毕业设计在线管理系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/inbox.css" rel="stylesheet">
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
									<li><a href="#">进度信息</a>
									</li>
									<li><a href="thesis-verify.jsp">论文审核</a>
									</li>
								</ul>
							</li>
							<li class="dropdown  dropdowntrasparent active"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">消息中心<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="message.jsp">发信息</a>
									</li>
									<li><a href="inbox.jsp">收件箱</a>
									</li>
									<li class="active"><a href="outbox.jsp">发件箱</a>
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
				<div class="span12 contentitle">发件箱</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow well"
					style="padding-left:180px;padding-right:180px;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th style="width:20%;">序号</th>
								<th style="width:20%;">收件人</th>
								<th style="width:30%;">发送时间</th>
								<th style="width:30%;"></th>
							</tr>
						</thead>
						<tbody>
							<%
								while (iterator.hasNext()) {
									message = (Message) iterator.next();
									out.print("<tr><td><span class=\"badge\">" + index++ + "</span>");
									if (message.getIsread() == true)  {out.print(" <span class=\"label label-success\">对方已读</span>");}
									else out.print(" <span class=\"label label-info\">对方未读</span>");
									out.print("<td>" + maindao.findById(message.getToid()).getName() + "</td>");
									SimpleDateFormat dateformat = new SimpleDateFormat("yyyy'年'MM'月'dd'日' HH'时'mm'分'");
									out.print("<td>" + dateformat.format( message.getSendtime()) + "</td>");
									out.print("<td>" + "<a class=\"msg\" msgnum=\"" + message.getMsgnum()
										 + "\" msgreceiver=\""+maindao.findById(message.getToid()).getName()+"\" msgdate=\""
										 + dateformat.format( message.getSendtime())
										 +"\" msgstatus=\""+message.getIsread()
										  +"\" href=\"#myModal\" role=\"button\" data-toggle=\"modal\"><strong>查看信息</strong></a>" + "</td></tr>");
								}
							%>
							<tr><td></td><td></td><td></td><td></td></tr>
<!-- 						<tr>
								<td><span class="badge">1</span> <span
									class="label label-info">新信息</span>
								</td>
								<td>teacher</td>
								<td>2012-00-00 18:49</td>
								<td><a href=""><strong>点此查看</strong> </a></td>
							</tr>
							<tr>
								<td><span class="badge">2</span></td>
								<td>teacher</td>
								<td>2012-00-00</td>
								<td><a class="df"><strong>点此查看</strong> </a></td>
							</tr>
							<tr>
								<td><span class="badge">3</span></td>
								<td>teacher</td>
								<td>2012-00-00</td>
								<td><a><strong>点此查看</strong> </a></td>
							</tr>
							<tr>
								<td><span class="badge">4</span></td>
								<td>teacher</td>
								<td>2012-00-00</td>
								<td><a><strong>点此查看</strong> </a></td>
							</tr>
							-->
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div>
			<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">信息内容</h3>
				</div>
				<div class="modal-body">
					<p></p>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
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
					$('.msg').click(
							function(e) {
								e.preventDefault();
								var data = {
									"msgnum" : $(this).attr("msgnum")
								};
								var msgreceiver =$(this).attr("msgreceiver");
								var msgdate = $(this).attr("msgdate");
								var msgstatus;
								if($(this).attr("msgstatus") == "true") {msgstatus ="对方已读";}
								else {msgstatus = "对方未读";}
								
								$.post('../message-sent', data, function(data,
										textStatus, jqXHR) {
									if (jqXHR.success(function() {
										$('.modal-body').html("<p>发送时间:"+msgdate+"</p><p>收件人:"+msgreceiver+"</p><p>信息状态："+ msgstatus+"</p><p>信息内容:<br><br>"+data+"</p>");
									}))
										;
								});

							});

				});
	</script>
</body>
</html>