<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     
<!DOCTYPE html>
<html>
<head>
<title>User Login</title>
<body bgcolor="#B22222">
    <style>
body{
	background-color: maroon;
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
<!-- header -->
      <%@ include file="adminlogout.jsp" %>
      
</head>
       
 <%
		if(request.getParameter("submit") != null){
			String Title = request.getParameter("tt");
			String Feedback = request.getParameter("fb");
			boolean error = false;
			String msg= "";
			
			if(Title.isEmpty()){
				error = true;
				msg +="Enter Title<br>";			
			}
			if(Feedback.isEmpty()){
				error = true;
				msg +="Enter Feedback<br>";
				
			}
			if(error == false){
				try{
					
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/blood1","root","");
					String sql ="INSERT INTO feedback(Title, Feedback)  VALUES (?,?)";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, Title);
					ps.setString(2, Feedback);
					
					int rs = 0;
					rs = ps.executeUpdate();
					if(rs!=0){
						session.setAttribute("user", Title);
						response.sendRedirect("adminfeedback.jsp");
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
    
       
<h1 align="center">User feedback</h1>
   <form action="" method="post">
   <table ALIGN="center">
     <tr>
       <td>Title:</td>
       <td><input placeholder="Enter your Title" type="text" size="30" name="tt" value=""  required/></td>
       </tr>   
    
       <tr>
       <td>Feedback:</td>
       <td><textarea rows="10" cols="50"  name="fb" value=""  required /></textarea></td>
       </tr> 
       
       <tr>
		<td><input type="submit" name="submit" value="Send Feedback"  /></td>
		</tr>
		</table>
		  
</form>
<ul style="float:right">
<li><button class="probtn"><a href="userdashboard.jsp">Go Back </a></button></li></ul>
</body>
</html>