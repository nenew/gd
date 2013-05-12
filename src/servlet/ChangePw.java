package servlet;

import hibernate.Main;
import hibernate.MainDAO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class ChangePw extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ChangePw() {
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
		PrintWriter  out = response.getWriter();
		HttpSession session = request.getSession();
//		try{
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		Integer id = (Integer)session.getAttribute("id");
		MainDAO maindao = new MainDAO();
		Main main = maindao.findById(id);
		if(main.getPassword().equals(oldpassword)){
			main.setPassword(newpassword);
			maindao.attachDirty(main);
			maindao.getSession().beginTransaction().commit();
			out.print("done");
		}else{
			out.print("error");
		}
//		}catch(Exception e){
//			out.print(e);
//		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
