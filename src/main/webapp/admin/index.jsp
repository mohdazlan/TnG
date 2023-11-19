<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>You have successfully logged in</h1>
	<%=request.getRemoteUser()%>
	<%
	Connection conn = null;
	Statement statement = null;
	ResultSet resultSet = null;

	try {
		// Load the JTDS driver
		Class.forName("net.sourceforge.jtds.jdbc.Driver");

		// Establish the connection
		String url = "jdbc:jtds:sqlserver://localhost:1433/Northwind";
		String user = "sa";
		String password = "p@ssw0rd";
		conn = DriverManager.getConnection(url, user, password);

		statement = conn.createStatement();
		resultSet = statement.executeQuery("SELECT ProductID,ProductName,QuantityPerUnit FROM Products");
	%>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Product Name</th>
			<th>Quantity Per Unit</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>


		<%
		while (resultSet.next()) {
		%>
		<tr>
			<td><%=resultSet.getInt("ProductID")%></td>
			<td><%=resultSet.getString("ProductName")%></td>
			<td><%=resultSet.getString("QuantityPerUnit")%></td>
			<td><a href="edit.jsp?id=<%=resultSet.getInt("ProductID")%>">Edit</a></td>
			<td><a href="delete.jsp?id=<%=resultSet.getInt("ProductID")%>">Delete</a></td>
		</tr>
		<%
		}
		%>
	</table>
	<%
	}

	catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>