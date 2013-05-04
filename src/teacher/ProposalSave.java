package teacher;

import hibernate.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ProposalSave extends HttpServlet {

	public ProposalSave() {
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
		String propossaltitle = request.getParameter("propossaltitle");
		String proposalrequirement = request
				.getParameter("proposalrequirement");
		String proposalcontent = request.getParameter("proposalcontent");
		String proposalstanderd = request.getParameter("proposalstanderd");
		String proposalprocess = request.getParameter("proposalprocess");
		String proposalliterature = request.getParameter("proposalliterature");
		if (propossaltitle.equals("") || proposalrequirement.equals("")
				|| proposalcontent.equals("") || proposalstanderd.equals("")
				|| proposalprocess.equals("") || proposalliterature.equals("")) {
			out.print("<div class=\"alert alert-error alertfix\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>警告! </strong> 所有字段都不能为空。</div>");
			return;
		}
		ProposalDAO proposaldao = new ProposalDAO();
		Proposal proposal = proposaldao.findById(proposalid);
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		Date startdate = new Date();
		Date enddate = new Date();
		try {
			startdate = sdf.parse(request.getParameter("startdate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			enddate = sdf.parse(request.getParameter("enddate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (priority != 2) {
			out.print("<div class=\"alert alert-error alertfix\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>警告! </strong> 无操作权限</div>");
			return;
		}

		try {

			proposal.setThesistitle(propossaltitle);
			proposal.setContent(proposalcontent);
			proposal.setRequirement(proposalrequirement);
			proposal.setStanderd(proposalstanderd);
			proposal.setLiterature(proposalliterature);
			proposal.setProcess(proposalprocess);
			proposal.setStartdate(startdate);
			proposal.setEnddate(enddate);
			proposal.setIschoosen(false);
			proposaldao.attachDirty(proposal);
			proposaldao.getSession().beginTransaction().commit();
			out.print("<div class=\"alert alert-success alertfix\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>恭喜! </strong> 课题修改成功。</div>");

		} catch (Exception e) {
			out.print(e);

		}

		/*
		 * if (newname.equals("") || newnum.equals("") || newpw.equals("")) {
		 * out.print(
		 * "<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>警告! </strong> 字段不能为空！</div>"
		 * ); return; } try { MainDAO maindao = new MainDAO(); Main main = new
		 * Main(); Iterator<?> iterator = maindao.findByNum(newnum).iterator();
		 * if (iterator.hasNext() == false) { main.setName(newname);
		 * main.setNum(newnum); main.setPassword(newpw);
		 * main.setIsprofile(false); main.setIssecurity(false);
		 * main.setPriority(3); maindao.attachDirty(main);
		 * maindao.getSession().beginTransaction().commit(); out.print(
		 * "<div class=\"alert alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong> 教师添加成功！ </strong><br></div>"
		 * ); } else { out.print(
		 * "<div class=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>注意! </strong> 编号已存在，不要重复添加！</div>"
		 * ); } } catch (Exception e) { }
		 */
	}

	public void init() throws ServletException {
	}

}
