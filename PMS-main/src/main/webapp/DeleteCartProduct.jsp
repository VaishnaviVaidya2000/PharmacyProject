<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
	HttpSession httpSession = request.getSession();
	String guid = (String) httpSession.getAttribute("currentuser");
	String uid1 = request.getParameter("id");
	
	PreparedStatement ps2 = null;
	Connection conn = null;
	ResultSet rs = null;
	String query1 = "DELETE from cart where pid=? and uid=?";

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "root");
		ps2 = conn.prepareStatement(query1);
		ps2.setString(1, uid1);
		ps2.setString(2, guid);
		int i = ps2.executeUpdate();
		response.sendRedirect("Cart.jsp");
	} catch (Exception e) {
		out.println(e);
	} finally {
		try {
			if (rs != null)
		rs.close();
		} catch (Exception e) {
		}
		;
		try {
			if (ps2 != null)
		ps2.close();
		} catch (Exception e) {
		}
		;
		try {
			if (conn != null)
		conn.close();
		} catch (Exception e) {
		}
		;
	}
	%>
</body>
</html>