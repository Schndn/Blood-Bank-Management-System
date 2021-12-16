<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Blood Seeker</title>
</head>
<style>
body{
	background-color: maroon;
	background-size:cover;
	margin:0;
	color:white;
}

.header {
  background-color:silver ;
  padding: 5px;
  text-align: center;
  margin:0px;
  
  
  
}

 .vertical-menu{
	width:200px;
	
}
.vertical-menu a{
	background-color:#333;
	color:white;
	display: block;
	padding: 13px;
	text-decoration: none;

}
.vertical-menu a:hover{
	background-color: #ccc;
}

.vertical-menu a.active {
	background-color: #4CAF50;
	color: white;
}
h2 {
  text-align: left;
}

</style>
</head>

<!-- header -->
      <%@ include file="adminlogout.jsp" %>
<div class="vertical-menu">
	<a href="#" class="active">DashBoard</a>
	<a href="adddonorform.jsp">Donor Registration</a>
	<a href="donorlist.jsp">Donors list</a>
	
</div>
      <!--  body content -->
      <div  align="center">
      <img src="${pageContext.request.contextPath}/uploads/Donate-Blood.jpg"/> 
      </div>
      <ul style="float:right">
<li><button class="probtn"><a href="userdashboard.jsp">Go Back </a></button></li></ul>
</body>
</html>