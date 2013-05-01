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
public class ChangeTitle extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ChangeTitle() {
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
		String newtitle = request.getParameter("newtitle");
		if (priority != 3) {
			out.print("无操作权限!");
			return;
		}
		ProfileDAO profiledao = new ProfileDAO();
		Profile profile = new Profile();
		try {
			Integer id = Integer.parseInt(mainid);
			Iterator <?>iterator = profiledao.findByProperty("main.id", id).iterator();
			while (iterator.hasNext()){
				profile =(Profile)iterator.next();
			};
			profile.setTitle(newtitle);
			profiledao.attachDirty(profile);
			profiledao.getSession().beginTransaction().commit();
			out.print("修改成功");
			
		} catch (Exception e) {
			out.print(e);
		}

	}

	public void init() throws ServletException {
		// Put your code here
	}

}
