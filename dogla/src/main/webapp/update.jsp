<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*,javax.sql.*" %>
<%
String empnam=request.getParameter("name");
String empid=request.getParameter("id");
String emprole=request.getParameter("role");
String empemail=request.getParameter("email");
String empdep=request.getParameter("dep");
String empproj=request.getParameter("proj");
String empnum=request.getParameter("num");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/d","root","");
String qry = "UPDATE `users` SET `empname`=?, `empid`=?, `emprole`=?, `empemail`=?, `empdep`=?, `empproj`=? where empid=?";
PreparedStatement prt = con.prepareStatement(qry);
prt.setString(1, empnam);
prt.setString(2, empid);
prt.setString(3, emprole);
prt.setString(4, empemail);
prt.setString(5, empdep);
prt.setString(6, empproj);
prt.setString(7, empnum);
int status=prt.executeUpdate();
int s = prt.executeUpdate();

if (s > 0) {
%>
<br>
<div class="container-fluid p-5 bg-primary text-white text-center">
	<h1>Employee updated successfully</h1>
</div>
<%
} else {
%>
<div class="container-fluid p-5 bg-primary text-white text-center">
	<h1>Employee updation failed</h1>
</div>
<%
}
%>

<a href="view.jsp">
 <input type="submit" value="view employee">
</a><br><br>
</body>
</html>