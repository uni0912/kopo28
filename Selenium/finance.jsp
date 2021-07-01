<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NaverFinanceTop30</title>
<style>
    table.type10 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin: 20px 10px;
}
table.type10 thead th :nth-child(1) {
  width: 30px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: lightgray;
  margin: 20px 10px;
}
table.type10 thead th :nth-child(2) {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: lightgray;
  margin: 20px 10px;
}
table.type10 thead th {
  width: 100px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: lightgray;
  margin: 20px 10px;
}
table.type10 tbody th {
  width: 30px;
  padding: 10px;
}

table.type10 td {
  
  padding: 10px;
  text-align: right;
  vertical-align: top;
}
table.type10 .even {
  background: #fdf3f5;
}
</style>
</head>
<body>

    <h1>Naver Finance Top30</h1>
    <table class="type10">
        <thead>
            <tr >
                <th scope="cols">순위</th>
                <th scope="cols">종목명</th>
                <th scope="cols">검색비율</th>
                <th scope="cols">현재가</th>
                <th scope="cols">전일비</th>
                <th scope="cols">등락률</th>
                <th scope="cols">거래량</th>
                <th scope="cols">시가</th>
                <th scope="cols">고가</th>
                <th scope="cols">저가</th>
                <th scope="cols">PER</th>
                <th scope="cols">ROE</th>
            </tr>
        </thead>
        <tbody>
    <%    
    Class.forName("com.mysql.cj.jdbc.Driver"); 
    Connection conn=DriverManager.getConnection("jdbc:mysql://192.168.23.73/kopoctc", "root" , "kopoctc" ); 
    Statement stmt=conn.createStatement(); 
    ResultSet rset = stmt.executeQuery("select * from finance where date like '2021-07-01%';");
    
    while (rset.next()) {        
        String upDown = "";
        String upDown_percent = "";
        if (rset.getString(6).contains("+")) {
            upDown = "<td style='color: red;'>▲"+rset.getInt(5)+"</td>";
            upDown_percent = "<td style='color: red;'>"+rset.getString(6)+"</td>";
        } else {
            upDown = "<td style='color: blue;'>▼"+rset.getInt(5)+"</td>";
            upDown_percent = "<td style='color: blue;'>"+rset.getString(6)+"</td>";
        }
        out.println("<tr><th scope='row'>"+rset.getInt(1)+"</th>");
        out.println("<th scope='row'><a href='"+rset.getString(14)+"'>"+rset.getString(2)+"</a></th>");
        out.println("<td>"+rset.getString(3)+"</td>");
        out.println("<td>"+rset.getInt(4)+"</td>");
        out.println(upDown);
        out.println(upDown_percent);
        out.println("<td>"+rset.getInt(7)+"</td>");
        out.println("<td>"+rset.getInt(8)+"</td>");
        out.println("<td>"+rset.getInt(9)+"</td>");
        out.println("<td>"+rset.getInt(10)+"</td>");
        out.println("<td>"+rset.getInt(11)+"</td>");
        out.println("<td>"+rset.getInt(12)+"</td></tr>");
        
        
    }
        %>
    </tbody>
    </table>
</body>
</html>