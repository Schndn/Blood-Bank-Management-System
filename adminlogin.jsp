<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
</head>
<meta charset="ISO-8859-1">

<title>Admin Login</title>
<body bgcolor="#B22222">
 <!-- header -->
      <%@ include file="header.jsp" %>
   <div style="height:50px" align="center">
      <img src="${pageContext.request.contextPath}/uploads/admin.jpg"/>
      </div>
<%
		if(request.getParameter("login") != null){
			String username = request.getParameter("uname");
			String password = request.getParameter("pwd");
			boolean error = false;
			String msg= "";
			
			if(username.isEmpty()){
				error = true;
				msg +="Enter Username<br>";
				
			}

			if(password.isEmpty()){
				error = true;
				msg +="Enter Password<br>";
				
			}
			if(error == false){
				try{
					
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/blood1","root","");
					String sql ="SELECT * FROM admin WHERE username=? AND password=?";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, username);
					ps.setString(2, password);
					
					ResultSet rs = ps.executeQuery();
					if(rs.next()){
						session.setAttribute("user", username);
						response.sendRedirect("admindashboard.jsp");
					}
					else{
						out.print("<p>Invalid user</p>");
					}
					
					
					
		
				}catch(Exception e){
						e.printStackTrace();
					}

				
			}
			else{
				out.print("<p>" + msg + "</p>");
			}
		}
	%>
	
	<h2 align="center"> Admin login </h2>
	<div align="center">
	<form action="" method="post">
		<input  placeholder="Username" size="30" type="text" name="uname" required/><br><br>
		<input placeholder="Passsword" size="30" type="password" name="pwd" required/><br><br>
		<input type="submit" name="login" value="Log in"/>
		  
	</form>
	</div>
</body>
</html>