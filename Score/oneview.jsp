<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>

<html>
	<head>
		<meta charset="utf-8">
		<style>
			table.type07 {
				border-collapse: collapse;
				text-align: left;
				line-height: 1.5;
				border: 1px solid #ccc;
				margin: 20px 10px;
			}

			table.type07 thead {
				border-right: 1px solid #ccc;
				border-left: 1px solid #ccc;
				background: mediumpurple;
				text-align: center;
			}

			table.type07 thead th {
				padding: 10px;
				font-weight: bold;
				vertical-align: top;
				color: #fff;
			}

			table.type07 tbody th {
				width: 150px;
				padding: 10px;
				font-weight: bold;
				vertical-align: top;
				border-bottom: 1px solid #ccc;
				background: lightsteelblue;
			}

			table.type07 td {
				width: 350px;
				padding: 10px;
				vertical-align: top;
				border-bottom: 1px solid #ccc;
			}
		</style>
	</head>
	<body bgcolor="Lavender">
		
		<%
		Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.73/kopoctc",                  
	                                       "root" , "kopoctc");
	    Statement stmt = conn.createStatement();
		String ckey = request.getParameter( "key" );
		
		ResultSet rset = stmt.executeQuery("select * from examtable where name = '"+ckey+"';");
		%>
		
		<h1 style="color:MediumPurple">[<%=ckey%>]조회</h1>
		<table class="type07">
			<thead>
				<tr>
					<th scope="cols">이름</th>
					<th scope="cols">학번</th>
					<th scope="cols">국어</th>
					<th scope="cols">영어</th>
					<th scope="cols">수학</th>
				</tr>
			</thead>
			<tbody>
		
		<%
		while (rset.next()) {
			out.println("<tr>");
			out.println("<th scope='row' width=100><p align=center>"+rset.getString(1)+"</p></th>");
			out.println("<td width=100><p align=center>"+rset.getInt(2)+"</p></td>");
			out.println("<td width=100><p align=center>"+rset.getInt(3)+"</p></td>");
			out.println("<td width=100><p align=center>"+rset.getInt(4)+"</p></td>");
			out.println("<td width=100><p align=center>"+rset.getInt(5)+"</p></td>");
			out.println("</tr>");
		}
		rset.close();     
	    stmt.close();
	    conn.close();	     
		%>
			</tbody>
		</table>
		<button onclick="location.href='AllviewDB.jsp'">뒤로가기</button>
	</body>
</html>