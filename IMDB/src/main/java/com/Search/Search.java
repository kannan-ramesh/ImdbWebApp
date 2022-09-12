package com.Search;

import java.io.IOException;
import java.sql.*;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Search extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req,HttpServletResponse res) {
		String input=req.getParameter("search");
		System.out.println(input);
		
		try {
		String query=null;
		
		

		String url="jdbc:mysql://localhost:3306/imdb";
		String name="root";
		String pass="15410198";
		
		
		query="select*from movie where movie_name='"+input+"' ";
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.print(e);
		}
		
		
			Connection con = DriverManager.getConnection(url,name,pass);
		
			Statement st = con.createStatement();
			
			ResultSet rs=st.executeQuery(query);
			String moviename=null;
			String movieimg=null;
			String movieyear=null;
			String movieid=null;
			String moviebio=null;
			
			if(rs.next()) {
				 moviename=rs.getString("movie_name");
				 movieimg=rs.getString("movie_img");
				 movieyear=rs.getString("movie_year");
				 movieid=rs.getString("movie_id");
				 moviebio=rs.getString("movie_bio");
				 
				 
				 req.setAttribute("movie_name", moviename);
				 req.setAttribute("movie_img", movieimg);
				 req.setAttribute("movie_year", movieyear);
				 req.setAttribute("movie_id",movieid);
				 req.setAttribute("movie_bio", moviebio);
				 
				 RequestDispatcher rd= req.getRequestDispatcher("search.jsp");
				 try {
					rd.forward(req, res);
				 } catch (ServletException | IOException e) {
					
					e.printStackTrace();
				 }
				
			}else {
				res.sendRedirect("index.jsp");
				
			}
			con.close();
			st.close();
		
		}catch(Exception e) {
			System.out.println(e);
		}
		
		
		
	}
	
	
}
