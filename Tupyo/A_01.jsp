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
				h1 {
					color: rgb(119, 109, 97);
				}
			
				table.type04 {
					border-collapse: separate;
					border-spacing: 1px;
					text-align: left;
					line-height: 1.5;
					width: 600px;
					border-top: 1px solid #ccc;
					margin: 20px 10px;
				}

				table.type04 th {
					width: 200px;
					padding: 5px;
					font-weight: bold;
					vertical-align: top;
					border-bottom: 1px solid #ccc;
				}

				table.type04 td {
					width: 200px;
					padding: 5px;
					vertical-align: top;
					border-bottom: 1px solid #ccc;
				}
			</style>
			
		</head>

		<body>
			<% Class.forName("com.mysql.cj.jdbc.Driver"); Connection
				conn=DriverManager.getConnection("jdbc:mysql://192.168.23.73/kopoctc", "root" , "kopoctc" ); Statement
				stmt=conn.createStatement(); ResultSet rset=stmt.executeQuery("select * from hubo;"); %>

				<h1>후보등록</h1>

				<table class="type04">

					<% while (rset.next()) {
						out.println("<tr>");
						out.println("<th scope='row'><form method='post' action='A_02.jsp'>"
								+"기호:<input type='number' name='kiho' value="+rset.getString(1)+" readonly></th>");
						out.println("<td>이름:<input type='text' name='name' value="+rset.getString(2)+" readonly></td>");
						out.println("<td><input type='submit' value='삭제'></td></form>");
						out.println("</tr>");
						}

						out.println("<tr><form method='post' action='A_03.jsp'><th scope='row'>"
									+"기호:<input type='number' name='kiho'></th>");
						out.println("<td>이름:<input type='text' name='name'></td>");
						out.println("<td><input type='submit' value='추가'></form></td></tr>");
						rset.close();
						stmt.close();
						conn.close();
						%>

				</table>

		</body>

		</html>