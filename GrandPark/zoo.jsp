<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
    body {
        background-color: lightyellow;
    }      
    h2, h3 {
        margin-left: 50px;
    }
    .ratio1{width: 500px;}
        .ratio1 li{float:left;position:relative;width:100px;height:250px;margin-right:2px;list-style:none}
        .ratio1 div{position:absolute;left:0;bottom:0;width:100px;background-color:pink;font-size:0}
        .ratio1 em{position:absolute;top:-20px;width:100px;font-size:12px;font-weight:bold;text-align:center}
        .ratio1 span.day{position:absolute;width:100px; bottom: -30px; font-size:12px;font-weight:bold;text-align:center}
      /* UI Object 세로 */
      .ratio{width: 3000px;}
        .ratio li{float:left;position:relative;width:30px;height:250px;margin-right:2px;list-style:none}
        .ratio div{position:absolute;left:0;bottom:0;width:30px;background-color: #c6e2ff;font-size:0}
        .ratio em{position:absolute;top:-20px;width:30px;font-size:12px;font-weight:bold;text-align:center}
        .ratio span.day{position:absolute;width:30px; bottom: -30px; font-size:12px;font-weight:bold;text-align:center}
        /* //UI Object */
</style>
</head>
<body>
    <div>
        <h2>2020년 1월~4월 서울대공원 입장객 통계</h2>
        <ul class="ratio1">
            <li><span class="day">1월~4월</span><div style="height:0px"><em>통계</em></div>날씨</li>
        <%    
    Class.forName("com.mysql.cj.jdbc.Driver"); 
    Connection conn=DriverManager.getConnection("jdbc:mysql://192.168.23.73/kopoctc", "root" , "kopoctc" ); 
    Statement stmt=conn.createStatement(); 

    ResultSet rset = stmt.executeQuery("select * from zoo order by sum_total desc limit 1;");
    while (rset.next()) {
        String weather = rset.getString(3);
        if (weather.equals("눈")){           
            weather = "<img src='weather_cold_snowflake_icon_128649.png' alt='눈' width=30px height=30px>";
        } else if (weather.equals("흐림")){
            weather = "<img src='sunny_weather_icon_152004.png' alt='흐림' width=30px height=30px>";
        } else if (weather.equals("구름 많음")){
            weather = "<img src='cloudy_weather_icon_152005.png' alt='구름 많음' width=30px height=30px>";
        } else if (weather.equals("맑음")){
            weather = "<img src='sun_weather_icon_152003.png' alt='맑음' width=30px height=30px>";
        } else if (weather.equals("비")){
            weather = "<img src='rain_weather_icon_151998.png' alt='비' width=30px height=30px>";
        }
        out.println("<li><span class='day'>"+rset.getString(1)+" "+rset.getString(2)+"</span><div style='height:"+rset.getInt(6)/100+"px'><em>"+rset.getInt(6)+" 명</em></div>MAX "+weather+"</li>");
    }

    rset = stmt.executeQuery("select * from zoo order by sum_total limit 1;");
    while (rset.next()) {
        String weather = rset.getString(3);
        if (weather.equals("눈")){           
            weather = "<img src='weather_cold_snowflake_icon_128649.png' alt='눈' width=30px height=30px>";
        } else if (weather.equals("흐림")){
            weather = "<img src='sunny_weather_icon_152004.png' alt='흐림' width=30px height=30px>";
        } else if (weather.equals("구름 많음")){
            weather = "<img src='cloudy_weather_icon_152005.png' alt='구름 많음' width=30px height=30px>";
        } else if (weather.equals("맑음")){
            weather = "<img src='sun_weather_icon_152003.png' alt='맑음' width=30px height=30px>";
        } else if (weather.equals("비")){
            weather = "<img src='rain_weather_icon_151998.png' alt='비' width=30px height=30px>";
        }
        out.println("<li><span class='day'>"+rset.getString(1)+" "+rset.getString(2)+"</span><div style='height:"+rset.getInt(6)/10+"px'><em>"+rset.getInt(6)+" 명</em></div>MIN "+weather+"</li>");
    }   
    
     out.println("</ul>");

    %>
    </div>
    <div>
        <table>
            <tr>
                <td><h3>1월~4월 누적 입장객 수 : </h3></td>
                
    <%
    rset = stmt.executeQuery("select sum(sum_total), sum(sum_total)/count(*) from zoo;");
    while (rset.next()) {        
        out.println("<td><h3>"+rset.getInt(1)+" 명</h3></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td><h3>1월~4월 일평균 입장객 수 : </h3></td>");
        out.println("<td><h3>"+rset.getInt(2)+" 명</h3></td>");
    }
    %>  
            </tr>
        </table>
    </div>
    <div style="float: left;">
    <h3 style="margin-top: 50px;">2020년 1월 일별 입장객</h3>

    <ul class="ratio">
        <li><span class="day">1월</span><div style="height:0px"><em>(명)</em></div>날씨</li>
    
    <%

    rset = stmt.executeQuery("select * from zoo where date like '2020-01%';");
    int cnt = 0;    
    while (rset.next()) {
        
        cnt++; //날짜 출력
        String weather = rset.getString(3);
        if (weather.equals("눈")){           
            weather = "<img src='weather_cold_snowflake_icon_128649.png' alt='눈' width=30px height=30px>";
        } else if (weather.equals("흐림")){
            weather = "<img src='sunny_weather_icon_152004.png' alt='흐림' width=30px height=30px>";
        } else if (weather.equals("구름 많음")){
            weather = "<img src='cloudy_weather_icon_152005.png' alt='구름 많음' width=30px height=30px>";
        } else if (weather.equals("맑음")){
            weather = "<img src='sun_weather_icon_152003.png' alt='맑음' width=30px height=30px>";
        } else if (weather.equals("비")){
            weather = "<img src='rain_weather_icon_151998.png' alt='비' width=30px height=30px>";
        }
        out.println("<li><span class='day'>"+cnt+"일 "+rset.getString(2)+"</span><div style='height:"+rset.getInt(6)/30+"px'><em>"+rset.getInt(6)+"</em></div>"+weather+"</li>");
    }
    
     out.println("</ul>");
    %>
</div>
<div style="float: left;">
    <h3 style="margin-top: 50px;">2020년 2월 일별 입장객</h3>

    <ul class="ratio">
        <li><span class="day">2월</span><div style="height:0px"><em>(명)</em></div>날씨</li>
    <%    

    rset = stmt.executeQuery("select * from zoo where date like '2020-02%';");
    cnt = 0;    
    while (rset.next()) {
        cnt++; //총 게시물 수
        String weather = rset.getString(3);
        if (weather.equals("눈")){           
            weather = "<img src='weather_cold_snowflake_icon_128649.png' alt='눈' width=30px height=30px>";
        } else if (weather.equals("흐림")){
            weather = "<img src='sunny_weather_icon_152004.png' alt='흐림' width=30px height=30px>";
        } else if (weather.equals("구름 많음")){
            weather = "<img src='cloudy_weather_icon_152005.png' alt='구름 많음' width=30px height=30px>";
        } else if (weather.equals("맑음")){
            weather = "<img src='sun_weather_icon_152003.png' alt='맑음' width=30px height=30px>";
        } else if (weather.equals("비")){
            weather = "<img src='rain_weather_icon_151998.png' alt='비' width=30px height=30px>";
        }
        out.println("<li><span class='day'>"+cnt+"일 "+rset.getString(2)+"</span><div style='height:"+rset.getInt(6)/30+"px'><em>"+rset.getInt(6)+"</em></div>"+weather+"</li>");
    }
     out.println("</ul>");
    %> 
</div>
<div style="float: left;">
    <h3 style="margin-top: 50px;">2020년 3월 일별 입장객</h3>

    <ul class="ratio">
        <li><span class="day">3월</span><div style="height:0px"><em>(명)</em></div>날씨</li>
    <%    

    rset = stmt.executeQuery("select * from zoo where date like '2020-03%';");
    cnt = 0;    
    while (rset.next()) {
        cnt++; //총 게시물 수
        String weather = rset.getString(3);
        if (weather.contains("눈")){           
            weather = "<img src='weather_cold_snowflake_icon_128649.png' alt='눈' width=30px height=30px>";
        } else if (weather.equals("흐림")){
            weather = "<img src='sunny_weather_icon_152004.png' alt='흐림' width=30px height=30px>";
        } else if (weather.equals("구름 많음")){
            weather = "<img src='cloudy_weather_icon_152005.png' alt='구름 많음' width=30px height=30px>";
        } else if (weather.equals("맑음")){
            weather = "<img src='sun_weather_icon_152003.png' alt='맑음' width=30px height=30px>";
        } else if (weather.equals("비")){
            weather = "<img src='rain_weather_icon_151998.png' alt='비' width=30px height=30px>";
        }
        out.println("<li><span class='day'>"+cnt+"일 "+rset.getString(2)+"</span><div style='height:"+rset.getInt(6)/50+"px'><em>"+rset.getInt(6)+"</em></div>"+weather+"</li>");
    }
     out.println("</ul>");
    %> 
</div> 
<div style="float: left;">
    <h3 style="margin-top: 50px;">2020년 4월 일별 입장객</h3>

    <ul class="ratio">
        <li><span class="day">4월</span><div style="height:0px"><em>(명)</em></div>날씨</li>
    <%    

    rset = stmt.executeQuery("select * from zoo where date like '2020-04%';");
    cnt = 0;    
    while (rset.next()) {
        cnt++; //총 게시물 수
        String weather = rset.getString(3);
        if (weather.contains("눈")){           
            weather = "<img src='weather_cold_snowflake_icon_128649.png' alt='눈' width=30px height=30px>";
        } else if (weather.equals("흐림")){
            weather = "<img src='sunny_weather_icon_152004.png' alt='흐림' width=30px height=30px>";
        } else if (weather.equals("구름 많음")){
            weather = "<img src='cloudy_weather_icon_152005.png' alt='구름 많음' width=30px height=30px>";
        } else if (weather.equals("맑음")){
            weather = "<img src='sun_weather_icon_152003.png' alt='맑음' width=30px height=30px>";
        } else if (weather.equals("비")){
            weather = "<img src='rain_weather_icon_151998.png' alt='비' width=30px height=30px>";
        }
        out.println("<li><span class='day'>"+cnt+"일 "+rset.getString(2)+"</span><div style='height:"+rset.getInt(6)/80+"px'><em>"+rset.getInt(6)+"</em></div>"+weather+"</li>");
    }
     out.println("</ul>");
    %> 
</div> 
</body>
</html>