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

	MainDAO maindao = new MainDAO();
	Main main = new Main();
	Iterator<?> iterator = maindao.findAll().iterator();
	int index = 1;
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>学生管理——毕业设计在线管理系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/delstudent.css" rel="stylesheet">
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
								</ul>
							</li>
							<li class="dropdown  dropdowntrasparent active"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">管理功能<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="addstudent.jsp">添加学生</a>
									</li>
									<li class="active"><a href="delstudent.jsp">学生管理</a>
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
				<div class="span12 contentitle">学生管理</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow well"
					style="padding-top: 20px; padding-bottom: 0px;">
					<form class="form-horizontal">
						<div class="control-group">
							<div class="controls">
								<label style="display:inline-block;margin-right:5px;">专业：</label>
								<select id="inputdepartment">
									<option value="电子信息工程" selected="selected">电子信息工程</option>
									<option value="电子信息科学与技术">电子信息科学与技术</option>
									<option>电气工程及其自动化</option>
									<option>4</option>
									<option>5</option>
								</select> <label
									style="display:inline-block;margin-left:20px;margin-right:5px;">年级：</label>
								<select id="inputgrade">
									<option value="2009" selected="selected">2009</option>
									<option value="2010">2010</option>
									<option>电气工程及其自动化</option>
									<option>4</option>
									<option>5</option>
								</select> <label style="display:inline-block;margin-left:20px;"><button
										class="btn" id="ajax" type="button">查看</button> </label>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow well"
					style="padding-left:150px;padding-right:150px;margin-top:0px;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th style="width:15%;">序号</th>
								<th style="width:25%;">学号</th>
								<th style="width:20%;">姓名</th>
								<th style="width:20%;">密码重置</th>
								<th style="width:20%;">删除</th>
							</tr>
						</thead>
						<tbody id="contentbody">
							<%
								while (iterator.hasNext()) {
																		main = (Main) iterator.next();
																		out.print("<tr><td><span class=\"badge\">" + index++ + "</span>");
																		out.print("<td>" + main.getNum() + "</td>");
																		out.print("<td>" + main.getName() + "</td>");
																		out.print("<td>" + main.getPassword() + "</td>");
																		out.print("<td>" + "<a class=\"msg\" msgnum=\""+ "\" msgsender=\""+"\" msgdate=\""+"\" href=\"#myModal\" role=\"button\" data-toggle=\"modal\"><strong>查看信息</strong></a>" + "</td></tr>");
																					}
							%>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
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
								$('#ajax').addClass("disabled").text("查询中...");
								var data = {
									"inputdepartment" : $(
											'select[id="inputdepartment"]')
											.val(),
									"inputgrade" : $('select[id="inputgrade"]')
											.val()
								};
								$.post('delstudent', data, function(data,
										textStatus, jqXHR) {
									$('#contentbody').html(data);
									$('#ajax').removeClass("disabled").text(
											"查看");

								});
							});
				});
	</script>
</body>
</html>