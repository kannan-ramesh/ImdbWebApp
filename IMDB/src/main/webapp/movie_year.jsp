<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.movieyear-box{

margin-top:50px;
margin-left:50px;
}

.movieyear-details img{
	width:100px;
	height:150px;
}
</style>
<meta charset="ISO-8859-1">
<title>IMDb</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<div class="movieyear-box">
		<h5>Released between This year </h5>
		<%	
		String year=request.getParameter("year");
		//System.out.println(name);
		String url="jdbc:mysql://localhost:3306/imdb";
		String nam="root";
		String pass="15410198";
		
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection  con =   DriverManager.getConnection(url, nam, pass);
		//Connection con=databasecon.getCon();
		Statement st=con.createStatement();
		
		String query="select*from movie where movie_year='"+year+"' ";
		ResultSet rs = st.executeQuery(query); 
		
		while(rs.next()){
			
		
	%>
	
	<div class="movieyear-details">
		<h5><%=rs.getString("movie_name") %></h5>
		
		<img alt="<%=rs.getString("movie_name") %>" src="<%=rs.getString("movie_img") %>">
		<h3><%=rs.getString("movie_year") %></h3>
		<p>Rate:<%=rs.getString("movie_rate") %></p>
		<p>MiniBio=><%= rs.getString("movie_bio") %></p>
		
	</div>
	<hr>
	
	<%}	st.close();
		con.close();
	%>
	
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>