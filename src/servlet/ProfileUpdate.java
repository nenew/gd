package servlet;

import hibernate.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ProfileUpdate extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ProfileUpdate() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		try{
		String userid = request.getParameter("userid");
		String phonenum = request.getParameter("phonenum");
		String email = request.getParameter("email");
		ProfileDAO profiledao = new ProfileDAO();
		Profile profile = profiledao.findById(Integer.valueOf(userid));
		profile.setPhonenum(phonenum);
		profile.setEmail(email);
		profiledao.attachClean(profile);
		profiledao.getSession().beginTransaction().commit();
		out.print("来自网址：" + request.getRequestURI() + "<br>成功");
//		request.getSession().setAttribute("profileupdatestatus", "1");
//		response.sendRedirect("profile.jsp");
//		response.sendRedirect("index.jsp");
		} catch (Exception e){
			out.print("Error:"+e);
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
