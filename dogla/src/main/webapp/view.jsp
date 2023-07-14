<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%!ResultSet resultSet; %>
<%!PreparedStatement pst; %>
<%!Connection con; %>
<h2 align="center"><font><strong>Retrive the data from the database</strong></font></h2>
<table align="center" cellpading="5" cellspacing="5" border="5">
<tr bgcolor="pink">
<td><b>empname</b></td>
<td><b>empid</b></td>
<td><b>emprole</b></td>
<td><b>empemail</b></td>
<td><b>empdep</b></td>
<td><b>empproj</b></td>
<td><b>empnum</b></td>
</tr>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/d","root","");
 pst=con.prepareStatement("select*from users");
//String sql="SELECT*FROM user";
resultSet=pst.executeQuery();
while(resultSet.next()){
	%>
	<tr bgcolor="cyan">
		<td> <%=resultSet.getString(1)%></td>
		<td> <%=resultSet.getInt(2)%></td>
		<td> <%=resultSet.getString(3)%></td>
		<td> <%=resultSet.getString(4)%></td>
		<td> <%=resultSet.getString(5)%></td>
		<td> <%=resultSet.getString(6)%></td>
		<td> <%=resultSet.getString(7)%></td>
		</tr>
	<% 
}
%>
</table>


</body>
</html>