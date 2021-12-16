<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
    <%
    	if(session.getAttribute("user") == null){
    		response.sendRedirect("adminlogin.jsp");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<style>
body{
	background-color: maroon;
	background-size:cover;
	margin:0;
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
<body>
<!-- header -->
      <%@ include file="adminlogout.jsp" %>

<div class="vertical-menu">
	<a href="#" class="active">Feedback</a>
	<a href="contactadmin.jsp">To Admin</a>
	
</div>
      <!--  body content -->
      <div  align="center">
      <img src="${pageContext.request.contextPath}/uploads/Donate-Blood.jpg"/> 
      </div>
</body>
</html>