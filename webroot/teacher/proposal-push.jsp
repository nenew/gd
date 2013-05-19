<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" import="java.net.URLDecoder"
	import="hibernate.*" import="org.hibernate.Transaction"
	import="java.sql.*"%>
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
	ManagementDAO managementdao = new ManagementDAO();
	Management management = new Management();
	ProposalDAO proposaldao = new ProposalDAO();
	managementdao.getSession().clear();
	managementdao.getSession().beginTransaction().commit();
	Iterator<?> iterator = managementdao.findByProperty("main.id", id).iterator();
	while (iterator.hasNext()) {
		management = (Management) iterator.next();
	}
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>课题发布——毕业设计在线管理系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/proposal-push.css" rel="stylesheet">
<link href="css/custom-theme/jquery-ui-1.10.0.custom.css"
	rel="stylesheet">
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="css/custom-theme/jquery.ui.1.10.0.ie.css"/>
<![endif]-->
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
									<li><a href="../changepw.jsp">修改密码</a></li>
									<li><a href="../logout">注销登录</a></li>

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
									<li class="active"><a href="proposal-push.jsp">课题发布</a>
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
				<div class="span12 contentitle">课题发布</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow well">
					<%
						if(management.getPermission()==false){
										 out.print("<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><h4 align=\"center\">您没有开题权限,请联系管理员处理。</h4></div>");
									 } else {
									if(management.getLimitnum()==null){
										 out.print("<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><h4  align=\"center\">您的开题数量尚未设置，请联系管理员处理。</h4></div>");
									 } else {
									 if(management.getLimitnum()<=proposaldao.count(id+"")){
										 out.print("<div class=\"alert alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button>您总共可以添加题目数：<strong> "+ management.getLimitnum()+"</strong> ，现已全部添加完毕。</div>");	
									 } else {
										 out.print("<div class=\"alert alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button>您总共可以添加题目数：<strong> "+ management.getLimitnum()+"</strong> ，还可以添加题目数：<strong>"+(management.getLimitnum()-proposaldao.count(id+""))+" </strong>  。</div>");
					%>
					<form>
						<div>
							<h3>毕业设计题目：</h3>
							<input type="text" placeholder="请输入毕业设计题目" id="propossaltitle">
						</div>
						<div class="clearfix">
							<div style="float:left;">
								<h5>开始日期：</h5>
								<input id="startdate" type="text" value="03/03/2013">
							</div>
							<div style="float:left;margin-left:30px;">
								<h5>结束日期：</h5>
								<input id="enddate" type="text" value="06/01/2013">
							</div>
						</div>
						<div>
							<h3>设计要求：</h3>
							<textarea id="proposalrequirement"
								style="width:100%;height:100px;">
								<%
									
								%>
							</textarea>
						</div>
						<div>
							<h3>设计内容：</h3>
							<textarea id="proposalcontent" style="width:100%;height:100px;">
								<%
									
								%>
							</textarea>
						</div>


						<div>
							<h3>技术标准和参数：</h3>
							<textarea id="proposalstanderd" style="width:100%;height:100px;">
								<%
									
								%>								
								</textarea>
						</div>
						<div>
							<h3>进度计划：</h3>
							<textarea id="proposalprocess" style="width:100%;height:100px;">
								<%
									
								%>								
								</textarea>
						</div>
						<div>
							<h3>参考文献：</h3>
							<textarea id="proposalliterature"
								style="width:100%;height:100px;">
								<%
									
								%>								
								</textarea>
						</div>
						<div class="clearfix">
							<br>
							<div class="pull-left">
							<button class="btn btn-primary" type="button" id="pushit" mainid="<% out.print(id);%>">提交</button>
							</div>
							<div id="outputs"></div>
					</div>
					</form>
					<%
						}
									 }
								 }
					%>
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
	<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="../editor/tinymce.min.js"></script>
	<script type="text/javascript">
		tinymce
				.init({
					selector : "textarea",
					plugins : [
							"advlist autolink lists link image charmap print preview anchor",
							"searchreplace visualblocks code fullscreen",
							"insertdatetime media table contextmenu paste" ],
					toolbar : "insertfile undo redo | styleselect | bold italic fontselect fontsizeselect | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
					autosave_ask_before_unload : false,
					max_height : 200,
					min_height : 160,
					height : 180,
					init_instance_callback : "hidetinymce"

				});
		var i = 3;
		function hidetinymce(inst) {
			console.log("test");
			if (--i == 0) {
				try {
					//	      			tinyMCE.get('1').hide();
					//					tinyMCE.get('2').hide();
					//					tinyMCE.get('3').hide();

					console.log("hidedone");
				} catch (error) {

				}
			}
		}
	</script>
	<script>
		//datepicker jQuery UI
		$("#startdate").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 2,
			onClose : function(selectedDate) {
				$("#rangeBb").datepicker("option", "minDate", selectedDate);
			}
		});
		$("#enddate").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 2,
			onClose : function(selectedDate) {
				$("#rangeBa").datepicker("option", "maxDate", selectedDate);
			}
		});
	</script>
	<script>
		$('#pushit').click(
				function(e) {
					e.preventDefault();
					var target = $(this);
					var data = {
						"mainid" : target.attr("mainid"),
						"propossaltitle" : $('#propossaltitle').val(),
						"startdate":$('#startdate').val(),
						"enddate":$('#enddate').val(),
						"proposalrequirement": tinyMCE.get('proposalrequirement').getContent(),
						"proposalcontent": tinyMCE.get('proposalcontent').getContent(),
						"proposalstanderd": tinyMCE.get('proposalstanderd').getContent(),
						"proposalprocess": tinyMCE.get('proposalprocess').getContent(),
						"proposalliterature": tinyMCE.get('proposalliterature').getContent()
					};
					$.post('proposal-push', data, function(data, textStatus,
							jqXHR) {
						if (jqXHR.success(function() {
							$('#outputs').html(data);
							if(data.indexOf("成功")>=0){
							target.removeClass("btn-primary").addClass("btn-success").text("提交成功");}
						}))
							;
					});

				});
	</script>
</body>
</html>
