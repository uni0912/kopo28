<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
<html>
	<head>
		<meta charset="utf-8">
		<H1 style="color:MediumPurple">JSP Database 실습 1</H1>
		
	</head>
	<body bgcolor="Lavender" style="color:MediumPurple">
		<%
		String data;
		int cnt=0;
		
		FileReader f1 = new FileReader("/var/lib/tomcat9/webapps/ROOT/DB01/cnt.txt");
		StringBuffer sb = new StringBuffer();
		int ch = 0;
		while((ch = f1.read()) != -1) {
			sb.append((char)ch);
		}
		data=sb.toString().trim().replace("\n","");
		f1.close();
		
		cnt=Integer.parseInt(data);
		cnt++;
		data=Integer.toString(cnt);
		out.println("<br><br>현재 홈페이지 방문조회수는 ["+data+"] 입니다.</br>");
		
		FileWriter f12 = new FileWriter("/var/lib/tomcat9/webapps/ROOT/DB01/cnt.txt", false);
		f12.write(data);
		f12.close();
		%>
		
	</body>
</html>