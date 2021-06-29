<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>

<html>
	<head>
		<meta charset="utf-8">
		
	</head>
	<body>
		<h1>조회</h1>
		
		<%
		Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.73/kopoctc",                  
	                                       "root" , "kopoctc");
	     	      
	    Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select * from examtable;");
		%>
		<table cellspacing=1 width=600 border=1>
		
		<%
		while (rset.next()) {
			out.println("<tr>");
			out.println("<td>"+rset.getString(1)+"</td>");
			out.println("<td>"+Integer.toString(rset.getInt(2))+"</td>");
			out.println("<td>"+Integer.toString(rset.getInt(3))+"</td>");
			out.println("<td>"+Integer.toString(rset.getInt(4))+"</td>");
			out.println("<td>"+Integer.toString(rset.getInt(5))+"</td>");
			out.println("</tr>");
		}
		
		rset.close();     
	    stmt.close();
	    conn.close();	     
		
		%>
		</table>
	</body>
</html>