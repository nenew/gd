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
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>课题选择——毕业设计在线管理系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/choose.css" rel="stylesheet">
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
									<li><a href="changepw.jsp">修改密码</a>
									</li>
									<li><a href="logout">注销登录</a>
									</li>

								</ul></li>
						</ul>

					</div>
					<div class="menu">
						<ul class="nav nav-pills">
							<li><a href="main.jsp">概况信息</a>
							</li>
							<li class="dropdown active"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">毕业设计<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li class="active"><a href="choose.jsp">课题选择</a>
									</li>
									<li><a href="proposal-fill.jsp">开题报告</a>
									</li>
									<li><a href="proposal-result.jsp">开题成绩</a>
									</li>
									<li><a href="thesis-upload.jsp">论文提交</a>
									</li>
									<li><a href="thesis-result.jsp">毕设成绩</a>
									</li>
								</ul>
							</li>
							<li class="dropdown dropdowntrasparent"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">消息中心<b
									class="caret"> </b> </a>
								<ul class="dropdown-menu">
									<li><a href="message.jsp">发信息</a></li>
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
				<div class="span12 contentitle">课题选择</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow">
					<div class="boxhead">可选列表</div>
					<div class="boxcontent">
						<div>
							<table class="tablefix">
								<tr>
									<th width="20%">课题名称</th>
									<th width="40%">题目简介</th>
									<th width="10%">指导教师</th>
									<th width="10%">教师职称</th>
									<th width="10%"></th>
								</tr>

								<%
									Proposal proposal = new Proposal();
									ProposalDAO proposaldao = new ProposalDAO();
									Profile profile = new Profile();
									proposaldao.getSession().clear();
									proposaldao.getSession().beginTransaction().commit();
									Iterator<?> iterator = proposaldao.findByIschoosen(false).iterator();
									while (iterator.hasNext()) {
										proposal = (Proposal) iterator.next();

										out.print("<tr><td>");
										out.print(proposal.getThesistitle());
										out.print("</td><td>");
										out.print(proposal.getContent());
										out.print("</td><td>");
										out.print(proposal.getMain().getName());
										out.print("</td><td>");
										Set<?> set = proposal.getMain().getProfiles();
										Iterator<?> i = set.iterator();
										while (i.hasNext()) {
											Profile p = (Profile)i.next();
											out.print(p.getTitle());
										}
										;
										out.print("</td><td align=\"center\">");
										out.print("<button type=\"button\" class=\"btn btn-primary ajax\" mainid=\""+id+"\" proposalid=\""+proposal.getProposalid()+"\">选择</button>");
										out.print("</td></tr>");

									}
								%>
							</table>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel"></h3>
		</div>
		<div class="modal-body">
		</div>
		<div class="modal-footer">
			<button class="btn btn-primary result" type="button"></button>
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
	$(document).on('click','.ajax',function(e){
		e.preventDefault();
		var target=$(this);
		var data = {
			mainid:target.attr("mainid"),
			proposalid:target.attr("proposalid")
		};
		$.post('proposal-choose',data,function(data, textStatus,
							jqXHR){
				jqXHR.success(function(){
					if(data.indexOf("成功")>=0){
					$('#myModalLabel').text("选题成功");
					$('.modal-body').html("<h4 align=\"center\">选题成功，您可以进入开题报告填写页面了。</h4>");
					$('.result').text("填写开题报告").addClass("btn-success").click(function(){window.location.href='proposal-fill.jsp';});
					$('#myModal').modal('show');
 					}
 					if(data.indexOf("已经")>=0){
					$('#myModalLabel').text("选题失败");
					$('.modal-body').html("<h4 align=\"center\">选题失败，该题目已经被其他同学选择了。</h4>");
					$('.result').text("关闭").removeClass("btn-primary").attr("data-dismiss","modal").attr("aria-hidden","true");
					$('#myModal').modal('show');
 					}
 					if(data.indexOf("重复")>=0){
					$('#myModalLabel').text("选题失败");
					$('.modal-body').html("<h4 align=\"center\">选题失败，您已经选择了课题，请不要重复选择。</h4>");
					$('.result').text("关闭").removeClass("btn-primary").attr("data-dismiss","modal").attr("aria-hidden","true");
					$('#myModal').modal('show');
 					}
			});
		});
	});
	</script>
</body>
</html>
