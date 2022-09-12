<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp" %>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.search{
	margin-top:50px;
	}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>

	<div class="search">
		<h5>Result for</h5>
			<h4>Title</h4>
		<ul>
			<li><img src="${movie_img}" alt="${movie_name}"></li>
			<li><a href="movie_details.jsp?id=${movie_id}">${movie_name}</a></li>
			<li>${movie_year}</li>
			<li>${movie_bio}</li>
		</ul>
		
		
	</div>

<%@ include file="footer.jsp" %>

</body>
</html>