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
public class DelAdmin extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DelAdmin() {
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
		String page = request.getParameter("inputpage");
		if (priority != 3) {
			out.print("无操作权限!");
			return;
		}
		MainDAO maindao = new MainDAO();
		Main main = new Main();
		maindao.getSession().clear();
		maindao.getSession().beginTransaction().commit();
		if (page.equals("")) {
			int index = 1;
			try {
				List<?> list = maindao.page();
				Iterator<?> iterator = list.iterator();
				while (iterator.hasNext()) {
					main = (Main) iterator.next();
					out.print("<tr><td><span class=\"badge\">" + index++
							+ "</span>");
					out.print("<td>" + main.getNum() + "</td>");
					out.print("<td>" + main.getName() + "</td>");
					out.print("<td><button href=\"#renameModal\" data-toggle=\"modal\" type=\"button\" class=\"renamefunction\" mainid=\""
							+ main.getId()
							+ "\" name=\""
							+ main.getName()
							+ "\"></button></td>");
					out.print("<td><button href=\"#passwordModal\" data-toggle=\"modal\" type=\"button\" class=\"passwordfunction\" mainid=\""
							+ main.getId() + "\"></button></td>");
					out.print("<td><button href=\"#delModal\" data-toggle=\"modal\" type=\"button\" class=\"delfunction\" mainid=\""
							+ main.getId() + "\"></button></td>");
				}
				out.print("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");

			} catch (Exception e) {
				out.print(e);
			}
		} else {
			int index = (Integer.parseInt(page) + 1);
			try {
				List<?> list = maindao.page(page);
				Iterator<?> iterator = list.iterator();
				while (iterator.hasNext()) {
					main = (Main) iterator.next();
					out.print("<tr><td><span class=\"badge\">" + index++
							+ "</span>");
					out.print("<td>" + main.getNum() + "</td>");
					out.print("<td>" + main.getName() + "</td>");
					out.print("<td><button href=\"#renameModal\" data-toggle=\"modal\" type=\"button\" class=\"renamefunction\" mainid=\""
							+ main.getId()
							+ "\" name=\""
							+ main.getName() + "\"></button></td>");
					out.print("<td><button href=\"#passwordModal\" data-toggle=\"modal\" type=\"button\" class=\"passwordfunction\" mainid=\""
							+ main.getId() + "\"></button></td>");
					out.print("<td><button href=\"#delModal\" data-toggle=\"modal\" type=\"button\" class=\"delfunction\" mainid=\""
							+ main.getId() + "\"></button></td>");
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
