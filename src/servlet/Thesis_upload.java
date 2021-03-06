package servlet;

import hibernate.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@SuppressWarnings("serial")
public class Thesis_upload extends HttpServlet {
	private String uploadPath = "D:\\temp"; // 上传文件的目录
	private String tempPath = "D:\\temp\\buffer\\"; // 临时文件目录
	File tempPathFile;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String num = (String) request.getSession().getAttribute("num");
		Integer id = (Integer) request.getSession().getAttribute("id");
		MainDAO maindao = new MainDAO();
		Main main = maindao.findById(id);
		ThesisDAO thesisdao = new ThesisDAO();
		Thesis thesis = new Thesis();
		thesisdao.getSession().clear();
		Iterator<?> iterator = thesisdao.findByProperty("main.id", id)
				.iterator();
		if (!iterator.hasNext()) {
			thesis.setMain(main);
			System.out.print("iterator has no next,new main");
		}
		while (iterator.hasNext()) {
			thesis = (Thesis)iterator.next();
		}
		thesis.setIsuploaded(true);
		thesisdao.attachDirty(thesis);
		thesisdao.getSession().beginTransaction().commit();
		PrintWriter out = response.getWriter();
		ProgressListener progressListener = new ProgressListener() {
			public void update(long pBytesRead, long pContentLength, int pItems) {
				System.out.println("We are currently reading item " + pItems);
				if (pContentLength == -1) {
					System.out.println("So far, " + pBytesRead
							+ " bytes have been read.");
				} else {
					System.out.println("So far, " + pBytesRead + " of "
							+ pContentLength + " bytes have been read.");
				}
			}
		};
		try {
			// Create a factory for disk-based file items
			DiskFileItemFactory factory = new DiskFileItemFactory();

			// Set factory constraints
			factory.setSizeThreshold(4096); // 设置缓冲区大小，这里是4kb
			factory.setRepository(tempPathFile);// 设置缓冲区目录

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);

			// Set overall request size constraint
			upload.setSizeMax(419430400); // 设置最大文件尺寸，这里是4MB

			upload.setProgressListener(progressListener);// 添加监视

			List<FileItem> items = upload.parseRequest(request);// 得到所有的文件
			Iterator<FileItem> i = items.iterator();
			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();
				String fileName = num + ".doc";
				out.print("fieldName:" + fi.getFieldName() + "\n");
				out.print("fileName:" + fi.getName() + "\n");
				out.print("file Content Type:" + fi.getContentType() + "\n");
				if (fileName != null) {
					File fullFile = new File(fileName);
					File savedFile = new File(uploadPath, fullFile.getName());
					fi.write(savedFile);
				}
			}

			out.print("upload succeed");
		} catch (Exception e) {
			// 可以跳转出错页面
			e.printStackTrace();
		}
	}

	public void init() throws ServletException {
		File uploadFile = new File(uploadPath);
		if (!uploadFile.exists()) {
			uploadFile.mkdirs();
		}
		File tempPathFile = new File(tempPath);
		if (!tempPathFile.exists()) {
			tempPathFile.mkdirs();
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}
