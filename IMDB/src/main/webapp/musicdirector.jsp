<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.music-box{

margin-top:50px;
}
</style>
<meta charset="ISO-8859-1">
<title>IMDb</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<div class="music-box">
	
		<%	
		String name=request.getParameter("name");
		//System.out.println(name);
		String url="jdbc:mysql://localhost:3306/imdb";
		String nam="root";
		String pass="15410198";
		
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection  con =   DriverManager.getConnection(url, nam, pass);
		//Connection con=databasecon.getCon();
		Statement st=con.createStatement();
		
		String query="select ms.music_name,ms.music_dob,ms.music_address,ms.music_img,ms.music_bio,m.movie_name,m.movie_year from music AS ms,movie AS m where ms.music_id=m.music_id AND ms.music_name='"+name+"'";
		ResultSet rs = st.executeQuery(query); 
		
		if(rs.next()){
			
		
	%>
	
	<div class="actor-details">
		<h3><%=rs.getString("music_name") %></h3>
		<p><%=rs.getString("music_address") %></p>
		<p>Actor</p>
		
		<img alt="<%=rs.getString("music_name") %>" src="<%=rs.getString("music_img") %>">
		<ul class="actor-know">
			<li>Born:<%=rs.getString("music_dob") %></li>
			<li>Male</li>
			<li>MiniBio:<%=rs.getString("music_bio") %></li>
		</ul>
		
	</div>
	
	<div class="music_mov">
		<h6>Movie:Year</h6>
		<table>
			<tr>
				<td><%=rs.getString("movie_name") %>-</td>
				<td><%=rs.getString("movie_year") %></td>
				
			</tr>
		</table>
	</div>
	<%}
		st.close();
		con.close();
	%>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>