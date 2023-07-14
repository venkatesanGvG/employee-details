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
PreparedStatement ps=con.prepareStatement("insert into users(empname,empid,emprole,empemail,empdep,empproj,empnum) value(?,?,?,?,?,?,?);");
ps.setString(1, empnam);
ps.setString(2, empid);
ps.setString(3, emprole);
ps.setString(4, empemail);
ps.setString(5, empdep);
ps.setString(6, empproj);
ps.setString(7, empnum);
int status=ps.executeUpdate();
out.println("you have succesfully included");
%>
</body>
</html>