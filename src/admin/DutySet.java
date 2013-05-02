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
public class DutySet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DutySet() {
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
		String page = request.getParameter("inputpage");
		if (priority != 3) {
			out.print("无操作权限!");
			return;
		}
		ProfileDAO profiledao = new ProfileDAO();
		Profile profile = new Profile();
		Management management = new Management();
		profiledao.getSession().clear();
		profiledao.getSession().beginTransaction().commit();
		if (page.equals("")) {
			int index = 1;
			try {
				List<?> list = profiledao.dutypage("department", department);
				Iterator<?> iterator = list.iterator();
				while (iterator.hasNext()) {
					profile = (Profile) iterator.next();
					management = (Management) profile.getMain()
							.getManagements().iterator().next();
					out.print("<tr><td><span class=\"badge\">" + index++
							+ "</span>");
					out.print("<td>" + profile.getMain().getNum() + "</td>");
					out.print("<td>" + profile.getMain().getName() + "</td>");
					if (management.getLimitnum() == null) {
						out.print("<td>尚未设置</td>");
					} else {
						out.print("<td>" + management.getLimitnum() + "</td>");
					}
					out.print("<td><select class=\"selectfix\" mainid=\""+profile.getMain().getId()+"\">");
					for (int ints = 1; ints < 9; ints++) {
						out.print("<option value =\"" + ints + "\">" + ints
								+ "</option>");
					}
					out.print("<select></td>");
					out.print("<td><button type=\"button\" class=\"btn btnfix\">设定</button></td>");

				}
				out.print("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");

			} catch (Exception e) {
				out.print(e);
			}
		} else {
			int index = (Integer.parseInt(page) + 1);
			try {
				List<?> list = profiledao.dutypage("department", department,
						page);
				Iterator<?> iterator = list.iterator();
				while (iterator.hasNext()) {
					profile = (Profile) iterator.next();
					management = (Management) profile.getMain()
							.getManagements().iterator().next();
					out.print("<tr><td><span class=\"badge\">" + index++
							+ "</span>");
					out.print("<td>" + profile.getMain().getNum() + "</td>");
					out.print("<td>" + profile.getMain().getName() + "</td>");
					if (management.getLimitnum() == null) {
						out.print("<td>尚未设置</td>");
					} else {
						out.print("<td>" + management.getLimitnum() + "</td>");
					}
					out.print("<td><select class=\"selectfix\" mainid=\""+profile.getMain().getId()+"\">");
					for (int ints = 1; ints < 9; ints++) {
						out.print("<option value =\"" + ints + "\">" + ints
								+ "</option>");
					}
					out.print("<select></td>");
					out.print("<td><button type=\"button\" class=\"btn btnfix\">设定</button></td>");
				}

				out.print("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");

			} catch (Exception e) {
				out.print(e);
			}
		}

	}

	public void init() throws ServletException {
		// Put your code here
	}

}
