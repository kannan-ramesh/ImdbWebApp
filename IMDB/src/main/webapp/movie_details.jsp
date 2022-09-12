<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
  
 <%@page import="java.sql.DriverManager" %>
 <%@page import="java.sql.ResultSet" %>
 <%@page import="java.sql.Statement" %>
 <%@page import="java.sql.Connection" %>
 
 <%@ page import ="java.util.*" session="true" %>
  
 
<!DOCTYPE html>
<html>
	<head>
		<link href="css/moviedetails.css" rel="stylesheet" type="text/css">
		<meta charset="ISO-8859-1">
		<title style="color:yellow">IMDb</title>
	</head>
	<body>

		<%@ include file="header.jsp" %>
	
		<div class="movie-box">
	
			<%
				String movie= request.getParameter("id");
			
 				String url="jdbc:mysql://localhost:3306/imdb";
				String name="root";
				String pass="15410198";
	
				Class.forName("com.mysql.jdbc.Driver");
				Connection  con =   DriverManager.getConnection(url, name, pass);
	 			String query="SELECT DISTINCT m.movie_name,m.movie_year,m.movie_lang,m.movie_img,m.movie_time,m.movie_country,m.movie_rate,m.movie_bio,d.director_id,d.director_name,a.actor_id,a.actor_name,mc.actor_role,mus.music_name,pc.comp_name FROM movie AS m,director AS d,actor AS a,movie_cast AS mc,music AS mus,prod_comp AS pc where m.director_id=d.director_id AND m.music_id=mus.music_id AND a.actor_id=mc.actor_id AND mc.movie_id=m.movie_id AND m.movie_id="+movie;
	 			Statement  st=con.createStatement();
				ResultSet rs = st.executeQuery(query); 
	 			if(rs.next()){
 			%>
		
			<img alt="<%=rs.getString("movie_name") %>" src="<%=rs.getString("movie_img") %>" />
			<h1><%=rs.getString("movie_name") %>
				(<a href="movie_year.jsp?year=<%=rs.getString("movie_year") %>"><%=rs.getString("movie_year") %></a>)
			</h1>
		
			<ul class="item-list">
				<li><%=rs.getString("movie_country") %></li>
				<li><%=rs.getString("movie_time") %></li>
				<li><a href="#">Genres</a></li>
				<li>Date</li>
				<li>Movie</li>
				<li><%=rs.getString("movie_rate") %></li>
			</ul>
		
			<P><%=rs.getString("movie_bio") %></P>
		
		</div>
	
		<div class="movie-star">
			<ul class="person">
				<li>
					<a href="mov_director.jsp?id=<%=rs.getString("director_id")%>">Director:<%=rs.getString("director_name") %></a>
				</li>
				<li>
					<a href="actor.jsp?id=<%=rs.getString("actor_id")%>">Stars:<%=rs.getString("actor_name") %></a>
				</li>
				
				
				<%-- <c:forEach items="" var="i">
    				<tr>      
        				<td>${i.actor_name}</td> 
    				</tr>
				</c:forEach>--%>
				
			
			</ul>
		</div>
	
		<div class="media">
			<h3>Photos and Videos</h3>
		</div>
	
		<div class="movie-cast">
			<h6>Cast</h6>
			<table>
			
				<tr>
					<th>Actor</th>
					<th>Role</th>
				</tr>
				<tr>
					<td>
						<a href="actor.jsp?id=<%=rs.getString("actor_id")%>">
							<%=rs.getString("actor_name") %>
						</a>
					</td>
					<td><%=rs.getString("actor_role") %></td>
				</tr>
			</table>
		</div>
	
		<div class="director">
			<h3>Directed by</h3>
				<p>
					<a href="mov_director.jsp?id=<%=rs.getString("director_id")%>"><%=rs.getString("director_name") %></a>
				</p>
		</div>
	
		<div class="music">
			<h3>Music by</h3>
			<p><a href="musicdirector.jsp?name=<%=rs.getString("music_name") %>"><%=rs.getString("music_name") %></a></p>
		</div>
	
		<div class="produce">
			<h3>Production Company</h3>
			<p><a href="#"><%=rs.getString("comp_name") %></a></p>
		</div>
	
		<div class="genres">
			<h3>Genres</h3>
			<p><a href="#">{gen_name}</a></p>
		</div>
	
		<div class="add-details">
			<h3>Additional Details</h3>
			<ul class="detail-list">
				<li>Runtime:<a><%=rs.getString("movie_name") %></a></li>
				<li>Country:<a href="#"><%=rs.getString("movie_country") %></a></li>
				<li>Language:<a href="#"><%=rs.getString("movie_lang") %></a></li>
			</ul>
		</div>
		<%}
	 			st.close();
		con.close();%>
	
	    <%@ include file="footer.jsp" %>

	</body>
</html>