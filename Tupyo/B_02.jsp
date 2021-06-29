<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>

<html>
	<head>
	<meta charset="utf-8">
	
<%
	String kiho = request.getParameter("kiho");
	String age = request.getParameter("age");
	Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.73/kopoctc",                  
	                                       "root" , "kopoctc");
	    Statement stmt = conn.createStatement();
				
		stmt.execute( "insert into tupyo (kiho, age) values ("
					+kiho+ ","
					+age+");");	
				 
	    stmt.close();
	    conn.close();
%>

<style>
	#header {
		border-collapse: collapse;
		text-align: center;
		width: 600px;
		height: 50px;
		border: 1px solid #ccc;
	}
	#header td {
		border: 1px solid #ccc;
	}
	#tupyo {
		width: 200px;
		background-color: #77A88D;
	}
	#hubo, #result {
		width: 200px;
	}
</style>
<table id="header">
	<tr>
		<td id="hubo" onclick="location.href='A_01.jsp'">후보등록<br></td>
		<td id="tupyo" onclick="location.href='B_01.jsp'">투표<br></td>
		<td id="result" onclick="location.href='C_01.jsp'">개표결과<br></td>
	</tr>
</table>
<style>
	body {
		background-color: mintcream;
	}
	h2 {
		color: rgb(119, 109, 97);
	}
</style>
	
	</head>
	<body>
	
		
	<h2>투표 결과 : 투표하였습니다.</h2>
	</body>
	
</html>