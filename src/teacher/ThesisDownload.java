package teacher;

import hibernate.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ThesisDownload extends HttpServlet {

	public ThesisDownload() {
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
//		PrintWriter out = response.getWriter();
		Integer id = (Integer) request.getSession().getAttribute("id");
		Integer priority = (Integer) request.getSession().getAttribute(
				"priority");
		Integer mainid = Integer.parseInt(request.getParameter("mainid"));
		Integer proposalid = Integer.parseInt(request
				.getParameter("proposalid"));
		if (!id.equals(mainid)) {
//			out.print("<div class=\"alert alert-error alertfix\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>警告! </strong> 非本人，禁止操作！</div>");
			return;
		}
		if (priority != 2) {
//			out.print("<div class=\"alert alert-error alertfix\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>警告! </strong> 无操作权限</div>");
			return;
		}

		ProposalDAO proposaldao = new ProposalDAO();
		MainDAO maindao = new MainDAO();
		String filename = maindao.findById(
				proposaldao.findById(proposalid).getStudentid()).getNum()
				+ ".doc";
		String savename = maindao.findById(
				proposaldao.findById(proposalid).getStudentid()).getName()
				+ "毕业论文.doc";
		String path = "d:\\temp\\";
		File file = new File(path, filename);
		FileInputStream fin = null;
		OutputStream fout = response.getOutputStream();
		byte buffer[] = new byte[1024];
		try {
			response.setContentType("application/msword;");
			response.setHeader("Content-disposition", "attachment; filename="
					+ new String(savename.getBytes("UTF-8"), "ISO-8859-1"));
			fin = new FileInputStream(file);
			int n = 0;
			while ((n = fin.read(buffer)) != -1) {
				fout.write(buffer, 0, n);
			}
			fin.close();
			fout.close();
		} catch (Exception e) {
//			out.print(e);
		}
	}

	public void init() throws ServletException {
	}

}
