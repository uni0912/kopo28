<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@ page errorPage="create_error.jsp" %>

<html>
	<head>
	</head>
	<body bgcolor="Lavender">
		<h1 style="color:MediumPurple">테이블 만들기 OK</h1>
		
		<%
		Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.73/kopoctc",                  
	                                       "root" , "kopoctc");
	    Statement stmt = conn.createStatement();
		
		stmt.execute(  "create table examtable("
				+ "name varchar(20), "
	     		+ "studentid int not null primary key, "
	     		+ "kor int,eng int,mat int);");
	    stmt.close();
	    conn.close();	     
		%>

	</body>
</html>