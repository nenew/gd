package teacher;

import hibernate.*;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ProposalVerify extends HttpServlet {

	public ProposalVerify() {
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
		if (!id.equals(mainid)) {
			out.print("<div class=\"alert alert-error alertfix\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>警告! </strong> 非本人，禁止操作！</div>");
			return;
		}
		if (priority != 2) {
			out.print("<div class=\"alert alert-error alertfix\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>警告! </strong> 无操作权限</div>");
			return;
		}
		try {
			ProposalDAO proposaldao = new ProposalDAO();
			MainDAO maindao = new MainDAO();
			ProfileDAO profiledao = new ProfileDAO();
			profiledao.getSession().clear();
			profiledao.getSession().beginTransaction().commit();
			Profile profile = (Profile)profiledao.findByProperty("main.id", proposaldao.findById(proposalid).getStudentid()).iterator().next();
			Proposal proposal = (Proposal) proposaldao.findById(proposalid);
			String proposalanalysis = proposal.getProposalanalysis();
			String proposalcontent = proposal.getProposalcontent();
			String proposalfacility = proposal.getProposalfacility();
			String proposaltitle = proposal.getThesistitle();

			out.print("<div><h3>毕业设计题目：</h3><input type=\"text\" disabled id=\"proposaltitle\" value=\""
					+ proposaltitle
					+ "\"></div><div class=\"clearfix\"><div style=\"float:left;\"><h5>学生姓名：</h5><input disabled type=\"text\" value=\""+maindao.findById(proposal.getStudentid()).getName()+"\"></input></div><div style=\"float:left;margin-left:30px;\"><h5>学生专业：</h5><input disabled type=\"text\" value=\""+profile.getDepartment()+"\"></input></div><div style=\"float:left;margin-left:30px;\"><h5>学生电话：</h5><input disabled type=\"text\" value=\""+profile.getPhonenum()+"\"></input></div></div><div><h3>资料调研分析：</h3><div class=\"well wellfix\">"
					+ proposalanalysis
					+ "</div></div><div><h3>设计方案及预期目标：</h3><div class=\"well wellfix\">"
					+ proposalcontent
					+ "</div></div><div><h3>所需仪器：</h3><div class=\"well wellfix\">"
					+ proposalfacility
					+ "</div></div><div class=\"clearfix\"><br><div style=\"text-align:center;\"><button class=\"btn btn-danger btn-large\" type=\"button\" approve=\"no\" proposalid=\""
					+ proposal.getProposalid()
					+ "\">未达标</button><button class=\"btn btn-success btn-large\" style=\"margin-left:50px;\" type=\"button\" approve=\"yes\" proposalid=\""
					+ proposal.getProposalid()
					+ "\">审核通过</button></div><div id=\"outputs\"></div></div>");
		} catch (Exception e) {
			out.print(e);
		}
	}

	public void init() throws ServletException {
	}

}
