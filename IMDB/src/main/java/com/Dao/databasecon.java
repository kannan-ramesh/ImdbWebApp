package com.Dao;
import java.sql.*;

import com.mysql.jdbc.Connection;

public class databasecon {
	public static Connection getCon() throws ClassNotFoundException, SQLException  {
	
		String url="jdbc:mysql://localhost:3306/imdb";
		String name="root";
		String pass="15410198";
		String driver="com.mysql.jdbc.Driver";
		
		
		Class.forName(driver);		
		
		Connection con =    (Connection) DriverManager.getConnection(url, name, pass);
		
		return con;
	}
	

}
