package teacher;

import hibernate.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ProposalEdit extends HttpServlet {

	public ProposalEdit() {
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
		String propossaltitle = request.getParameter("propossaltitle");
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
			Proposal proposal = (Proposal) proposaldao
					.findByThesistitle(propossaltitle).iterator().next();
			String proposalrequirement = proposal.getRequirement();
			String proposalcontent = proposal.getContent();
			String proposalstanderd = proposal.getStanderd();
			String proposalprocess = proposal.getProcess();
			String proposalliterature = proposal.getLiterature();
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			Date startdate = proposal.getStartdate();
			Date enddate = proposal.getEnddate();
			out.print("<form><div><h3>毕业设计题目：</h3><input type=\"text\" placeholder=\"请输入毕业设计题目\" id=\"propossaltitle\" value=\""
					+ propossaltitle
					+ "\"></div><div class=\"clearfix\"><div style=\"float:left;\"><h5>开始日期：</h5><input id=\"startdate\" type=\"text\" value=\""
					+ sdf.format(startdate)
					+ "\"></div>	<div style=\"float:left;margin-left:30px;\"><h5>结束日期：</h5>	<input id=\"enddate\" type=\"text\" value=\""
					+ sdf.format(enddate)
					+ "\"></div></div><div><h3>设计要求：</h3><textarea id=\"proposalrequirement\"style=\"width:100%;height:100px;\">"
					+ proposalrequirement
					+ "</textarea></div><div><h3>设计内容：</h3><textarea id=\"proposalcontent\" style=\"width:100%;height:100px;\">"
					+ proposalcontent
					+ "</textarea></div><div><h3>技术标准和参数：</h3><textarea id=\"proposalstanderd\" style=\"width:100%;height:100px;\">"
					+ proposalstanderd
					+ "</textarea></div><div><h3>进度计划：</h3><textarea id=\"proposalprocess\" style=\"width:100%;height:100px;\">"
					+ proposalprocess
					+ "</textarea></div><div><h3>参考文献：</h3><textarea id=\"proposalliterature\"style=\"width:100%;height:100px;\">"
					+ proposalliterature
					+ "</textarea></div><div class=\"clearfix\"><br><div class=\"pull-left\"><button class=\"btn btn-primary\" type=\"button\" id=\"pushit\" proposalid=\""
					+ proposal.getProposalid()
					+ "\">提交</button></div><div id=\"outputs\"></div></div></form>");
		} catch (Exception e) {
			out.print(e);
		}
	}

	public void init() throws ServletException {
	}

}
