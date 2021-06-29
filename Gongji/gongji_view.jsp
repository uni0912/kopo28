<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*, java.util.Date, java.text.*, java.util.TimeZone" %>

<%
TimeZone time = TimeZone.getTimeZone("Asia/Seoul");
Date date = new Date();
SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
sd.setTimeZone(time);
%>
<%
    Class.forName("com.mysql.cj.jdbc.Driver"); 
    Connection conn=DriverManager.getConnection("jdbc:mysql://192.168.23.73/kopoctc", "root" , "kopoctc" ); 
    Statement stmt=conn.createStatement(); 

    String id = request.getParameter( "key" );

    int boardid = 0, boardview = 0;
    String boardtitle="", boarddate="", boardcontent="";

        
    ResultSet rset=stmt.executeQuery("select * from gongji where id='"+id+"';"); 
          
		while (rset.next()) {
            boardid = rset.getInt(1);
            boardtitle = rset.getString(2);
            boardview = rset.getInt(3);
            boarddate = rset.getString(4);
            boardcontent = rset.getString(5);
            boardview++;
		}
       
    stmt.executeUpdate("update gongji set viewcnt='"+boardview+"' where id="+id+";");
        %>
<!DOCTYPE html>        
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script languate="JavaScript">
        function submitForm(mode) {
            if (mode == "write") {
                fm.action = "comment_write.jsp?key=INSERT";
            } else if (mode == "delete") {
                fm.action = "comment_write.jsp?key=DELETE";
            } else if (mode == "update") {
                fm.action = "comment_write.jsp?key=UPDATE";
            }
            fm.submit();
        }

        $(".delete").on("click", submitForm('delete'));
    </script>
    <style>
        h2, table {margin-left: 70px;}
        table {border-top:2px solid #252525;border-bottom:1px solid #ccc}
        table tbody th {text-align:left;background:#f7f7f7;color:#3b3a3a; width: 100px;}
        table tbody td {padding:15px 0 16px 16px;border-bottom:1px solid #ccc}
        table tbody td text {border-top:1px solid #ccc; border-bottom:1px solid #ccc;padding:45px 18px 45px 18px}
    </style>
    <img src="https://news.harvard.edu/wp-content/uploads/2020/03/Zoom_Background_002.jpg" alt="하버드도서관" style="margin-left: 40px;" width="1100px" height="300px">
</head>
<body>
    
    <h2>[ <%=boardid%> ]번 게시글</h2>
    <form method="POST" name="fmboard">
        <table>
            <tbody>
            <tr>
                <th>글 번호</th>
                <td><input type="hidden" name="id" value="<%=boardid%>" readonly><%=boardid%></td>
            </tr>
            <tr>
                <th>글 제목</th>
                <td><input type="hidden" name="boardtitle" value="<%=boardtitle%>" readonly><%=boardtitle%></td>
            </tr>
            <tr>
                <th>조회수</th>
                <td><input type="hidden" name="boardview" value="<%=boardview%>" readonly><%=boardview%></td>
            </tr>
            <tr>
                <th>등록일자</th>
                <td><input type="hidden" name="boarddate" value="<%=boarddate%>" readonly><%=boarddate%></td>
            </tr>      
        
            <tr>
                <th>내용</th>
                <td><textarea style="width: 500px; height: 250px;" name="content" cols="70" rows="600" readonly><%=boardcontent%></textarea></td>
            </tr>
        </tbody>
</table>
<table>
    <tr>
        <td width=500></td>
        <td><input type="button" value="목록" onclick="location.href='gongji_list.jsp?page=1'"></button></td>
        <td><input type="button" value="수정" onclick="location.href='gongji_update.jsp?key=<%=id%>'"></td>
    </tr>
</table>
</form>
<form method="POST" name="fm">
<table>

    <tr>
        <td><input type="hidden" name="boardid" value="<%=boardid%>">댓글</td>
        <td><input type="text" name="commentcontent"></td>
        <td><button onclick="submitForm('write')">댓글입력</button></td>
    </tr>
    </table>
    
    <table>
    <%

        rset = stmt.executeQuery("select * from comment where boardid = '"+id+"';");

        while (rset.next()) {
            
            out.println("<tr>");
            out.println("<td><input type=hidden name=boardid value="+rset.getInt(1)+"><img src='https://image.flaticon.com/icons/png/512/591/591866.png' width='20px'></td>");
            out.println("<td><input type=hidden name=commentid value="+rset.getInt(2)+"></td>");
            out.println("<td><input type=hidden name=newcommentcontent value="+rset.getString(3)+">"+rset.getString(3)+"</td>");
            out.println("<td><input type=hidden name=commentdate value="+rset.getString(4)+">"+rset.getString(4)+"</td>");
            out.println("<td><button class='update'>수정</button></td>");
            out.println("<td><button class='delete'>삭제</button></td>");
            out.println("</tr>");
            }
            rset.close();
            stmt.close();
            conn.close();
    %>
</table>
</form>
</body>
</html>