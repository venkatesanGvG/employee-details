<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.DriverManager"%>
	<%@ page import="java.sql.ResultSet"%>
	<%@ page import="java.sql.PreparedStatement"%>
	<%@ page import="java.sql.Connection"%>
	<%!ResultSet rs;%>
	<%!PreparedStatement ps;%>
	<%!Connection conn;%>
	<h2 align="center">
		<font><strong>Retrieve Database </strong></font>
	</h2>
	<table align="center" cellspacing="5" cellpadding="5" border="1">

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
		String empid=request.getParameter("id");
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/d","root","");
		ps = conn.prepareStatement("select *from users where empid=?");
		ps.setString(1, empid);
		rs = ps.executeQuery();
		while (rs.next()) {
		%>
		<tr bgcolor="cyan">
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>

		</tr>

		<%
		}
		%>
	</table>
</body>
</html>