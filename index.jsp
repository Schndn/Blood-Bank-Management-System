<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head >
<title>BBMS</title>
<style>

body {
  margin: 0;
}

/* Style the header */
.header {
  background-color: firebrick;
  padding: 3px;
  color: white;
   text-align: center;
  
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

<body bgcolor="#B22222">
      <!-- header -->
      <%@ include file="header.jsp" %>
      
      <!--  body content -->
      <div style="height:200px; width=200px;" align="center">
      <img src="${pageContext.request.contextPath}/uploads/index.PNG"/> 
      </div>
      
      

</body>
</html>