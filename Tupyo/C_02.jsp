<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>

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
			#result {
				width: 200px;
				background-color: #77A88D;
			}
			#tupyo, #hubo {
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
					
					padding: 10px;
					vertical-align: top;
					border-bottom: 1px solid #ccc;
				}
		</style>
	</head>
	<body>
		<%
		String kiho = request.getParameter("kiho");
		String ckey2 = request.getParameter("hubo");
		
		%>
		
		
		<h1>[<%=kiho%>.<%=ckey2%>]후보 연령별 득표율</h1>
		
		<table class="type04">
		
		
		<%
		
		Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.73/kopoctc",                  
	                                       "root" , "kopoctc");
	    Statement stmt = conn.createStatement();
				
		ResultSet rset = stmt.executeQuery("select age*10, count(*), count(*)/(select count(*) from tupyo where kiho="+kiho+") * 100 from tupyo where kiho="+kiho+" group by age order by age;");
		
		
		
		while (rset.next()) {
			int num= rset.getInt(1);
			
			out.println("<tr>");
			out.println("<td width=100>"+num+"대</a></td>");
			out.println("<td><img src='bar.jpg' width='+rset.getInt(2)*10+' height=20>"+rset.getInt(2)+"("+rset.getInt(3)+"%)</td>");
			out.println("</tr>");
			} 
			
					
		rset.close();     
	    stmt.close();
	    conn.close();	     
		%>	
		
		</table>

	</body>
</html>