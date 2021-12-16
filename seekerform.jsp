<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="java.sql.*" %>
          <%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
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
      <%@ include file="adminlogout.jsp" %>
      <div class="vertical-menu">
	<a href="#" class="active">DashBoard</a>
	<a href="seekerform.jsp">Seeker Form</a>
	
</div>
      <h1><div align="center">Welcome Seeker</div></h1>

<body bgcolor="#8B0000">
      <!--   <div style="height:50px"; align="center";>
      <img src="${pageContext.request.contextPath}/uploads/dashboard.jpg"/> 
      </div> --> 
      <%
      Date dNow = new Date( );
      SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
      
		if(request.getParameter("submit") != null){
			String Name = request.getParameter("nm");
			String Address= request.getParameter("ad");
			String Gender= request.getParameter("rd");
			String Phone= request.getParameter("ph");
			String BloodGroup = request.getParameter("bg");
			String Requesteddate = request.getParameter("red");
			String Received = request.getParameter("r");
			boolean error = false;
			String msg= "";
			
		
			
			if(error == false){
				try{
					
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/blood1","root","");
					String sql ="INSERT INTO seekerform (Name, Address, Gender, Phone, BloodGroup, Requesteddate)  VALUES (?,?,?,?,?,?)";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, Name);
					ps.setString(2, Address);
					ps.setString(3, Gender);
					ps.setString(4, Phone);
					ps.setString(5, BloodGroup);
					ps.setString(6, Requesteddate);
					int rs = 0;
					rs = ps.executeUpdate();
					if(rs!=0){
						session.setAttribute("user", Name); %>
						<br/> <p> Inserted successfully </p> <%
						response.sendRedirect("seekerlist.jsp");
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
 
<h1 align="center"></h1>
   <form action="" method="post">
   <table ALIGN="center">
     <tr>
       <td>Name:</td>
       <td><input placeholder="Enter your Name" type="text" name="nm" value=""  /></td>
       </tr>   
       
       <tr>
       <td>Address:</td>
       <td><input placeholder="Enter your Address" size="30" type="text" name="ad" value="" required /></td>
       </tr>  
    
       <tr>
          <td>Gender:</td>
    <td> Male: <input type="radio" name="rd" value = "male">
     Female:<input type="radio" name="rd" value = "female"></td>      
     </tr>
         
        <tr>
       <td>Phone:</td>
       <td><input placeholder="Enter your Phone number" size="30" type="text" name="ph" value="" required /></td>
       </tr>  
       
        <tr>
       <td>BloodGroup:</td>
       <td>  <select name="bg">
        <option value="A+">A Positive</option>
        <option value="A-">A Negative</option>
        <option value="B+">B Positive</option>
        <option value="B-">B Negative</option>
        <option value="AB+">AB Positive</option>
        <option value="AB-">AB Negative</option>
        <option value="O+">O Positive</option>
        <option value="O-">O Negative</option>
    </select></td>
       </tr>
       
        <tr>
       <td>Requested Date (Todays' Date):</td>
       <td><input size="30" type="date" name="red" value="<%=ft.format(dNow) %>" required/></td>
       </tr>  
       
       
       <tr>
         <td><input type="submit" name="submit" value="Submit"  /></td>
       </tr>
     </table>
     </form>
     <ul style="float:right">
<li><button class="probtn"><a href="bloodseeker.jsp">Go Back </a></button></li></ul>
</body>
</html>