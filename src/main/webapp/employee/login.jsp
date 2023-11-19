<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>TnG Credit Service</h1>
	<form action="j_security_check" method="post">
		<table>
			<tr>
				<td><label>User name</label></td>
				<td><input type="text" name="j_username"></td>
			</tr>
			<tr>
				<td><label>Password</label></td>
				<td><input type="password" name="j_password"></td>
			</tr>
			<tr>

				<td colspan="2"><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>