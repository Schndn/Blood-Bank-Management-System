<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
          <%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My profile</title>
<style>
body{
	background-color: maroon;
	background-size:cover;
	margin:0;
	color:white;
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
</head>
<!-- header -->
      <%@ include file="adminlogout.jsp" %>
      <div class="vertical-menu">
	<label style="font-size:26px;"> Profile</label>
	<a href="myprofile.jsp" class="active">My Profile</a>
	
</div>
<body>

 <%
      Date dNow = new Date( );
      SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
      
		if(request.getParameter("submit") != null){
			String Name = request.getParameter("nm");
			String Address= request.getParameter("ad");
			String Email= request.getParameter("em");
			String Gender= request.getParameter("rd");
			String Phone= request.getParameter("ph");
			String BloodGroup= request.getParameter("bg");
			boolean error = false;
			String msg= "";
			
		
			
			if(error == false){
				try{
					
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/blood1","root","");
					String sql ="SELECT * FROM user WHERE Name=?, Address=?, Email=?, Gender=?, Phone=?, BloodGroup=?)";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, Name);
					ps.setString(2, Address);
					ps.setString(3, Email);
					ps.setString(4, Gender);
					ps.setString(5, Phone);
					ps.setString(6, BloodGroup);
					int rs = 0;
					rs = ps.executeUpdate();
					if(rs!=0){
						session.setAttribute("user", Name);
						session.setAttribute("address", Address);
						session.setAttribute("email", Email );
						session.setAttribute("gender", Gender );
						session.setAttribute("phone", Phone);
                        session.setAttribute("bloodGroup", BloodGroup);%>
						<br/> <p> Inserted successfully </p> <%
						response.sendRedirect("edit.jsp");
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

<h1 align="center">My Profile</h1>
   <form action="" method="post">
   <table ALIGN="center">
     <tr>
       <td>Name:</td>
       <td><%=session.getAttribute("user") %>  </td>
       </tr>   
       
       <tr>
       <td>Address:</td>
       <td><%=session.getAttribute("address") %></td>
       </tr>  
    <tr>
       <td>Email:</td>
       <td><%=session.getAttribute("email") %></td>
       </tr>  
       <tr>
          <td>Gender:</td>
    <td> <%=session.getAttribute("gender") %></td>      
     </tr>
         
        <tr>
       <td>Phone:</td>
       <td><%=session.getAttribute("phone") %></td>
       </tr>  
       
        <tr>
       <td>BloodGroup:</td>
       <td> <%=session.getAttribute("bloodgroup") %></td>
       </tr>
       <tr>
       <td>Donationdate:</td>
       <td> <%=session.getAttribute("donationdate") %></td>
       </tr>
       <tr>
     
         <td><button class="probtn"><a href="edit.jsp">Edit </a></button></td>
       </tr>
       </form>
 <ul style="float:right">
<li><button class="probtn"><a href="userdashboard.jsp">Go Back </a></button></li></ul>
</body>
</html>