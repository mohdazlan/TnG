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
	<%
	String productName = request.getParameter("productname");
	String quantity = request.getParameter("quantity");
	
	Connection conn = null;
	ResultSet resultSet = null;

	try {
		// Load the JTDS driver
		Class.forName("net.sourceforge.jtds.jdbc.Driver");

		// Establish the connection
		String url = "jdbc:jtds:sqlserver://localhost:1433/Northwind";
		String user = "sa";
		String password = "p@ssw0rd";
		conn = DriverManager.getConnection(url, user, password);

		// SQL for insert
		String sql = "INSERT INTO Products (ProductName,QuantityPerUnit) VALUES (?,?)";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setString(1, productName);
		statement.setString(2, quantity);
		statement.executeUpdate();
		response.sendRedirect("thankyou.jsp");
		statement.close();
		conn.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
</body>
</html>