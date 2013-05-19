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

	ProposalDAO proposaldao = new ProposalDAO();
	Proposal proposal = new Proposal();
	proposaldao.getSession().clear();
	proposaldao.getSession().beginTransaction().commit();
	Iterator <?>iterator =proposaldao.findByProperty("main.id", id).iterator();
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>开题审核——毕业设计在线管理系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/proposal-verify.css" rel="stylesheet">
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
									<li><a href="proposal-push.jsp">课题发布</a>
									</li>
									<li><a href="proposal-edit.jsp">课题修改</a>
									</li>
									<li class="active"><a href="proposal-verify.jsp">开题审核</a>
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
				<div class="span12 contentitle">开题审核</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow well chooseproposal">
				<form class="form-horizontal">
						<div class="control-group">
							<div style="text-align:center;">
								<label style="display:inline-block;margin-right:5px;">课题名称：</label>
								<select id="inputproposal">
								<%
									if(iterator.hasNext()==false){
									out.print("<option>暂无课题</option>");
									} else {
										while(iterator.hasNext()){
										proposal = (Proposal)iterator.next();
										if(proposal.getIsapproved()!=null){
										out.print("<option value=\""+proposal.getProposalid()+"\">"+proposal.getThesistitle()+"</option>");
										}
										}
									}
								 %>
								</select><label style="display:inline-block;margin-left:20px;"><button
										class="btn" id="listtitle" type="button" mainid="<%out.print(id);%>">查看</button> </label>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow well editproposal" style="display:none;">

					
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
		$('#listtitle').click(
				function(e) {
					e.preventDefault();
					var target = $(this);
					var data = {
						"mainid" : target.attr("mainid"),
						"proposalid" : $('#inputproposal').val()
					};
					$.post('proposal-verify', data, function(data, textStatus,
							jqXHR) {
						if (jqXHR.success(function() {
							$('.editproposal').html(data).show();
						}))
							;
					});

				});
		$(document).on('click','.btn-large',
				function(e) {
					e.preventDefault();
					var target = $(this);
					var data = {
						"approve":target.attr("approve"),
						"proposalid" : target.attr("proposalid")
					};
					$.post('proposal-approve', data, function(data, textStatus,
							jqXHR) {
						if (jqXHR.success(function() {
							$('#outputs').html(data).show();
						}))
							;
					});

				});
	</script>
</body>
</html>