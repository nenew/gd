<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" import="java.net.URLDecoder"
	import="hibernate.*" import="org.hibernate.Transaction"
	import="java.text.SimpleDateFormat" import="java.text.SimpleDateFormat"%>
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

	MessageDAO messagedao = new MessageDAO();
	Message message = new Message();
	Iterator<?> iterator = messagedao.findByToid(id).iterator();
	int index = 1;
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>收件箱——毕业设计在线管理系统</title>
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
							<li class="dropdown  dropdowntrasparent active"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">消息中心<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="message.jsp">发信息</a>
									</li>
									<li class="active"><a href="inbox.jsp">收件箱</a>
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
				<div class="span12 contentitle">收件箱</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow well"
					style="padding-left:180px;padding-right:180px;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th style="width:20%;">序号</th>
								<th style="width:20%;">发件人</th>
								<th style="width:30%;">发送时间</th>
								<th style="width:30%;"></th>
							</tr>
						</thead>
						<tbody>
							<%
								while (iterator.hasNext()) {
									message = (Message) iterator.next();
									out.print("<tr><td><span class=\"badge\">" + index++ + "</span>");
									if (message.getIsread() == false)  out.print(" <span class=\"label label-info\">新信息</span>");
									out.print("<td>" + message.getMain().getName() + "</td>");
									SimpleDateFormat dateformat = new SimpleDateFormat("yyyy'年'MM'月'dd'日' HH'时'mm'分'");
									out.print("<td>" + dateformat.format( message.getSendtime()) + "</td>");
									out.print("<td>" + "<a class=\"msg\" msgnum=\"" + message.getMsgnum()
										 + "\" msgsender=\""+message.getMain().getName()+"\" msgdate=\""
										 + dateformat.format( message.getSendtime())
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
	<script src="js/myscript.js"></script>
	<script>
		$(document).ready(
				function() {
					$('.msg').click(
							function(e) {
								e.preventDefault();
								var data = {
									"msgnum" : $(this).attr("msgnum")
								};
								var msgsender =$(this).attr("msgsender");
								var msgdate = $(this).attr("msgdate");
								$.post('../message-get', data, function(data,
										textStatus, jqXHR) {
									if (jqXHR.success(function() {
										$('.modal-body').html("<p>发送时间:"+msgdate+"</p><p>发件人:"+msgsender+"</p><p>信息内容:<br><br>"+data+"</p>");
									}))
										;
								});

							});

				});
	</script>
</body>
</html>
