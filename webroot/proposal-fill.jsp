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
	ProposalDAO proposaldao = new ProposalDAO();
	proposaldao.getSession().clear();
	proposaldao.getSession().beginTransaction().commit();
	Proposal proposal = new Proposal();
	Iterator<?> iterator = proposaldao.findByStudentid(id)
	.iterator();
	if(iterator.hasNext()==false){
		response.sendRedirect("choose.jsp");
		return;
	}
	while (iterator.hasNext()) {
		proposal = (Proposal) iterator.next();
	}
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>开题报告——毕业设计在线管理系统</title>
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/proposal-fill.css" rel="stylesheet">
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
									<li class="active"><a href="proposal-fill.jsp">开题报告</a></li>
									<li><a href="proposal-result.jsp">开题成绩</a>
									<li><a href="thesis-upload.jsp">论文提交</a></li>
									<li><a href="thesis-result.jsp">毕设成绩</a>
									</li>
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
				<div class="span12 contentitle">开题报告</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1 boxshadow well">
					<%
						out.print("<h3>设计题目：</h3><input class=\"input-xlarge\"type=\"text\" disabled value=\""+ proposal.getThesistitle()+"\">");
					%>
						<div>
							<h3>资料调研分析：</h3>
							<textarea id="proposalanalysis" style="width:100%;height:100px;">
								<%
									if (proposal.getProposalanalysis() == null) {
											out.print("尚未填写");
									}
									 else {
									 out.print(proposal.getProposalanalysis());
									 }
																				//if (proposal.getProposalanalysis().equals("")) {
																				//	out.print("N''''''''''''空'''''''''''N");
																				//}
																				//out.print(proposal.getProposalanalysis());
								%>
							</textarea>
						</div>
						<div>
							<h3>设计方案及预期目标：</h3>
							<textarea id="proposalcontent" style="width:100%;height:100px;">
								<%
									out.print(proposal.getProposalcontent());
								%>
							</textarea>
						</div>


						<div>
							<h3>所需仪器：</h3>
							<textarea id="proposalfacility" style="width:100%;height:100px;">
								<%
									out.print(proposal.getProposalfacility());
								%>								
								</textarea>
						</div>
						<div class="clearfix">
							<br>
							<div class="pull-left">
						<button class="btn btn-primary" type="button" id="ajax" proposalid="<%out.print(proposal.getProposalid()); %>">提交</button>
							</div>
							<div id="outputs"></div>
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
	<script src="editor/tinymce.min.js"></script>
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
//					init_instance_callback : "hidetinymce"

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
			$('#ajax').click(
				function(e) {
					e.preventDefault();
					var target = $(this);
					var data = {
						"proposalid" : target.attr("proposalid"),						
						"proposalanalysis": tinyMCE.get('proposalanalysis').getContent(),
						"proposalfacility": tinyMCE.get('proposalfacility').getContent(),
						"proposalcontent": tinyMCE.get('proposalcontent').getContent()
						
					};
					$.post('proposal-update', data, function(data, textStatus,
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
