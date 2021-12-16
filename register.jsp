<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="java.sql.*" %>
 
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>donorrequest</title>
<style>
body{
	background-color: maroon;
	background-size:cover;
	margin:0;
	color: black;
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

<div class="header" >
<h2>Welcome to this page </h2>

</div>

<body bgcolor="#8B0000">
 <h1><div align="center"></div></h1>
      <div style="height:50px"; align="center";>
      <img src="${pageContext.request.contextPath}/uploads/dashboard.jpg"/> 
      </div>
      <%
      
      
		if(request.getParameter("submit") != null){
			String Name = request.getParameter("nm");
			String Password = request.getParameter("password");
			String RePassword = request.getParameter("repassword");
			String Email = request.getParameter("em");
			String Address = request.getParameter("ad");
			String Gender = request.getParameter("rd");
			String Phone = request.getParameter("ph");
			boolean error = false;
			String msg= "";

			if(!Password.equals(RePassword))
			{
				error = true;
				msg +="Password Mis match<br>";
			}
		
			if(error == false){
				try{
					
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/blood1","root","");
					String sql ="INSERT INTO register(Name, Password, Email , Address , Gender , Phone)  VALUES (?,?,?,?,?,?)";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, Name);
					ps.setString(2, Password);
					ps.setString(3, Email);
					ps.setString(4, Address);
					ps.setString(5, Gender);
					ps.setString(6, Phone);
					
					int rs = 0;
					rs = ps.executeUpdate();
					if(rs!=0){
						session.setAttribute("user", Name); 
						session.setAttribute("email", Email);
						%> 
						<br/> <p> Inserted successfully </p> <%
						response.sendRedirect("userlogin.jsp");
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
 
<h1 align="center">Register</h1>
   <form action="" method="post">
   <table ALIGN="center">
     <tr>
       <td>Name:</td>
       <td><input placeholder="Enter your Name" size="30" type="text" name="nm" value="" required /></td>
<!--        see this line once -->
       </tr>   
    
     <tr>
       <td>Password:</td>
       <td><input placeholder="Enter your Passsword" size="30" type="password" name="password" required /></td>
       </tr>
              <tr>
       <td>RePassword:</td>
       <td><input placeholder="Enter your Passsword again" size="30" type="password" name="repassword"  required/></td>
       </tr>
       
       <tr>
       <td>Email:</td>
       <td><input placeholder="Enter your Email" size="30" type="text" name="em" value=""  required/></td>
       </tr>   
       
        <tr>
       <td>Address:</td>
       <td><input placeholder="Enter your Address" size="30" type="text" name="ad" value=""  required/></td>
       </tr>   
       
        <tr>
       <td>Gender:</td>
       <td><input placeholder="Enter your Gender" size="30" type="text" name="rd" value=""  required/></td>
       </tr>   
       
        <tr>
       <td>Phone:</td>
       <td><input placeholder="Enter your Phone" size="30" type="text" name="ph" value=""  required/></td>
       </tr>   
         
     
       
       
       <tr>
         <td><input type="submit" name="submit" value="Register"  /></td>
       </tr>
     
     </table>
     
     
     </form>

</body>
</html>