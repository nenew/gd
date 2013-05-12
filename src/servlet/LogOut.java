package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class LogOut extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LogOut() {
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
		try{
		session.removeAttribute("id");
		session.removeAttribute("num");
		session.removeAttribute("priority");
		session.removeAttribute("name");
		session.removeAttribute("islogin");
		}catch(Exception e){
			out.print(e);
		}
			response.sendRedirect("index.jsp");
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
