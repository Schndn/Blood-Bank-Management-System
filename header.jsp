<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style>

body {
  margin: 0;
}

/* Style the header */
.header {
  background-color: firebrick;
  padding: 3px;
  text-align: center;
  color: white;
  
}

h1 {
  font-size: 36px;
  
  padding: 0px;
  }
#logo {
	margin-top:10px;
	width:300px;
	float:left;
	margin-right:10px;
	padding: 8px;
	height:50px;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 75px;
  text-decoration: none;
}

li a:hover {
  background-color: #ccc;
}
h2 {
  
  text-align: center;
}
</style>
</head>
<meta charset="ISO-8859-1">
<div class="header">
  <h1><img src="${pageContext.request.contextPath}/uploads/header.PNG"/> BLOOD BANK MANAGEMENT SYSTEM</h1>
</div>
<body bgcolor="#B22222">
<ul>
   <li><a class="active" href="index.jsp">Home</a></li>
           <li><a href="adminlogin.jsp">AdminLogin</a></li>
 		   <li><a href="userlogin.jsp">UserLogin</a></li>
 		   <li><a href="aboutus.jsp">About Us</a></li>
 		   <li><a href="contactus.jsp">Contact Us</a></li>
</ul>
   </body>