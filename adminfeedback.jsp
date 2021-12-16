<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Feedback list</title>
<style>
body{
	background-color: marron;
	background-size:cover;
	margin:0;
	color: white;
}

.header {
  background-color:silver ;
  padding: 5px;
  text-align: center;
  margin:0px;
  
  
  
}

 .vertical-menu{
	width:200px;
	color: white;
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
	<a href="#" class="active">Feedback</a>
	<a href="adminfeedback.jsp">User Feedback list</a>
	<a href="contactadmin.jsp">Direct Contact Admin</a>
	
</div>
</head>
<body bgcolor="#8B0000">

<h1><div align="center">User Feedback List</div></h1>
<%

try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/blood1","root","");
	String sql ="SELECT * FROM feedback";
	PreparedStatement ps = con.prepareStatement(sql);

	ResultSet rs = ps.executeQuery();
		%> 
		
			<table width="100%" border="2" cellspacing="0" cellpadding="0">
		        <tr>
		          <th>Id</th>
		          <th>Title</th>
		          <th>Feedback</th>
		        </tr>
		     <%    while(rs.next()){ %> 
		        <tr>
		        	<td> <%=rs.getString("Id") %></td>
		        	<td> <%=rs.getString("Title") %> </td>
		        	<td> <%=rs.getString("Feedback") %> </td>
		        </tr>
		        <% } %>
			</table>
			
		<%
	
	
}catch(Exception e){
	
		e.printStackTrace();
	}

%> 
<ul style="float:right">
<li><button class="probtn"><a href="admindashboard.jsp">Go Back </a></button></li></ul>
</body>
</html>