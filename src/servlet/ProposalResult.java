package servlet;

import hibernate.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProposalResult extends HttpServlet {

	public ProposalResult() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Integer id = (Integer) request.getSession().getAttribute("id");
		ProposalDAO proposaldao = new ProposalDAO();
		if (proposaldao.findByStudentid(id).isEmpty()) {
			response.sendRedirect("choose.jsp");
			return;
		}
		Proposal proposal = (Proposal) proposaldao.findByStudentid(id)
				.iterator().next();
		if (proposal.getIsapproved() == null) {
			response.sendRedirect("proposal-fill.jsp");
			return;
		}
		if (proposal.getVerification() == null) {
			out.print("<div class=\"alert alert-success alertfix\">	恭喜，开题已通过审核！<br><a class=\"btn btn-primary btn-large\" href=\"thesis-upload.jsp\">上传毕业论文</a></div>");
		}

	}

	public void init() throws ServletException {
	}

}
