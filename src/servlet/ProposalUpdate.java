package servlet;

import hibernate.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ProposalUpdate extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ProposalUpdate() {
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

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		try{
		String userid = request.getParameter("userid");
		String proposalanalysis = request.getParameter("proposalanalysis");
		String proposalcontent = request.getParameter("proposalcontent");
		String proposalfacility = request.getParameter("proposalfacility");
		ProposalDAO proposaldao = new ProposalDAO();
		Proposal proposal = proposaldao.findById(Integer.valueOf(userid));
		out.print(proposal.getThesistitle());
		proposal.setProposalanalysis(proposalanalysis);
		proposal.setProposalcontent(proposalcontent);
		proposal.setProposalfacility(proposalfacility);
		proposaldao.attachClean(proposal);
		proposaldao.getSession().beginTransaction().commit();
		out.print("成功success");
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
