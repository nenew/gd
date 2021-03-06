package admin;

import hibernate.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ThesisResult extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ThesisResult() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
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
		String department = request.getParameter("inputdepartment");
		String grade = request.getParameter("inputgrade");
		String page = request.getParameter("inputpage");
		if (priority != 3) {
			out.print("无操作权限!");
			return;
		}
		ProfileDAO profiledao = new ProfileDAO();
		Profile profile = new Profile();
		profiledao.getSession().clear();
		profiledao.getSession().beginTransaction().commit();
		ProposalDAO proposaldao = new ProposalDAO();
		if (page.equals("")) {
			int index = 1;
			try {
				List<?> list = profiledao.page("department", department,
						"grade", grade);
				Iterator<?> iterator = list.iterator();
				while (iterator.hasNext()) {
					profile = (Profile) iterator.next();
					out.print("<tr><td><span class=\"badge\">" + index++
							+ "</span>");
					out.print("<td>" + profile.getMain().getNum() + "</td>");
					out.print("<td>" + profile.getMain().getName() + "</td>");
					if (proposaldao.findByStudentid(profile.getMain().getId())
							.isEmpty()) {
						out.print("<td>未选题</td>");
					} else {
						Proposal proposal = (Proposal) proposaldao
								.findByStudentid(profile.getMain().getId())
								.iterator().next();
						out.print("<td>" + proposal.getThesistitle() + "</td>");
					}
					ThesisDAO thesisdao = new ThesisDAO();
					if (thesisdao.findByProperty("main.id",
							profile.getMain().getId()).isEmpty()) {
						out.print("<td>未提交论文</td>");

					} else {
						Thesis thesis = (Thesis) thesisdao
								.findByProperty("main.id",
										profile.getMain().getId()).iterator()
								.next();
						if (thesis.getVeryfication() == null) {
							out.print("<td>未评定</td>");
						} else {
							if (thesis.getVeryfication().equalsIgnoreCase("a")) {
								out.print("<td>优秀</td>");
							}
							if (thesis.getVeryfication().equalsIgnoreCase("b")) {
								out.print("<td>良好</td>");
							}
							if (thesis.getVeryfication().equalsIgnoreCase("c")) {
								out.print("<td>中等</td>");
							}
							if (thesis.getVeryfication().equalsIgnoreCase("d")) {
								out.print("<td>合格</td>");
							}
							if (thesis.getVeryfication().equalsIgnoreCase("e")) {
								out.print("<td>不合格</td>");
							}
						}
					}
				}
				out.print("<tr><td></td><td></td><td></td><td></td><td></td></tr>");

			} catch (Exception e) {
				out.print(e);
			}
		} else {
			int index = (Integer.parseInt(page) + 1);
			try {
				List<?> list = profiledao.page("department", department,
						"grade", grade, page);
				Iterator<?> iterator = list.iterator();
				while (iterator.hasNext()) {
					profile = (Profile) iterator.next();
					out.print("<tr><td><span class=\"badge\">" + index++
							+ "</span>");
					out.print("<td>" + profile.getMain().getNum() + "</td>");
					out.print("<td>" + profile.getMain().getName() + "</td>");
					if (proposaldao.findByStudentid(profile.getMain().getId())
							.isEmpty()) {
						out.print("<td>未选题</td>");
					} else {
						Proposal proposal = (Proposal) proposaldao
								.findByStudentid(profile.getMain().getId())
								.iterator().next();
						out.print("<td>" + proposal.getThesistitle() + "</td>");
					}
					ThesisDAO thesisdao = new ThesisDAO();
					if (thesisdao.findByProperty("main.id",
							profile.getMain().getId()).isEmpty()) {
						out.print("<td>未提交论文</td>");

					} else {
						Thesis thesis = (Thesis) thesisdao
								.findByProperty("main.id",
										profile.getMain().getId()).iterator()
								.next();
						if (thesis.getVeryfication() == null) {
							out.print("<td>未评定</td>");
						} else {
							if (thesis.getVeryfication().equalsIgnoreCase("a")) {
								out.print("<td>优秀</td>");
							}
							if (thesis.getVeryfication().equalsIgnoreCase("b")) {
								out.print("<td>良好</td>");
							}
							if (thesis.getVeryfication().equalsIgnoreCase("c")) {
								out.print("<td>中等</td>");
							}
							if (thesis.getVeryfication().equalsIgnoreCase("d")) {
								out.print("<td>合格</td>");
							}
							if (thesis.getVeryfication().equalsIgnoreCase("e")) {
								out.print("<td>不合格</td>");
							}
						}
					}
				}
				out.print("<tr><td></td><td></td><td></td><td></td><td></td></tr>");

			} catch (Exception e) {
				out.print(e);
			}
		}

	}

	public void init() throws ServletException {
		// Put your code here
	}

}
