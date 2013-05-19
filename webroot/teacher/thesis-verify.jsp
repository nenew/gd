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
	Thesis thesis = new Thesis();
	ThesisDAO thesisdao = new ThesisDAO();
	MainDAO maindao = new MainDAO();
	proposaldao.getSession().clear();
	proposaldao.getSession().beginTransaction().commit();
	Iterator <?>iterator =proposaldao.findByProperty("main.id", id).iterator();
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>论文审核——毕业设计在线管理系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/thesis-verify.css" rel="stylesheet">
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
									<li><a href="proposal-verify.jsp">开题审核</a>
									</li>
									<li class="active"><a href="thesis-verify.jsp">论文审核</a>
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
				<div class="span12 contentitle">论文审核</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow well chooseproposal">
				<table class="table table-hover" style="text-align:center;">
						<thead>
							<tr>
								<th style="width:10%;">序号</th>
								<th style="width:15%;">设计课题</th>
								<th style="width:15%;">学生姓名</th>
								<th style="width:15%;">论文下载</th>
								<th style="width:15%;">论文成绩</th>
								<th style="width:15%;">论文评分</th>
								<th style="width:15%;">设定</th>
							</tr>
						</thead>
						<tbody id="contentbody">
						<%			
									int index =1;
									if(iterator.hasNext()==false){
									out.print("<option>暂无课题</option>");
									} else {
										while(iterator.hasNext()){
										proposal = (Proposal)iterator.next();
										if(proposal.getVerification()!=null){
										if(	proposal.getVerification().equalsIgnoreCase("YES")&&thesisdao.findByProperty("main.id", proposal.getStudentid()).iterator().hasNext()==true){
										thesis = (Thesis)thesisdao.findByProperty("main.id", proposal.getStudentid()).iterator().next();
										out.print("<tr><td><span class=\"badge\">" + index++	+ "</span></td>");
										out.print("<td>"+proposal.getThesistitle()+"</td>");
										out.print("<td>"+maindao.findById(proposal.getStudentid()).getName()+"</td>");
										out.print("<td><button class=\"btn btnfix download\" type=\"button\" mainid=\""+id+"\" proposalid=\""+proposal.getProposalid()+"\">下载</button></td>");
										if(thesis.getVeryfication()==null){out.print("<td>未评定</td>");}
										else{
											String marks = thesis.getVeryfication();
											if(marks.equalsIgnoreCase("a")) out.print("<td>优秀</td>");
											if(marks.equalsIgnoreCase("b")) out.print("<td>良好</td>");
											if(marks.equalsIgnoreCase("c")) out.print("<td>中等</td>");
											if(marks.equalsIgnoreCase("d")) out.print("<td>合格</td>");
											if(marks.equalsIgnoreCase("e")) out.print("<td>不合格</td>");
										}
										out.print("<td><select class=\"selectfix\" proposalid=\""+proposal.getProposalid()+"\">");
										out.print("<option value=\"a\" proposalid=\""+proposal.getProposalid()+"\">优秀</option>");
										out.print("<option value=\"b\" proposalid=\""+proposal.getProposalid()+"\">良好</option>");
										out.print("<option value=\"c\" proposalid=\""+proposal.getProposalid()+"\">中等</option>");
										out.print("<option value=\"d\" proposalid=\""+proposal.getProposalid()+"\">合格</option>");
										out.print("<option value=\"e\" proposalid=\""+proposal.getProposalid()+"\">不合格</option></select></td>");
										out.print("<td><button class=\"btn btnfix verifyset\" type=\"button\" mainid=\""+id+"\" proposalid=\""+proposal.getProposalid()+"\">评定</button></td></tr>");
										}
										}
										}
									}
								 %>
							<tr>
								<td></td>
								<td></td>
								<td></td>
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
	<script>
		$('.download').click(
				function(e) {
					e.preventDefault();
					var target = $(this);
					var data = "thesis-download?mainid="+target.attr("mainid")+"&proposalid="+target.attr("proposalid");
					window.location.href=data;

				});
		$('.verifyset').click(
				function(e) {
					e.preventDefault();
					var target = $(this);
					var data = {
					mainid:target.attr("mainid"),
					proposalid:target.attr("proposalid"),
					thesisverification:target.parent().prev().children('select').val()
					};
					$.post('thesis-verify', data, function(data, textStatus,
							jqXHR) {
						if (jqXHR.success(function() {
							if(data.indexOf("Done")>=0){
							target.text("评定成功");
							var marks = target.parent().prev().children('select').val();
							if(marks=="a")marks="优秀";
							if(marks=="b")marks="良好";
							if(marks=="c")marks="中等";
							if(marks=="d")marks="合格";
							if(marks=="e")marks="不合格";
							target.parent().prev().prev().text(marks);
							}
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