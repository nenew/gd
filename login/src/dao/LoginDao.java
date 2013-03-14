package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;



public class LoginDao {
	private Connection conn = null;
	public void initConnection() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		conn = 
				DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","toor");
		
	}
	public void closeConnection() throws Exception{
		conn.close();
	}
	public String getPassword(String id) throws Exception{
		String password = null;
		initConnection();
		String sql="SELECT password FROM student WHERE id = "+id;
		Statement stat = conn.createStatement();
		ResultSet rs = stat.executeQuery(sql);
		while(rs.next()){
			password=rs.getString("password");

		}
		closeConnection();
		
		return password;
}}
