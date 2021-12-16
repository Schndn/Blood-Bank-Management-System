<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
          <%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My requested data</title>
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
	<a href="myrequesteddata.jsp" >My Requested Data</a>
	
</div>


<%
if(request.getParameter("checkStatus") != null){
	String status = request.getParameter("Blood");
	boolean error = false;
	String msg= "";
	if(error == false){
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/blood1","root","");
			String sql = "UPDATE seekerform SET `Received`=[value-1] WHERE 1"; //check it
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, status);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("myrequesteddata.jsp");
			requestDispatcher.forward(request, response);
			}
			else{
				out.print("<p>Error in update</p>");
			}		
		}catch(Exception e){
				e.printStackTrace();
			}
		
	}
	else{
		out.print("<p>" + msg + "</p>");
	}
}

try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/blood1","root","");
	String sql ="SELECT * FROM seekerform";
	PreparedStatement ps = con.prepareStatement(sql);

	ResultSet rs = ps.executeQuery();
		%> 
			<table width="100%" border="2" cellspacing="0" cellpadding="0">
		        <tr>
		          <th>Id</th>
		          <th>Name</th>
		          <th>Address</th>
		          <th>Gender</th>
		          <th>Phone</th>
		           <th>BloodGroup</th>
		           <th>Status</th>
		           
		        </tr>
		     <%    while(rs.next()){ %> 
		        <tr>
		        	<td> <%=rs.getString("Id") %></td>
		        	<td> <%=rs.getString("Name") %> </td>
		        	<td> <%=rs.getString("Address") %> </td>
		        	<td> <%=rs.getString("Gender") %> </td>
		        	<td> <%=rs.getString("Phone") %> </td>
		        	<td> <%=rs.getString("BloodGroup") %> </td>
		        	<td> <form action="">
  <input type="checkbox" name="Blood" value="Received" required> Received <br>
  <input type="submit" value="Submit" name="checkStatus">
</form> </td>
		        </tr>
		        <% } %>
			</table>
			
		<%
	
}catch(Exception e){
	
		e.printStackTrace();
	}
%>
<ul style="float:right">
<li><button class="probtn"><a href="userdashboard.jsp">Go Back </a></button></li></ul>
</body>
</html>