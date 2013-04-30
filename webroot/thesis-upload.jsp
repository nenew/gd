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
	ThesisDAO thesisdao = new ThesisDAO();
	Thesis thesis = new Thesis();
	Iterator <?>iterator = thesisdao.findByProperty("main.id", id).iterator();
	while (iterator.hasNext()){
		thesis = (Thesis)iterator.next();
	}
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>论文提交——毕业设计在线管理系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/thesis-upload.css" rel="stylesheet">
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
							<li class="dropdown active"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">毕业设计<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="choose.jsp">课题选择</a></li>
									<li><a href="proposal-fill.jsp">开题报告</a></li>
									<li><a href="#">进度信息</a></li>
									<li class="active"><a href="thesis-upload.jsp">论文提交</a></li>
								</ul></li>
							<li class="dropdown  dropdowntrasparent"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">消息中心<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="message.jsp">发信息</a></li>
									<li><a href="inbox.jsp">收件箱</a></li>
									<li><a href="outbox.jsp">发件箱</a></li>
								</ul></li>
							<li><a href="profile.jsp">信息维护</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid containerfix">
			<div class="row-fluid">
				<div class="span12 contentitle">论文提交</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow well">
					<div id="uploadarea">请将要上传的论文拖入框内.</div>
					<div id="info">
						<div id="msg">文件信息：</div>
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
		var target;
		var msg;
		var filelist;
		function setMain(t) {
			var main = document.getElementById("uploadarea");
			main.innerHTML = t;
		}
		function setInfo(t) {
			var main = document.getElementById("msg");
			main.innerHTML = t;
		}

		function upload(a) {
			var xhr = new XMLHttpRequest();
			var fd = new FormData();
			var ff = a.parentNode;
			var newhref = '<a index="' + $(a).index()
					+ '" class="btn btn-primary disabled">上传中...</a>';
			console.log(newhref);
			$(newhref).insertBefore(a);
			$(a).remove();
			console.log($(a));
			$(
					'<p><div class="progress"><div class="bar" style="width: 0%;"></div></div></p>')
					.insertAfter(ff);
			[].forEach.call(filelist, function(f, index) {
				console.log(index);

				if (index == a.getAttribute("index")) {

					console.log(index);
					fd.append('files[]', f);
					console.log(fd);

				}
			});
			xhr.upload.onprogress = function(e) {
				console.log($('.progress'));
				console.log(e.loaded / e.total);
				var percentage = Math.round(e.loaded / e.total * 100) + "%";
				$('.bar').width(percentage);
				console.log(percentage);
			};
			xhr.onreadystatechange = function() {
				console.log("readyState:" + xhr.readyState + "   status:"
						+ xhr.status);
				if (xhr.readyState == 4 && xhr.status == 200) {
					$('.bar').width("100%");
					$('.progress').fadeOut(2000, function() {
						$('.progress').remove();
						$('.disabled').text("上传成功");
					});
					// $('.disabled').text("上传成功");

					console.log("upload successful!");
				}
				;
				if (xhr.readyState == 4 && xhr.status == 0) {
						$('.progress').remove();
						$('<button class=\"btn btn-primary\" type=\"button\" onclick=\"upload(this);\" index=\"0\">上传文件</button>').insertBefore('.disabled');
						$('.disabled').remove();
					console.log("服务器无响应，上传失败！");
				}
				;
			};
			xhr.error = function() {
				console.log("error connection");
			};
			xhr.timeout = 300;
			xhr.ontimeout = function(event) {
				console.log("time out !");
			};
			xhr.open('POST', 'http://127.0.0.1/bootstrap/thesis-upload');
			xhr.send(fd);

		}

		function drup() {
			target = document.getElementById("uploadarea");
			var area = document.getElementById("main");
			document.getElementById("info").className = "hide";
			$('.progress').hide();
			area.addEventListener("dragenter", handleDragEnter, false);
			target.addEventListener("dragover", handleDragOver, false);
			target.addEventListener("dragleave", handleDragLeave, false);
			target.addEventListener("drop", handleDrop, false);

		}
		function handleDragEnter(e) {
			document.getElementById("uploadarea").className = "dragover";
			e.stopPropagation();
			e.preventDefault();
		}
		function handleDragOver(e) {
			var msg = "放入.";
			setMain(msg);
			e.stopPropagation();
			e.preventDefault();
		}
		function handleDragLeave(e) {
			var msg = "请将要上传的论文拖入框内.";
			setMain(msg);
			e.stopPropagation();
			e.preventDefault();
		}
		function handleDrop(e) {
			filelist = e.dataTransfer.files;
			if (filelist) {
				if (filelist.length == 1) {
					[].forEach
							.call(
									filelist,
									function(f, index) {
										if (f.type.toString().indexOf("word") != -1) {
											msg = '<div class="alert alert-success fade in"><button type="button" class="close" data-dismiss="alert">&times;</button>'
													+ "总共上传文件数 : "
													+ filelist.length
													+ "<% if(thesis.getIsuploaded() == true) out.print("  (论文已上传，本次上传将覆盖原文件)");%></div>";
											msg += '<div class="well">文件名 : '
													+ f.name + "<br>";
											msg += "文件类型 : " + f.type + "<br>";
											msg += "文件大小 : " + f.size
													+ " KB<br>";
											msg += "<p align=\"right\">";
											msg += "<span><button type=\"button\" class=\"btn btn-primary\" onclick=\"upload(this);\" index=\""
													+ index
													+ "\">上传文件</button></span>";

											msg += "</p></div>";
											document
													.getElementById("uploadarea").className = "hide";
											document.getElementById("info").className = "";

											setInfo(msg);
										} else
											setMain("只允许上传word文档格式论文！");
									});
					setInfo(msg);
				} else
					setMain("只能上传一个文件！");

			}

			e.stopPropagation();
			e.preventDefault();
		}
		window.addEventListener("load", drup, false);
	</script>

</body>
</html>
