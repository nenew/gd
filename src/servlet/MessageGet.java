package servlet;

import hibernate.*;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class MessageGet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public MessageGet() {
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

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Integer msgnum = Integer.parseInt(request.getParameter("msgnum"));
		try {
			MessageDAO messagedao = new MessageDAO();
			Message message = messagedao.findById(msgnum);
			out.print(message.getContent());
		} catch (Exception e) {
			out.print("error" + e);
		}
	}
	public void init() throws ServletException {
		// Put your code here
	}

}
