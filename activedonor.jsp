<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
     <%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ActiveDonor List</title>
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
</head>

<!-- header -->
      <%@ include file="adminlogout.jsp" %></head>
<body bgcolor="#8B0000">

<h1><div align="center">Active Donor List</div></h1>
<form action="" method="GET">
	<table border="0" width="300" style="float:right; bgcolor="#CDFFFF">
		<tr><td colspan=2 style="font-size:12pt;color:#00000;" align="center"></td></tr>
		<tr>
			<td ><b>Blood Group:</b></td>
			<td><input type="text" name="name" id="name">
			</td>
		</tr>
		<tr>
			<td colspan=2 align="center">
			<input type="submit" name="search" value="Search">
			</td>
		</tr>
	</table>
</form>
 <%
 Date dNow = new Date( );
 SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
 
 
		if(request.getParameter("search") != null){
			String BloodGroup = request.getParameter("name");
			boolean error = false;
			String msg= "";
		
		if(BloodGroup == null){
			error = true;
			msg +="Enter BloodGroup<br>";
		
		}
		if(error == false){
				try{
					
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/blood1","root","");
					String sql ="SELECT * FROM donorreg WHERE BloodGroup=?";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, BloodGroup);
					ResultSet rs = ps.executeQuery();
						    %>
					<table width="100%" border="2" cellspacing="0" cellpadding="0">
			        <tr>
			          <th>Id</th>
		          <th>Name</th>
		          <th>Address</th>
		         <th>Email</th>
		          <th>Gender</th>
		          <th>Phone</th>
		          <th>BloodGroup</th>
		          <th>Donation Date</th>
		          <th>Days</th>
			        </tr>
		     <% while(rs.next()){ 
		    	 int diff = (int) (dNow.getTime()/(1000*60*60*24) - rs.getDate("Donationdate").getTime()/(1000*60*60*24)); 
		     	if (diff > 90) {
		     	%> 
		        <tr>
		        	<td> <%=rs.getString("Id") %></td>
		        	<td> <%=rs.getString("Name") %> </td>
		        	<td> <%=rs.getString("Address") %> </td>
		            <td> <%=rs.getString("Email") %> </td>
		        	<td> <%=rs.getString("Gender") %> </td>
		        	<td> <%=rs.getString("Phone") %> </td>
		        	<td> <%=rs.getString("BloodGroup") %> </td>
		        	<td> <%=rs.getString("Donationdate") %> </td>
		        	<td> <% out.print(diff + "  days ago");%>  </td>
		        			        </tr>
		        <% } } %>
		        
			</table>
		<%
			}catch(Exception e){
				
					e.printStackTrace();
				}

			
		}
		else{
			out.print("<p>" + msg + "</p>");
		}
	}
	%>



<%
if(request.getParameter("search") == null){
try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/blood1","root","");
	String sql ="SELECT * FROM donorreg";
	PreparedStatement ps = con.prepareStatement(sql);

	ResultSet rs = ps.executeQuery();
	
		%> 
			<table width="100%" border="2" cellspacing="0" cellpadding="0">
		        <tr>
		          <th>Id</th>
		          <th>Name</th>
		          <th>Address</th>
		          <th>Email</th>
		          <th>Gender</th>
		          <th>Phone</th>
		          <th>BloodGroup</th>
		          <th>Donation Date</th>
		          <th>Days</th>
		        </tr>
		     <%    
		    
		     while(rs.next()){ 
				int diff = (int) (dNow.getTime()/(1000*60*60*24) - rs.getDate("Donationdate").getTime()/(1000*60*60*24)); 
		     	if (diff > 90) { 
		     %> 
		        <tr>
		        	<td> <%=rs.getString("Id") %></td>
		        	<td> <%=rs.getString("Name") %> </td>
		        	<td> <%=rs.getString("Address") %> </td>
		        	<td> <%=rs.getString("Email") %> </td>
		        	<td> <%=rs.getString("Gender") %> </td>
		        	<td> <%=rs.getString("Phone") %> </td>
		        	<td> <%=rs.getString("BloodGroup") %> </td>
		        	<td> <%=rs.getString("Donationdate") %> </td>
		        	<td> <% out.print(diff + "  days ago"); %>  </td>
		        </tr>
		        <% } }%>
			</table>
			
		<%
		
}catch(Exception e){
	
		e.printStackTrace();
	}
}
%> 
</body>
</html>