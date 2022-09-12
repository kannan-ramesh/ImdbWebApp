<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@page import="java.sql.DriverManager" %>
 <%@page import="java.sql.ResultSet" %>
 <%@page import="java.sql.Statement" %>
 <%@page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<%
 			String id=request.getParameter("movie_id");
 			String url="jdbc:mysql://localhost:3306/imdb";
			String name="root";
			String pass="15410198";
	
	
			Class.forName("com.mysql.jdbc.Driver");
	
			Connection con=null;
			Statement st=null;
			ResultSet resultset=null;
			
			con =   DriverManager.getConnection(url, name, pass);
			
			st=con.createStatement();
	 		String query="SELECT movie.movie_name,movie.movie_rate,movie.movie_time,theaters.theater_name,theaters.show_time,theaters.address from movie,theaters where movie.movie_id=theaters.movie_id";
	 
			ResultSet rs = st.executeQuery(query); 
	 		while(rs.next()){
 		%>
	
	<div class="show">
		
		<!-- <h6>TamilNadu</h6> -->
		<script type="text/javascript">
			
			document.getElementById("date").innerHTML=Date();
		</script>
		<p id="date">Show Time:<%=rs.getString("show_time") %></p>
	</div>
	
	
	
	<div class="theatre-container">
		<h2><%= rs.getString("theater_name") %></h2>
		<p>Location:<%= rs.getString("address") %></p>
			<div class="theatre-show">
				<img>
					<ul class="theatre-movie">
						<li>Movie:<%=rs.getString("movie_name") %></li>
						<li>Duration:<%=rs.getString("movie_time") %></li>
						<li>Rate<%=rs.getString("movie_rate") %></li>
						<li>Show Time:<%=rs.getString("show_time") %></li>
						
					</ul>
			</div>
	</div>
	<hr>
	<%}
	 		st.close();
		con.close();%>
	
	<%@ include file="footer.jsp" %>

</body>
</html>