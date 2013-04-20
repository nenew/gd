<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" import="java.net.URLDecoder"
	import="hibernate.*" import="org.hibernate.Transaction"
	import="java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("userid");
		String proposalanalysis = request.getParameter("proposalanalysis");
		String proposalcontent = request.getParameter("proposalcontent");
		String proposalfacility = request.getParameter("proposalfacility");
		ProposalDAO proposaldao = new ProposalDAO();
		Proposal proposal = proposaldao.findById(Integer.valueOf(userid));
		out.print(proposal.getThesistitle());
		proposal.setProposalanalysis(proposalanalysis);
		proposal.setProposalcontent(proposalcontent);
		proposal.setProposalfacility(proposalfacility);
		proposaldao.attachClean(proposal);
		proposaldao.getSession().beginTransaction().commit();
		out.print("成功");

		//		response.sendRedirect("index.jsp");
	%>
</body>
</html>
