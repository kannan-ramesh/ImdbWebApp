<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    
   <%@ page import="java.sql.*" %>
   <%@ page import="com.Dao.databasecon" %>
   
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.tvshow-box{	
	padding-top:50px;
	}
</style>
<meta charset="ISO-8859-1">
<title>IMDb</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	
		<div class="tvshow-box">
	
	<%
			

			String id=request.getParameter("id");
			String url="jdbc:mysql://localhost:3306/imdb";
			String name="root";
			String pass="15410198";
	

			Class.forName("com.mysql.jdbc.Driver");
			Connection  con =   DriverManager.getConnection(url, name, pass);
					
	 		String query="select t.tvshow_name,t.tvshow_img,t.tvshow_year,t.tvshow_time,t.tvshow_lan,t.genres,t.tvshow_rate,ta.tvact_name,tc.actor_role from tvshow AS t, tvshow_actor AS ta, tvshow_cast AS tc where t.tvshow_id=tc.show_id AND t.tvshow_id="+id;
	 		Statement  st=con.createStatement();
			ResultSet rs = st.executeQuery(query); 
	 		if(rs.next()){
 		%>
		
		<img alt="<%=rs.getString("tvshow_name") %>" src="<%=rs.getString("tvshow_img") %>" />
		<h5><%=rs.getString("tvshow_name") %>(<a href="#"><%=rs.getString("tvshow_year") %></a>)</h5>
		
		<ul class="item-list">
			
			<li><%=rs.getString("tvshow_time") %></li>
			<li><a href="#"><%=rs.getString("genres") %></a></li>
			<li>Date</li>
			<li>TVShow</li>
			<li><%=rs.getString("tvshow_rate") %></li>
		</ul>
		
		<P>A high_octane action Tv_show where a special investigator is assigned a case of serial Killings, he finds the case is not what it seems to be and leading down this path is only going to end in a war between everyone involved.
		</P>
		
	</div>
	
	<div class="tvshow-star">
		<ul class="person">
			<li>
				<a href="#">Director:</a>
			</li>
			<li>
				<a href="">Stars:<%=rs.getString("tvact_name") %></a>
			</li>
			
		</ul>
	</div>
	
	<div class="media">
		<h3>Photos and Videos</h3>
	</div>
	
	<div class="tvshow-cast">
		<h6>Cast</h6>
		<table>
			
			<tr>
				<th>Actor</th>
				<th>Role</th>
			</tr>
			<tr>
		
				<td>
					<a href="">
						<%=rs.getString("tvact_name") %>
					</a>
				</td>
				<td></td>
				
			</tr>
				
		</table>
	</div>
	
	
	
	
	
	<div class="genres">
		<h3>Genres</h3>
			<p><a href="#"><%=rs.getString("genres") %></a></p>
	</div>
	
	<div class="add-details">
		<h3>Additional Details</h3>
			<ul class="detail-list">
				<li>Runtime:<a href="#"><%=rs.getString("tvshow_name") %></a></li>
				
				<li>Language:<a href="#"><%=rs.getString("tvshow_lan") %></a></li>
			</ul>
	</div>
	<%}
	 		st.close();
		con.close();%>
	
	
	
	<%@ include file="footer.jsp" %>

</body>
</html>