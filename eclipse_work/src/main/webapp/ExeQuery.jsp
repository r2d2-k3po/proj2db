<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.DBConnPool" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>

	<%
	DBConnPool pool = new DBConnPool();
	
	String sql = "SELECT code, pname, cost, pnum, jnum, sale, gcode FROM product";
	Statement stmt = pool.con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	while (rs.next()) {	
		String code = rs.getString("code");
		String pname = rs.getString("pname");
		String cost = rs.getString("cost");
		String pnum = rs.getString("pnum");
		String jnum = rs.getString("jnum");
		String sale = rs.getString("sale");
		String gcode = rs.getString("gcode");
		
		out.println(String.format("%s %s %s %s %s %s %s", code, pname, cost, pnum, jnum, sale, gcode) + "<br/>");	
	}
	
	sql = "SELECT gcode, gname FROM groupcode";	
	rs = stmt.executeQuery(sql);
	
	while (rs.next()) {	
		String gcode = rs.getString("gcode");
		String gname = rs.getString("gname");
		
		out.println(String.format("%s %s", gcode, gname) + "<br/>");	
	}
	
	
	pool.close();	
	%>
	
	
</body>
</html>