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
public class Rename extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Rename() {
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
		String mainid = request.getParameter("mainid");
		String newname = request.getParameter("newname");
		if (priority != 3) {
			out.print("无操作权限!");
			return;
		}
		MainDAO maindao = new MainDAO();
		Main main = new Main();
		try {
			Integer id = Integer.parseInt(mainid);
			main = maindao.findById(id);
			main.setName(newname);
			maindao.attachDirty(main);
			maindao.getSession().beginTransaction().commit();
			out.print("修改成功");
			
		} catch (Exception e) {
			out.print(e);
		}

	}

	public void init() throws ServletException {
		// Put your code here
	}

}
