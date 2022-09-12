<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IMDb</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	
		<%	
			String id=request.getParameter("id");
			String url="jdbc:mysql://localhost:3306/imdb";
			String name="root";
			String pass="15410198";
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection(url,name,pass);
			Statement st=con.createStatement();
			String query="SELECT DISTINCT d.director_id,d.director_name,d.director_birth,d.director_lang,d.director_gender,d.director_img,d.bio,m.movie_id,m.movie_name,m.movie_year FROM director AS d, movie AS m WHERE d.director_id=m.director_id AND d.director_id="+id;
			ResultSet rs=st.executeQuery(query);
			
			if(rs.next()){
			
			
		%>
		
		<div class="director-details">
		<h3><%=rs.getString("director_name") %></h3>
		<p>Director</p>
		<img alt="<%=rs.getString("Director_name") %>" src="<%=rs.getString("director_img") %>">
		<ul class="director-know">
			<li>Born:<%=rs.getString("director_birth") %></li>
			<li><%=rs.getString("director_gender") %></li>
			<li><%=rs.getString("bio") %></li>
		</ul>
		
	</div>
	
	<div class="director_mov">
		<h6>Director:Movie</h6>
		<table>
			<tr>
				<td><%=rs.getString("director_name")%>-</td>
				<td><%=rs.getString("movie_name") %></td>
				<td>(<%=rs.getString("movie_year") %>)</td>
			</tr>
		</table>
	</div>
	<%} 
	st.close();
		con.close();%>
	
	<%@ include file="footer.jsp" %>

</body>
</html>