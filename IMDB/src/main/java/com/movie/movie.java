package com.movie;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;

import com.Dao.databasecon;
import com.mysql.jdbc.Connection;

//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/index")
public class movie extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	public void dopost(HttpServletRequest req,HttpServletResponse res) throws ClassNotFoundException, IOException{
			
			PrintWriter out = res.getWriter();
			
		try {
			
			String query="SELECT movie_name,movie_img,movie_rate FROM movie";
			
			
			
			Connection con = databasecon.getCon();
			
			
			Statement st=con.createStatement();
			
			 ResultSet rs = st.executeQuery(query); 
			 
			 
			 String moviename = null;
			 String movieimg = null;
			 String movierate = null;
			
			
			 
			 while(rs.next()) 
             {  
                moviename = rs.getString("movie_name");  
                movieimg=rs.getString("movie_img");
                 movierate= rs.getString("movie_r̥ate");  
                 out.println(moviename);
				 
//                HttpSession session=req.getSession();
//                session.setAttribute("moviename", moviename);
//                session.setAttribute("movieimg", movieimg);
//                session.setAttribute("movierate", movierate);
//                RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
//                dispatcher.forward(req, res);
//					
					
                  
                 
             }  
             
            
            con.close();
            st.close();
		
		
		}
		catch(Exception e) {
			System.out.println(e);
			
		}
	}
			
	}
		
	
	
