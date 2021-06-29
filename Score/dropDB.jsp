<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@ page errorPage="drop_error.jsp" %>

<html>
	<head>
	</head>
	<body bgcolor="Lavender" style="color:MediumPurple">
		<h1>테이블 지우기 OK</h1>

			<%
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.73:3306/kopoctc",                  
					"root" , "kopoctc");
			Statement stmt = conn.createStatement(); 

			stmt.execute("drop table examtable;");

			stmt.close();
			conn.close();
			%>
			
	</body>
</html>