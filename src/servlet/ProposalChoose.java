package servlet;

import hibernate.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ProposalChoose extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ProposalChoose() {
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
		Integer mainid = Integer.parseInt(request.getParameter("mainid"));
		Integer proposalid = Integer.parseInt(request.getParameter("proposalid"));
		if(proposalid.equals("")||mainid.equals("")){
			out.print("请刷新页面！");
			return;
		}

		try{
		ProposalDAO proposaldao = new ProposalDAO();
		Proposal proposal = proposaldao.findById(proposalid);
		if(proposal.getIschoosen()==true){
			out.print("该课题已经被其它同学选择，请重新选择课题！");
			return;
		}
		if(proposaldao.findByStudentid(mainid).isEmpty()==false){
			out.print("请勿重复选题");
			return;
		}
		proposal.setStudentid(mainid);
		proposal.setIschoosen(true);
		proposaldao.attachDirty(proposal);
		proposaldao.getSession().beginTransaction().commit();
		out.print("选题成功");
		} catch (Exception e) {
			out.print("Error"+e);
		}

		//		response.sendRedirect("index.jsp");
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
