<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="com.Dao.databasecon" %>
<%@ page import ="java.util.*" session="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style type="text/css">

	.movie_container {
    	background-color: lightgrey;
    	/* width: 150px; */
    	/* height: 250px; */
    	padding: 10px;
    	margin: 20px;
    	object-fit: cover;
}
</style>

<title >IMDb</title>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

</head>
<body>
	
	<%@ include file="header.jsp" %>
	
		<div class="featured-today">
			<h2>Featured today</h2>
		</div>
		<hr>
	
	<div class="what-to-watch">
		<h2>What to watch</h2>
		<h3>Top picks</h3>
			<p> Movies just for you</p>
			
			<!-- Display Movies -->
			
		<div class="section1" style="display:flex">
			
			<%
 				
 				String url="jdbc:mysql://localhost:3306/imdb";
				String name="root";
				String pass="15410198";
				
	
				Class.forName("com.mysql.jdbc.Driver");
				//Connection  con =   databasecon.getCon();
				Connection  con =   DriverManager.getConnection(url, name, pass);
				Statement st=con.createStatement();
	 			String query="SELECT movie_name,movie_img,movie_id,movie_rate FROM movie";
				ResultSet rs = st.executeQuery(query); 
				
				
				
				String movie;
	 			while(rs.next()){
	 			
 			%>
		
		
			
			<div class="movie_container">
				<!-- box1 -->
				
				<div class="box">
					<img src="<%=rs.getString("movie_img") %>" alt="<%=rs.getString("movie_name")%>" width="200px" height="200px" />
				</div>
				
				
				<a href="movie_details.jsp?id=<%=rs.getString("movie_id")%>"  >
     				<%=rs.getString("movie_name")%>
				</a>
				
				
				<p id="mov_rat"><%=rs.getString("movie_rate") %></p>
				
			
			</div>
			
			
			<%} %>
			
		</div>
		<hr>
		
		<!-- TvShow -->
		<h3>Fan Favorites</h3>
		<p>Top TVShow just for you</p>
		
		<div class="section2" style="display:flex">
			
			<%
				Connection  conn =   DriverManager.getConnection(url, name, pass);
				Statement stt=con.createStatement();
 			
	 			String quer="SELECT tvshow_id,tvshow_name,tvshow_img,tvshow_rate FROM tvshow";
	 
				ResultSet rt = stt.executeQuery(quer); 
				String tvshow;
				
	 			while(rt.next()) {
	 			
 			%>
			
			
			<div class="movie_container" >
				<!-- box1 -->
				
				<div class="box">
					<img src="<%=rt.getString("tvshow_img") %>" >
				</div>
				<a href="tvshow_details.jsp?id=<%=rt.getString("tvshow_id")%>"><%=rt.getString("tvshow_name") %></a>
				
				<p id="tvshow_rat"><%=rt.getString("tvshow_rate") %></p>
			</div>
			<%} %>
			
		</div>
		
		<hr>
		
		<!-- Display Theaters -->
		<h3>In Theaters</h3>
			<p>Show times near you</p>
		
		<div class="section2" style="display:flex">
			
			<%	
			
				Statement state=con.createStatement();
		
				String que="select t.theater_id,t.movie_id,m.movie_name,m.movie_img,m.movie_rate from theaters AS t,movie AS m where t.movie_id=m.movie_id";
				ResultSet rss = state.executeQuery(que); 
		
				while(rss.next()){
			
			%>
			
			<div class="movie_container" >
				<!-- box1 -->
				
				<div class="box">
					<img src="<%=rss.getString("movie_img")%>" >
				</div>
				<a href="movie_details.jsp?id=<%=rss.getString("movie_id")%>"><%=rss.getString("movie_name")%></a>
				
				<p id="movie_rat"><%=rss.getString("movie_rate")%></p>
				<a class="ipc-button ipc-button--full-width ipc-button--center-align-content ipc-button--default-height ipc-button--core-baseAlt ipc-button--theme-baseAlt ipc-button--on-accent2 ipc-secondary-button" role="button" tabindex="0" aria-label="Showtimes" aria-disabled="false" href="showtimes.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="ipc-icon ipc-icon--ticket ipc-button__icon ipc-button__icon--pre" id="iconContext-ticket" viewBox="0 0 24 24" fill="currentColor" role="presentation"><path d="M19.678 6.95l1.414 1.414a1 1 0 0 1 0 1.414L9.778 21.092a1 1 0 0 1-1.414 0L6.95 19.678a2 2 0 1 0-2.829-2.829l-1.414-1.414a1 1 0 0 1 0-1.414L14.021 2.707a1 1 0 0 1 1.414 0l1.414 1.414a2 2 0 1 0 2.829 2.829z"></path></svg><div class="ipc-button__text">Showtimes</div></a>
				
			</div>
			<%}
				st.close();
				con.close();
			%>
			
		</div>
		
   </div>
   
<%@ include file="footer.jsp" %>
	
</body>
</html>