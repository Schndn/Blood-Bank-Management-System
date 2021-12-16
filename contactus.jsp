<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
</head>
<body style="color: white;">
<!-- header -->
      <%@ include file="header.jsp" %>
<body bgcolor="#8B0000">
      <%
		if(request.getParameter("submit") != null){
			String Name = request.getParameter("nm");
			String Email = request.getParameter("em");
			String Subject = request.getParameter("sj");
			String Message= request.getParameter("Mg");
			boolean error = false;
			String msg= "";
			
			//if(Name.isEmpty()){
				//error = true;
				//msg +="Enter Name<br>";
				
			//}


			if(Email.isEmpty()){
				error = true;
				msg +="Enter Email<br>";
				
			}
			if(Subject.isEmpty()){
				error = true;
				msg +="Enter Subject<br>";
				
			}
			if(Message.isEmpty()){
				error = true;
				msg +="Enter Message<br>";
				
			}
			
			if(error == false){
				try{
					
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/blood1","root","");
					String sql ="INSERT INTO contactform (Name, Email, Subject, Message)  VALUES (?,?,?,?)";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, Name);
					ps.setString(2, Email);
					ps.setString(3, Subject);
					ps.setString(4, Message);
					int rs = 0;
					rs = ps.executeUpdate();
					if(rs!=0){
						
						response.sendRedirect("contactus.jsp" );
						
					}
					else{
						out.print("<p>Invalid contact</p>");
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
 
<h1 align="center">Contact Us</h1>
   <form action="" method="post">
   <table ALIGN="center"> 
   <td><big>Please fill out the information below to get in touch with us by email.</big></td>
     <tr>
     </br>
       <td><input placeholder="Name" type="text" size='66' name="nm" value="" required /></td>
       </tr>   
    
       <tr>
 
       <td><input placeholder="Email" type="email" size="66" name="em" value=""  required/><br>
       <small> Please use a REAL email address so that we can get back to you.</small>
       </td>
       </tr>   
        <tr>
       
       <td><input placeholder="Subject" type="text" size="66" name="sj" value="" required /></td>
       </tr>   
       <tr>
          
           <td><textarea placeholder="Message" rows="4" cols="50" name="Mg" value="" /></textarea> </td>
       </tr>   
    
         
    
       <tr>
         <td><input type="submit" name="submit" value="Send"  /></td>
       </tr>
  
     </table>
     
     
     </form>
<%@ include file="footer.jsp" %>
</body>
</html>