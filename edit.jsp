<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
          <%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
    
<!DOCTYPE html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
</style>
</head>
<!-- header -->
      <%@ include file="adminlogout.jsp" %>
      <div class="vertical-menu">
	<a href="#" class="active">Profile</a>
	<a href="myprofile.jsp">My Profile</a>
		
</div>
<body>
<%
      Date dNow = new Date( );
      SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
      
		if(request.getParameter("submit") != null){
			String Name = request.getParameter("nm");
			String Password = request.getParameter("pw");
			String Address= request.getParameter("ad");
			String Email = request.getParameter("em");
			String Gender= request.getParameter("rd");
			String Phone= request.getParameter("ph");
			String BloodGroup = request.getParameter("bg");
			String Donationdate = request.getParameter("dd");
			boolean error = false;
			String msg= "";
		
			
			if(error == false){
				try{
					
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/blood1","root","");
					String sql ="SELECT * FROM register (Name,  Address, Email, Gender, Phone)  VALUES (?,?,?,?,?)";
					PreparedStatement ps = con.prepareStatement(sql);
					
					ps.setString(1, Name);
					ps.setString(2, Address);
					ps.setString(3, Email);
					ps.setString(4, Gender);
					ps.setString(5, Phone);
					ps.setString(6, BloodGroup);
					ps.setString(7, Donationdate);
					int rs = 0;
					rs = ps.executeUpdate();
					if(rs!=0){
						session.setAttribute("user", Name);
						session.setAttribute("address", Address);
						session.setAttribute("email", Email);
						session.setAttribute("gender", Gender );
						session.setAttribute("phone", Phone);
						session.setAttribute("BloodGroup", BloodGroup);
						session.setAttribute("Donationdate", Donationdate);%>
						<br/> <p> Inserted successfully </p> <%
						response.sendRedirect("myprofile.jsp");
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
 
<h1 align="center">Welcome to your Edit Page</h1>
   <form action="" method="post">
   <table ALIGN="center">
     <tr>
   <td>Name:</td>
       <td><input placeholder="Enter your Name" size="30" type="text" name="nm" value="<%=session.getAttribute("user") %>" required/> </td>
       </tr>   
   
       <tr>
       <td>Address:</td>
       <td><input placeholder="Enter your Address" size="30" type="text" name="ad" value="<%=session.getAttribute("address") %>" required/></td>
       </tr>  
    <tr>
   <td>Email:</td>
       <td><input placeholder="Enter your Email" size="30" type="text" name="em" value="<%=session.getAttribute("email") %>" required/> </td>
       </tr> 
      <tr>
      <td>Gender:</td>
    <td> Male: <input type="radio" name="rd" value = "male">
     Female:<input type="radio" name="rd" value = "female"></td>      
     </tr>
        
        <tr>
        <td>Phone:</td>
       <td><input placeholder="Enter your Address" size="30" type="text" name="ph" value="<%=session.getAttribute("phone") %>" required/></td>
       </tr>  
       
        <tr>
 
       <td>BloodGroup:</td>
       <td>
         <select name="bg">
        <option value="A+">A Positive </option>
        <option value="A-">A Negative</option>
        <option value="B+">B Positive</option>
        <option value="B-">B Negative</option>
        <option value="AB+">AB Positive</option>
        <option value="AB-">AB Negative</option>
        <option value="O+">O Positive</option>
        <option value="O-">O Negative</option>

    </select>
       </td>
       </tr>
        <tr>
       <td>Donationdate:</td>
       <td><input placeholder="Enter your Donation Date" size="30" type="date"  name="dd"  /></td>
       </tr>
       <tr>
         <td><input type="submit" name="submit" value="Submit"  /></td>
       </tr>
     

</body>
</html>