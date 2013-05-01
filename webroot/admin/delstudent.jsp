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
				<div class="span10 offset1 boxshadow well choosestudent">
					<form class="form-horizontal">
						<div class="control-group">
							<div class="controls">
								<label style="display:inline-block;margin-right:5px;">专业：</label>
								<select id="inputdepartment">
									<option value="电子信息工程" selected="selected">电子信息工程</option>
									<option value="电子信息科学与技术">电子信息科学与技术</option>
									<option value="电气工程及其自动化">电气工程及其自动化</option>
								</select> <label
									style="display:inline-block;margin-left:20px;margin-right:5px;">年级：</label>
								<select id="inputgrade">
									<option value="2009" selected="selected">2009</option>
									<option value="2010">2010</option>
									<option value="2011">2011</option>
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
								<th style="width:15%;">序号</th>
								<th style="width:20%;">学号</th>
								<th style="width:20%;">姓名</th>
								<th style="width:15%;">修改姓名</th>
								<th style="width:15%;">密码重置</th>
								<th style="width:15%;">删除</th>
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
	<div id="renameModal" class="modal hide fade" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">修改姓名</h3>
		</div>
		<div class="modal-body">
			<form class="form-horizontal">
				<div class="control-group">
					<label class="control-label">原姓名：</label>
					<div class="controls">
						<input type="text" disabled="" id="oldname">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">新姓名：</label>
					<div class="controls">
						<input type="text" placeholder="输入新姓名" id="newname">
					</div>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			<button class="btn btn-primary" id="savename">保存</button>
		</div>
	</div>
	<div id="passwordModal" class="modal hide fade" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">修改密码</h3>
		</div>
		<div class="modal-body">
			<form class="form-horizontal">
				<div class="control-group">
					<label class="control-label">输入密码：</label>
					<div class="controls">
						<input type="password" id="password1" placeholder="输入新密码">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">再次输入：</label>
					<div class="controls">
						<input type="password" id="password2" placeholder="再次输入新密码">
					</div>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			<button class="btn btn-primary" id="savepassword">保存</button>
		</div>
	</div>
	<div id="delModal" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">删除学生</h3>
		</div>
		<div class="modal-body">
			<h1 align="center">确认删除？</h1>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
			<button class="btn btn-danger" id="delstudent">确定</button>
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
											.val(),
									"inputpage" : "",
								};
								$.post('delstudent', data, function(data,
										textStatus, jqXHR) {
									$('#contentbody').html(data);
									$('#ajax').removeClass("disabled").text(
											"查看");

								});
								$.post('countstudent', data, function(data,
										textStatus, jqXHR) {
									$('#pager').html(data);

								});
							});
				});
	</script>
	<script>
		$(document).on('click', 'a[class="pages"]', function(e) {
			e.preventDefault();
			var target = $(this);
			var data = {
				"inputdepartment" : target.attr("department"),
				"inputgrade" : target.attr("grade"),
				"inputpage" : target.attr("index"),
			};
			$.post('delstudent', data, function(data, textStatus, jqXHR) {
				$('#contentbody').html(data);
				if (target.attr("index") >= 10) {
					$('.prevpage').removeClass('disabled');
					$('.prevpage.a').attr("index", target.attr("index") - 10);
				} else {
					$('.prevpage').addClass('disabled');
				}
				if (target.attr("index") == target.attr("total")) {
					$('.nextpage').addClass('disabled');
				} else {
					$('.nextpage').removeClass('disabled');
					$('.nextpage.a').attr("index", target.attr("index") + 10);
				}

			});
		});
	</script>
	<script>
		var nametarget;
		$(document).on(
				'click',
				'button[class="renamefunction"]',
				function() {
					$('#oldname').attr("value", $(this).attr("name")).attr(
							"mainid", $(this).attr("mainid"));
					nametarget = $(this);
					$('#savename').text("保存").removeClass("disabled");

				});

		$(document).on('click', '#savename', function() {
			var data = {
				"mainid" : $('#oldname').attr("mainid"),
				"newname" : $('#newname').val()
			};
			$.post('rename', data, function(data, textStatus, jqXHR) {
				$('#savename').text(data).addClass("disabled");
				nametarget.parent().prev().text($('#newname').val());

			});
		});
		$(document).on('click', 'button[class="passwordfunction"]', function() {
			nametarget = $(this);
			$('#savepassword').text("保存").removeClass("disabled");

		});

		$(document).on(
				'click',
				'#savepassword',
				function() {
					if ($('#password1').val() == $('#password2').val()) {
						var data = {
							"newpassword" : $('#password1').val(),
							"mainid" : nametarget.attr("mainid")
						};
						$.post('changepassword', data, function(data,
								textStatus, jqXHR) {
							$('#savepassword').text(data).addClass("disabled");
						});
					}
				});
		$(document).on('click', 'button[class="delfunction"]', function() {
			nametarget = $(this);
			$('#delstudent').text("确定").removeClass("disabled");

		});

		$(document).on('click', '#delstudent', function() {
			var data = {
				"mainid" : nametarget.attr("mainid")
			};
			$.post('delfunction', data, function(data, textStatus, jqXHR) {
				$('#delstudent').text(data).addClass("disabled");
				nametarget.parent().parent().slideUp();
			});
		});
	</script>
	<!-- 	<script>
		$(document).ready(function() {
			$('a[class="pages"]').click(function(e) {
				e.preventDefault();
				var target = $(this);
				var data = {
					"inputdepartment" : target.attr("department"),
					"inputgrade" : target.attr("grade"),
					"inputpage" : target.attr("index"),
				};
				$.post('delstudent', data, function(data, textStatus, jqXHR) {
					$('#contentbody').html(data);

				});

			});
		});
	</script>

<script>
		$(document).ready(
				function() {
					$('#pager').bind(
							"mouseover",
							function() {
								$('a[class="pages"]').click(
										function(e) {
											e.preventDefault();
											var target = $(this);
											var data = {
												"inputdepartment" : target
														.attr("department"),
												"inputgrade" : target
														.attr("grade"),
												"inputpage" : target
														.attr("index"),
											};
											$.post('delstudent', data,
													function(data, textStatus,
															jqXHR) {
														$('#contentbody').html(
																data);

													});

										});
							});
				});
	</script>
-->
</body>
</html>