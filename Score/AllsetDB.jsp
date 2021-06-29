<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@ page errorPage="Allset_error.jsp" %>

<html>
	<head>
	</head>
	<body bgcolor="Lavender" style="color:MediumPurple">		
		
		<%
		try{
		Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.73/kopoctc",                  
	                                       "root" , "kopoctc");
	    Statement stmt = conn.createStatement();
	    
	    stmt.execute( "INSERT INTO examtable VALUE ('나연', 209901, rand()*100, rand()*100, rand()*100);");
		stmt.execute( "INSERT INTO examtable VALUE ('정연', 209902, rand()*100, rand()*100, rand()*100);"); 
		stmt.execute( "INSERT INTO examtable VALUE ('모모', 209903, rand()*100, rand()*100, rand()*100);"); 
		stmt.execute( "INSERT INTO examtable VALUE ('사나', 209904, rand()*100, rand()*100, rand()*100);"); 
		stmt.execute( "INSERT INTO examtable VALUE ('지효', 209905, rand()*100, rand()*100, rand()*100);"); 
		stmt.execute( "INSERT INTO examtable VALUE ('미나', 209906, rand()*100, rand()*100, rand()*100);"); 
		stmt.execute( "INSERT INTO examtable VALUE ('다현', 209907, rand()*100, rand()*100, rand()*100);"); 
		stmt.execute( "INSERT INTO examtable VALUE ('채영', 209908, rand()*100, rand()*100, rand()*100);"); 
		stmt.execute( "INSERT INTO examtable VALUE ('쯔위', 209909, rand()*100, rand()*100, rand()*100);"); 
		 		 
	    stmt.close();
	    conn.close();	     
		%>
		<h1>실습테이터 입력 OK</h1>
		<%
		}catch (SQLSyntaxErrorException seE) {
         out.println("테이블이 존재하지 않습니다. 테이블 생성을 먼저 해주세요.");
		} catch (SQLIntegrityConstraintViolationException e2) {
         out.println("학번은 중복될 수 없습니다. 테이블을 삭제하고 다시 생성한 후 데이터를 입력하세요.");
		} catch (Exception e) {
         e.printStackTrace();
		} 

		%>

	</body>
</html>