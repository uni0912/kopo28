<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>

<html>
	<head>
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
			h1 {
				color: rgb(119, 109, 97);
			}
			table.type04 {
					border-collapse: separate;
					border-spacing: 1px;
					text-align: left;
					line-height: 1.5;
					border-top: 1px solid #ccc;
					margin: 20px 10px;
					width: 600px;
				}

				table.type04 td {
					width: 200px;
					padding: 10px;
					vertical-align: top;
					border-bottom: 1px solid #ccc;
				}
		</style>
	</head>
	<body>
	
	<h1>투표하기</h1>
		
		<table class="type04">
		<tr>
		<form method="post" action="B_02.jsp">
		<td width=200>
		<select name="kiho">
		<option value="" width=200>후보 선택
		<%
		Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.73/kopoctc",                  
	                                       "root" , "kopoctc");
	    Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select * from hubo;");
		int cnt=1;
		while (rset.next()) {
			out.println("<option value="+cnt+">"+ rset.getString(1) +"번 "+ rset.getString(2));
			cnt++;
		}	
		rset.close();     
	    stmt.close();
	    conn.close();	     
		%>	
			
			</select>
			</td>
			<td width=200 size=200>
			<select name="age" width=200>
			<option value="">연령대 선택
			<option value=1>10대
			<option value=2>20대
			<option value=3>30대
			<option value=4>40대
			<option value=5>50대
			<option value=6>60대
			<option value=7>70대
			<option value=8>80대
			<option value=9>90대
			</select>
			</td>
			<td>
			<input type="submit" value="투표하기">
			</td>
			</table>
		</body>
</html>