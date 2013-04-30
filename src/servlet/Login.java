package servlet;

import hibernate.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class Login extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Login() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String num = request.getParameter("num");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		PrintWriter out = response.getWriter();
		// 密码验证
		if (!num.equals("") && !password.equals("")) {

			MainDAO maindao = new MainDAO();
			Main main = new Main();
			@SuppressWarnings("unchecked")
			Iterator<Main> iterator = maindao.findByNum(num).iterator();
			if (iterator.hasNext() == false) {
				response.sendRedirect("main.jsp");
				return;
			}

			while (iterator.hasNext()) {
				main = iterator.next();
				if (password.equals(main.getPassword())) {
					session.setAttribute("id", main.getId());
					session.setAttribute("num", main.getNum());
					session.setAttribute("priority", main.getPriority());
					session.setAttribute("name", main.getName());
					session.setAttribute("islogin", "yes");
					if (remember == null)
						out.print("remember is null");
					if(main.getPriority()==1){
						response.sendRedirect("main.jsp");return;}
					if(main.getPriority()==2){
						response.sendRedirect("teacher/main.jsp");return;}
					if(main.getPriority()==3){
						response.sendRedirect("admin/main.jsp");return;}
				} else {
					response.sendRedirect("index.jsp");
				}
			}

		} else {
			response.sendRedirect("index.jsp");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
