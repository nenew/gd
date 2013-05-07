package teacher;

import hibernate.*;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ThesisVerify extends HttpServlet {

	public ThesisVerify() {
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
		Integer priority = (Integer) request.getSession().getAttribute(
				"priority");
		Integer mainid = Integer.parseInt(request.getParameter("mainid"));
		Integer proposalid = Integer.parseInt(request.getParameter("proposalid"));
		String mark = request.getParameter("thesisverification");
		if (!id.equals(mainid)) {
			out.print("<div class=\"alert alert-error alertfix\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>警告! </strong> 非本人，禁止操作！</div>");
			return;
		}
		if (priority != 2) {
			out.print("<div class=\"alert alert-error alertfix\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>警告! </strong> 无操作权限</div>");
			return;
		}
		try {
			ThesisDAO thesisdao = new ThesisDAO();
			Thesis thesis = new Thesis();
			ProposalDAO proposaldao = new ProposalDAO();
			Proposal proposal= proposaldao.findById(proposalid);
			if(thesisdao.findByProperty("main.id", proposal.getStudentid()).iterator().hasNext()){
				thesis =(Thesis)thesisdao.findByProperty("main.id", proposal.getStudentid()).iterator().next();
			} else{
				thesis.setMain(proposal.getMain());
			}
			thesis.setVeryfication(mark);
			thesisdao.attachDirty(thesis);
			thesisdao.getSession().beginTransaction().commit();
			out.print("Done!");

		} catch (Exception e) {
			out.print(e);
		}
	}

	public void init() throws ServletException {
	}

}
