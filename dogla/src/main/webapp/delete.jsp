<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<% 
String empid=request.getParameter("id");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/d","root","");

try
{
	PreparedStatement ps=con.prepareStatement("delete from users where empid=?");
ps.setString(1, empid);
int rowsAffected = ps.executeUpdate();
if (rowsAffected == 0) {
    out.println("Sorry, Employee not found.");
}
else{
	out.println("Deletion completed");
}
}
catch(Exception e)
{
	out.println("Data Not Found");
}

%>
<a href="view.jsp">
 <input type="submit" value="view employee">
</a><br><br>
</body>
</html>