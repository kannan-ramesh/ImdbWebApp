<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/header.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<header class="head">
		<a href="index.jsp">IMDB</a>
		<form action="Search" method="Post" class="search-form">
			<div class="search-icon">
				<input type="search" name="search" Placeholder="serch Imdb" class="fas fa-search" >
				<button  type="submit" name="save"><i class="fa fa-search"></i></button>
			
			</div>
		</form>	
	</header>
</body>
</html>