package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import hibernate.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Msgsender extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Msgsender() {
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
		String receiver = request.getParameter("receiver");
		String content = request.getParameter("content");
		Integer fromid = (Integer) request.getSession().getAttribute("id");
		Date date = new Date();
		try {
			Message message = new Message();
			MessageDAO messagedao = new MessageDAO();
			MainDAO maindao = new MainDAO();
			Main main = maindao.findById(fromid);
			message.setIsread(false);
			message.setMain(main);
			message.setContent(content);
			message.setToid(Integer.parseInt(receiver));
			message.setSendtime(date);
			messagedao.attachDirty(message);
			messagedao.getSession().beginTransaction().commit();
			out.print("OK!");
		} catch (Exception e) {
			out.print("error" + e);
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
