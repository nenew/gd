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
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>毕设配置——毕业设计在线管理系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/dutyset.css" rel="stylesheet">
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
							<li class="dropdown  dropdowntrasparent active"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">毕业设计<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="teacherset.jsp">教师分配</a></li>
									<li class="active"><a href="dutyset.jsp">毕设配置</a></li>
								</ul></li>
							<li class="dropdown  dropdowntrasparent"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">管理功能<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="addstudent.jsp">添加学生</a></li>
									<li><a href="delstudent.jsp">学生管理</a></li>
									<li><a href="addteacher.jsp">添加教师</a></li>
									<li><a href="delteacher.jsp">教师管理</a></li>
									<li><a href="addadmin.jsp">添加管理员</a></li>
									<li><a href="deladmin.jsp">管理员管理</a></li>
								</ul></li>
							<li class="dropdown  dropdowntrasparent"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">消息中心<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="message.jsp">发信息</a></li>
									<li><a href="inbox.jsp">收件箱</a></li>
									<li><a href="outbox.jsp">发件箱</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid containerfix">
			<div class="row-fluid">
				<div class="span12 contentitle">毕设配置</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow well choosestudent">
					<form class="form-horizontal">
						<div class="control-group">
							<div style="text-align:center;">
								<label style="display:inline-block;margin-right:5px;">专业：</label>
								<select id="inputdepartment">
									<option value="电子信息工程" selected="selected">电子信息工程</option>
									<option value="电子信息科学与技术">电子信息科学与技术</option>
									<option value="电气工程及其自动化">电气工程及其自动化</option>
								</select> <label style="display:inline-block;margin-left:20px;"><button
										class="btn" id="ajax" type="button">查看</button> </label>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow well liststudent">
					<table class="table table-hover" style="text-align:center;">
						<thead>
							<tr>
								<th style="width:20%;">序号</th>
								<th style="width:20%;">编号</th>
								<th style="width:15%;">姓名</th>
								<th style="width:15%;">课题数目</th>
								<th style="width:15%;">设置数目</th>
								<th style="width:15%;">设定</th>
							</tr>
						</thead>
						<tbody id="contentbody">

							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<div id="pager"></div>
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
									"inputpage" : "",
								};
								$.post('dutyset', data, function(data,
										textStatus, jqXHR) {
									$('#contentbody').html(data);
									$('#ajax').removeClass("disabled").text(
											"查看");

								});
								$.post('countduty', data, function(data,
										textStatus, jqXHR) {
									$('#pager').html(data);

								});
							});
				});
	</script>
	<script>
		$(document).on(
				'click',
				'a[class="pages"]',
				function(e) {
					e.preventDefault();
					var target = $(this);
					var data = {
						"inputdepartment" : target.attr("department"),
						"inputpage" : target.attr("index"),
					};
					$.post('dutyset', data,
							function(data, textStatus, jqXHR) {
								$('#contentbody').html(data);
								if (target.attr("index") >= 10) {
									$('.prevpage').removeClass('disabled');
									$('a[class="prev"]').attr("index",
											target.attr("index") - 10);
								} else {
									$('.prevpage').addClass('disabled');
								}
								if (target.attr("index") == target
										.attr("total")) {
									$('.nextpage').addClass('disabled');
								} else {
									$('.nextpage').removeClass('disabled');
									$('a[class="next"]').attr("index",
											target.attr("index") - 1 + 11);
								}

							});
				});

		$(document).on('click', 'a[class="prev"]', function(e) {
			e.preventDefault();
			var target = $(this);
			var data = {
				"inputdepartment" : target.attr("department"),
				"inputpage" : target.attr("index"),
			};
			$.post('dutyset', data, function(data, textStatus, jqXHR) {
				$('#contentbody').html(data);
				if (target.attr("index") >= 10) {
					$('a[class="next"]').attr("index", target.attr("index"));
					target.attr("index", target.attr("index") - 10);
					$('.nextpage').removeClass('disabled');
				} else {
					$('.prevpage').addClass('disabled');
					$('.nextpage').removeClass('disabled');
				}
			});
		});
		$(document).on('click', 'a[class="next"]', function(e) {
			e.preventDefault();
			var target = $(this);
			var data = {
				"inputdepartment" : target.attr("department"),
				"inputpage" : target.attr("index"),
			};
			$.post('dutyset', data, function(data, textStatus, jqXHR) {
				$('#contentbody').html(data);
				if (target.attr("index") < target.attr("total")) {
					$('a[class="prev"]').attr("index", target.attr("index"));
					target.attr("index", target.attr("index") - 1 + 11);
					$('.prevpage').removeClass('disabled');
				} else {
					$('.nextpage').addClass('disabled');
					$('.prevpage').removeClass('disabled');
				}
			});
		});
	</script>
	<script>
		var nametarget;
		$(document).on('click', '.btnfix', function() {
			nametarget = $(this);
			nametarget.text("设定中...");
			var data = {
				"mainid" : nametarget.parent().prev().children('select').attr("mainid"),
				"value" :  nametarget.parent().prev().children('select').val(),
				
			};
			$.post('dutynumset', data, function(data, textStatus, jqXHR) {
			}).success(function() {
				nametarget.text("修改成功");
				nametarget.parent().prev().prev().text(nametarget.parent().prev().children('select').val());
			});
		});
	</script>
</body>
</html>