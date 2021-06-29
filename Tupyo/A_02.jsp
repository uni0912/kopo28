<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>

<%
	String ckey2 = request.getParameter("name");
	String name = new String(ckey2.getBytes("8859_1"),"utf-8");
	String kiho = request.getParameter("kiho");
		
	Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.73/kopoctc",                  
	                                       "root" , "kopoctc");
	    Statement stmt = conn.createStatement();
		String QueryTxt = "delete from hubo where kiho ="+kiho+";";
		stmt.executeUpdate(QueryTxt);
		QueryTxt = "delete from tupyo where kiho ="+kiho+";";
		stmt.executeUpdate(QueryTxt);
								 
	    stmt.close();
	    conn.close();	
%>
<html>
	<head>
	<meta charset="utf-8">
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
		#hubo {
			width: 200px;
			background-color: #77A88D;
		}
		#tupyo, #result {
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
	<h2>후보삭제 결과 : 후보가 삭제되었습니다.</h2>
	</body>
	
</html>