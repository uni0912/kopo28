<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>

<%
	String cmt = request.getParameter("searchid");

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.73/kopoctc",                  
			"root" , "kopoctc");
	Statement stmt = conn.createStatement();

	String name="", studentid="", kor="", eng="", mat="";

	if (cmt.length()==0) {
		cmt="0";
	}
	ResultSet rset = stmt.executeQuery("select * from examtable where studentid =" +cmt+";");

	name = "해당학번없음";
	while (rset.next()) {
		name= rset.getString(1);
		studentid=rset.getString(2);
		kor=rset.getString(3);
		eng=rset.getString(4);
		mat=rset.getString(5);

	}

	rset.close();		 
	stmt.close();
	conn.close();		
%>

<html>
	<head>
	<meta charset="utf-8">
	
	<h2 style="color:MediumPurple">성적 조회후 정정/삭제</h2>
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
	<form method=post action="showREC.jsp">
		<table>
			<thead>
		<tr>
		<th width=150>조회할 학번</th>
		<td width=100><input type='number' name="searchid" required="required" autocomplete='off' size=30> </td>
		<td width=100><input type="submit" value="조회"></td>
		</tr>
		</thead>
		</table>
	</form>
	
	<form method=post name="frm">
	<table width=500 class="type07">
		<tbody>
	<tr>
	<th width=100 align=center>이름</th>
	<td><input type="text" required="required" autocomplete='off' maxlength=10 onpaste="return false;" name="name" value="<%=name%>" onKeypress="if(!(event.keyCode <47 && event.keyCode>58))event.returnValue=false;"></td>
	</tr>
	<tr>
	<th width=100 align=center>학번</th>
	<td><input type="text" name="studentid" value="<%=studentid%>" size=50 readonly></td>
	</tr>
	<tr>
	<th width=100 align=center>국어</th>
	<td><input type='number' min='0' max='100' name="kor" value="<%=kor%>" size=50></td>
	</tr>
	<tr>
	<th width=100 align=center>영어</th>
	<td><input type='number' min='0' max='100' name="eng" value="<%=eng%>" size=50></td>
	</tr>
	<tr>
	<th width=100 align=center>수학</th>
	<td><input type='number' min='0' max='100' name="mat" value="<%=mat%>" size=50></td>
	</tr>
</tbody>
	</table>
	<table>
	<tr>
	<td><input type="submit" value="수정" formaction="updateDB.jsp"></td>
	<td><input type="submit" value="삭제" formaction="deleteDB.jsp"></td>
	</tr>
	</table>
	</form>
	</body>
</html>