package admin;

import hibernate.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class EnableSet extends HttpServlet {

	public EnableSet() {
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
		Integer mainid = Integer.parseInt(request.getParameter("mainid"));
		if (priority != 3) {
			out.print("<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>警告! </strong> 无操作权限</div>");
			return;
		}
		try {
			ManagementDAO managementdao = new ManagementDAO();
			Management management = new Management();
			management = (Management)managementdao.findByProperty("main.id", mainid).iterator().next();
			management.setPermission(true);
			managementdao.attachDirty(management);
			managementdao.getSession().beginTransaction().commit();
		} catch (Exception e) {
			out.print(e);
		}

	}

	public void init() throws ServletException {
	}

}
