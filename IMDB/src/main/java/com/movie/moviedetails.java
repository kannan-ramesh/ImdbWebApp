//package com.movie;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//import java.sql.Statement;
//
//
//import java.sql.*;
//
//import jakarta.servlet.RequestDispatcher;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//
//public class moviedetails extends HttpServlet {
//
//	private static final long serialVersionUID = 1L;
//	
//	public void doGet(HttpServletRequest req,HttpServletResponse res) {
//		
//		
////		String movie=  (String) req.getAttribute("id");
////		System.out.println(movie);
////		try {
////		String url="jdbc:mysql://localhost:3306/imdb";
////		String name="root";
////		String pass="15410198";
////		
////		try {
////		Class.forName("com.mysql.jdbc.Driver");
////		}catch(Exception e) {
////			System.out.print(e);
////		}
////		
////		    Connection  con =   DriverManager.getConnection(url, name, pass);
////			String query="SELECT DISTINCT m.movie_name,m.movie_year,m.movie_lang,m.movie_img,m.movie_time,m.movie_country,m.movie_rate,d.director_id,d.director_name,a.actor_id,a.actor_name,mc.actor_role,mus.music_name,pc.comp_name FROM movie AS m,director AS d,actor AS a,movie_cast AS mc,music AS mus,prod_comp AS pc where m.director_id=d.director_id AND m.music_id=mus.music_id AND a.actor_id=mc.actor_id AND mc.movie_id=m.movie_id AND m.movie_id="+movie;
////			Statement  st=con.createStatement();
////			ResultSet rs = st.executeQuery(query);
////			
////			if(rs.next()){
////			 String moviename=rs.getString("movie_name");
////			 String movieimg=rs.getString("movie_img");
////			 String movieyear=rs.getString("movie_year");
////			 String movielang=rs.getString("movie_lang");
////			 String movietime=rs.getString("movie_time");
////			 String moviecountry=rs.getString("movie_country");
////			 String movierate=rs.getString("movie_rate");
////			 int directorid=rs.getInt("director_id");
////			 String directorname=rs.getString("director_name");
////			 int actorid=rs.getInt("actor_id");
////			 String actorname=rs.getString("actor_name");
////			 String actorrole=rs.getString("actor_role");
////			 String musicname=rs.getString("music_name");
////			 String compname=rs.getString("comp_name");
////			 
////			 
////		     req.setAttribute("movie_name", moviename);
////		     req.setAttribute("movie_img", movieimg);
////		     req.setAttribute("movie_year", movieyear);
////		     req.setAttribute("movie_lang", movielang);
////		     req.setAttribute("movie_time", movietime);
////		     req.setAttribute("movie_country", moviecountry);
////		     req.setAttribute("movie_rate", movierate);
////		     req.setAttribute("director_id", directorid);
////		     req.setAttribute("director_name", directorname);
////		     req.setAttribute("actor_id", actorid);
////		     req.setAttribute("actor_name", actorname);
////		     req.setAttribute("actor_role", actorrole);
////		     req.setAttribute("music_name", musicname);
////		     req.setAttribute("comp_name", compname);
////		     
////		     //RequestDispatcher rd= req.getRequestDispatcher("movie_details.jsp");
////			 try {
////				rd.forward(req, res);
////			} catch (ServletException | IOException e) {
////				
////				e.printStackTrace();
////			}
////			
////		}
////		}catch(Exception e) {
////			System.out.print(e);
////		}
////		
////	}
////	
////
////}
