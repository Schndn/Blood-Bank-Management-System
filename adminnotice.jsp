<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
 <%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Notice</title>
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

<body>
       <!-- header -->
      <%@ include file="admindashboard.jsp" %>
      
 <%
		if(request.getParameter("submit") != null){
			String Title = request.getParameter("tt");
			String Noticedate= request.getParameter("ndd");
			String Notice= request.getParameter("nt");
			boolean error = false;
			String msg= "";
			//if(Title.isEmpty()){
				//error = true;
				//msg +="Enter Title<br>";			
			//}
			//if(Notice.isEmpty()){
				//error = true;
				//msg +="Enter Notice<br>";			
			//}
			if(error == false){
				try{
					
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/blood1","root","");
					String sql ="INSERT INTO notice(Title, Noticedate,  Notice)  VALUES (?,?,?)";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1,  Title);
					ps.setString(2,  Noticedate);
					ps.setString(3, Notice);
					int rs = 0;
					rs = ps.executeUpdate();
					if(rs!=0){
						session.setAttribute("user", Title);
						response.sendRedirect("notice.jsp");
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
    
       
<h1 align="center">Admin Notice</h1>
 <form action="" method="post">
   <table ALIGN="center"> 
  
      <tr>
       <td><input placeholder="Title" type="text" size='24' name="tt" value="" required /></td>
       </tr>   
       <tr>
       <td><input placeholder="Noticedate" size="30" type="date"  name="ndd"  /></td>
       </tr>
       <tr>
          
           <td><textarea placeholder="Notice" rows="4" cols="33" name="nt" value="" /></textarea> </td>
       </tr>   
    
           
       
       <tr>
         <td><input type="submit" name="submit" value="Send"  /></td>
       </tr>
		</table>
		
   
</form>

</body>
</html>