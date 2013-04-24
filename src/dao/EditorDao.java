package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class EditorDao {
	private Connection conn = null;

	public void initConnection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test",
				"root", "toor");

	}

	public void closeConnection() throws Exception {
		conn.close();
	}

	public int text(String id, String editor) throws Exception {
		initConnection();
		String sql = "UPDATE student SET editor = \"" + editor + "\" WHERE id = "
				+ id;
		Statement stat = conn.createStatement();
		int i = stat.executeUpdate(sql);

		closeConnection();

		return i;
	}
}
