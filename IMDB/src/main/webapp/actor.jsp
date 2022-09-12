<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    
    <%@page import="java.sql.*" %>
    <%@page import="com.Dao.databasecon" %>
     <%@page import="java.sql.DriverManager" %>
 	<%@page import="java.sql.ResultSet" %>
 	<%@page import="java.sql.Statement" %>
 	<%@page import="java.sql.Connection" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
.actor-details{
margin-top:50px;
}
</style>
<title>IMDb</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<%	
		String actorid=request.getParameter("id");
		String url="jdbc:mysql://localhost:3306/imdb";
		String name="root";
		String pass="15410198";
		
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection  con =   DriverManager.getConnection(url, name, pass);
		//Connection con=databasecon.getCon();
		Statement st=con.createStatement();
		
		String query="select actor.actor_name,actor.actor_gender,actor.actor_img,actor.actor_birth,movie.movie_name,movie.movie_year,movie_cast.actor_role from actor,movie,movie_cast where actor.actor_id=movie_cast.actor_id AND movie_cast.movie_id=movie.movie_id AND actor.actor_id= "+actorid;
		ResultSet rs = st.executeQuery(query); 
		
		if(rs.next()){
			
		
	%>
	
	<div class="actor-details">
		<h3><%=rs.getString("actor_name") %></h3>
		<p>Actor</p>
		<img alt="<%=rs.getString("actor_name") %>" src="<%=rs.getString("actor_img") %>">
		<ul class="actor-know">
			<li>Born:<%=rs.getString("actor_birth") %></li>
			<li><%=rs.getString("actor_gender") %></li>
		</ul>
		
	</div>
	
	<div class="actor_mov">
		<h6>Actor:Movie</h6>
		<table>
			<tr>
				<td><%=rs.getString("movie_name") %></td>
				<td><%=rs.getString("movie_year") %></td>
				<td><%=rs.getString("actor_role") %></td>
			</tr>
		</table>
	</div>
	<%} 
	st.close();
	con.close();
		%>
	
	<%@ include file="footer.jsp" %>
</body>
</html>