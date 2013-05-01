package admin;

import hibernate.*;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class CountTeacher extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CountTeacher() {
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
		if (priority != 3) {
			out.print("无操作权限!");
			return;
		}
		ProfileDAO profiledao = new ProfileDAO();
		try {
			Integer count = profiledao.teachercount("department", department);
			int pagenum = 0;
			if (count % 10 != 0) {
				pagenum = count / 10 + 1;
			} else {
				pagenum = count / 10;
			}
			int numcopy = pagenum;
			int pages=0;
			if (pagenum >= 1) {
				out.print("<div class=\"pagination pagination-large\"><ul>");
				if (pagenum == 1) {
					out.print("<li class=\"disabled prevpage\"><a  class=\"pages\" href=\"#\">«</a></li>");
				} else {
					out.print("<li class=\"disabled prevpage\"><a  class=\"prev\" href=\"#\" index=\"0\" department=\""
							+ department
							+ "\" total=\""
							+ (numcopy * 10 - 10)
							+ "\">«</a></li>");
				}				while (pagenum-- > 0) {
					out.print("<li><a  class=\"pages\" href=\"#\" index=\""+(pages*10)+"\" department=\""+department+"\" total=\""+(numcopy*10-10)+"\">" + (pages++ + 1) + "</a>");
				}
				if (numcopy > 1) {
					out.print("<li class=\"nextpage\"><a  class=\"next\" href=\"#\" index=\"10\" department=\""+department+"\" total=\""+(numcopy*10-10)+"\">»</a></li>");
				} else {
					out.print("<li class=\"disabled nextpage\"><a  class=\"pages\" href=\"#\">»</a></li>");
				}
				out.print("</ul></div>");
			}
		} catch (Exception e) {
			out.print(e);
		}

	}

	public void init() throws ServletException {
		// Put your code here
	}

}
