<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
<%@ page errorPage="insert_error.jsp" %>
<%
	String ckey2 = request.getParameter("name");
	String name = new String(ckey2.getBytes("8859_1"),"utf-8");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.73/kopoctc",                  
	                                       "root" , "kopoctc");
	    Statement stmt = conn.createStatement();
		int newid = 0;				
		ResultSet rset = stmt.executeQuery("select max(studentid) from examtable;");
			
		while (rset.next()) {
			newid = rset.getInt(1)+1;
		}
		
		stmt.execute( "insert into examtable (name, studentid, kor, eng, mat) values('"
				+ name+"',"
				+ newid+","
				+ Integer.parseInt(kor)+","
				+ Integer.parseInt(eng)+","
				+ Integer.parseInt(mat)+");");
		
		rset.close();		 
	    stmt.close();
	    conn.close();	
%>
<html>
	<head>
	<meta charset="utf-8">
	<h2 style="color:MediumPurple">성적입력추가완료</h2>
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
	<body body bgcolor="Lavender">
	<form method="post" action="inputform1.html">
	<input type="submit" value="뒤로가기">
	<table width=500 class="type07">
		<tbody>
	<tr>
	<th width=100 align=center>이름</th>
	<td><input type="text" required="required" autocomplete='off' maxlength=10 onpaste="return false;" name="name" value="<%=name%>" onKeypress="if(!(event.keyCode <47 && event.keyCode>58))event.returnValue=false;"></td>
	</tr>
	<tr>
	<th width=100 align=center>학번</th>
	<td><input type="text" required="required" autocomplete='off' maxlength=10 onpaste="return false;" value="<%=newid%>" size=50></td>
	</tr>
	<tr>
	<th width=100 align=center>국어</th>
	<td><input type="text" required="required" autocomplete='off' maxlength=10 onpaste="return false;" value='<%=kor%>' size=50></td>
	</tr>
	<tr>
	<th width=100 align=center>영어</th>
	<td><input type="text" required="required" autocomplete='off' maxlength=10 onpaste="return false;" value='<%=eng%>' size=50></td>
	</tr>
	<tr>
	<th width=100 align=center>수학</th>
	<td><input type="text" required="required" autocomplete='off' maxlength=10 onpaste="return false;" value='<%=mat%>' size=50></td>
	</tr>
	</tbody>
	</table>
	</form>
	</body>
	
</html>