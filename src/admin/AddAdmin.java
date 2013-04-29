package admin;

import hibernate.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class AddAdmin extends HttpServlet {

	public AddAdmin() {
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
		String newname = request.getParameter("inputname");
		String newnum = request.getParameter("inputnum");
		String newpw = request.getParameter("inputpassword");
		if (priority != 3) {
			out.print("<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>警告! </strong> 无操作权限</div>");
			return;
		}
		if (newname.equals("") || newnum.equals("") || newpw.equals("")) {
			out.print("<div class=\"alert alert-error\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>警告! </strong> 字段不能为空！</div>");
			return;
		}
		try {
			MainDAO maindao = new MainDAO();
			Main main = new Main();
			Iterator<?> iterator = maindao.findByNum(newnum).iterator();
			if (iterator.hasNext() == false) {
				main.setName(newname);
				main.setNum(newnum);
				main.setPassword(newpw);
				main.setIsprofile(false);
				main.setIssecurity(false);
				main.setPriority(3);
				maindao.attachDirty(main);
				maindao.getSession().beginTransaction().commit();
				out.print("<div class=\"alert alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong> 教师添加成功！ </strong><br></div>");
			} else {
				out.print("<div class=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>注意! </strong> 编号已存在，不要重复添加！</div>");
			}
		} catch (Exception e) {
		}

	}

	public void init() throws ServletException {
	}

}
