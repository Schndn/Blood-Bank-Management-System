<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
ul > li {
  display:inline;
}

.header {
  background-color:silver ;
  padding: 5px;
  text-align: center;
  margin:0px;
  height: 60px;
}

.lnbtn {
background-color: Grey; /* Blue */
	  border: none;
	  color: white;
	  padding: 8px 8px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 15px;
	  margin: 4px 2px;
	  cursor: pointer;
}

</style>	
</head>
<body>
<div class="header" >
	<h2 style="float:left;">Welcome to Blood Bank Management System</h2>
	<ul style="float:right">
		<li><button class="lnbtn"><a href="logout.jsp">Logout</a></button></li>
	</ul>
</div>
</body>
</html>