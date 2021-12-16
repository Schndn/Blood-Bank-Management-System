<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     
<!DOCTYPE html>
<html>
<head>
<title>User Login</title>
<body bgcolor="#B22222">
     <!-- header -->
      <%@ include file="header.jsp" %>
       <div style="height:50px" align="center">
      <img src="${pageContext.request.contextPath}/uploads/admin.jpg"/>
      </div>
 <%
		if(request.getParameter("login") != null){
			
			String Email = request.getParameter("em");
			String Password = request.getParameter("pwd");
			boolean error = false;
			String msg= "";
			
			if(error == false){
				try{
					
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/blood1","root","");
					String sql ="SELECT * FROM register WHERE Email=? AND Password=?";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, Email);
					ps.setString(2, Password);
					
					ResultSet rs = ps.executeQuery();
					if(rs.next()){
						//session.setAttribute("user", Username);
// 					response.sendRedirect("userdashboard.jsp"); instead of this
					request.setAttribute("email", Email);
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("userdashboard.jsp");
					requestDispatcher.forward(request, response);
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
 if(request.getParameter("register") != null){
	 response.sendRedirect("register.jsp");
 }
	%>
    
       
<h1 align="center">User Login</h1>
   <form action="" method="post">
   <table ALIGN="center">
    
    
       <tr>
       <td><input placeholder="Email" type="email" size="30" name="em" value="" required></td>
       </tr> 
           
        <tr>
       <td><input placeholder="Passsword" type="password" size="30" name="pwd" value="" required></td>
       </tr>
       <tr>
		<td>
		<input type="submit" name="login" value="Log In"  />
		</td>
		</tr>
		</table>
		  
</form>
<form action="">
<table ALIGN="center">
<tr>
<td><small> Not yet a member?</small><input type="submit" name="register" value="Register"  /></td></tr>
</table>
</form>

</body>
</html>