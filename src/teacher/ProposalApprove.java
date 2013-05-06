package teacher;

import hibernate.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ProposalApprove extends HttpServlet {

	public ProposalApprove() {
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
		Integer priority = (Integer) request.getSession().getAttribute(
				"priority");
		Integer proposalid = Integer.parseInt(request.getParameter("proposalid"));
		String approve = request.getParameter("approve");

		if (priority != 2) {
			out.print("<div class=\"alert alert-error\" style=\"margin-top:5px;margin-left:30%;margin-right:30%;text-align:center;\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>警告! </strong> 无操作权限</div>");
			return;
		}

		try {
				ProposalDAO proposaldao = new ProposalDAO();
				Proposal proposal = proposaldao.findById(proposalid);
				proposal.setVerification(approve);
				proposaldao.attachDirty(proposal);
				proposaldao.getSession().beginTransaction().commit();
				out.print("<div class=\"alert alert-success\" style=\"margin-top:20px;margin-left:30%;margin-right:30%;text-align:center;\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong> 审核完成！ </strong><br></div>");
		} catch (Exception e) {
		}

	}

	public void init() throws ServletException {
	}

}
