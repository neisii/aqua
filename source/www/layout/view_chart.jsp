<%@page import="java.text.Format"%>
<%@page import="java.io.*"%>
<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.Template"%>
<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String id = request.getParameter("id");
	double temper_t;
	String temper = null;
	String time = null;
	
	int year, month, day, hour, minute, second;

	try{
		Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/neisii";
		String dbUser = "neisii";
		String dbPass = "nenser32!@";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
			
		try{
			//온도 및 시간 데이터 가져오기
			rs = stmt.executeQuery("select * from "+id+"_t order by time asc"); //asc 오름차순 정렬(n++)
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QUA 어항 원격 관리 시스템: 온도 변화 그래프</title>
<!-- https://developers.google.com/chart/interactive/docs/gallery/annotationchart -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type='text/javascript'>
      google.load('visualization', '1.1', {'packages':['annotationchart']});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = new google.visualization.DataTable();
        /* 첫번째 그래프 */
        data.addColumn('datetime', '날짜');
        data.addColumn('number', '온도(℃))');
     /* data.addColumn('string', 'Kepler title');
        data.addColumn('string', 'Kepler text'); */
        /* 두번째 그래프 *//* 
        data.addColumn('number', 'Gliese 163 mission');
        data.addColumn('string', 'Gliese title');
        data.addColumn('string', 'Gliese text'); */
        data.addRows([
/*           [new Date(2014, 2, 15), 22, undefined, undefined], */
         <%
         while(rs.next()){
/* 				temper_t = Double.parseDouble(rs.getString("temperature"));
				temper = String.format("%.2f", temper_t); */
				temper = rs.getString("temperature");
				
				String str = rs.getString("time");
				year = Integer.parseInt(str.substring(0, 4)); //2014 년
				month = Integer.parseInt(str.substring(5, 7))-1; //05 월
				day = Integer.parseInt(str.substring(8, 10)); //28 일
				hour = Integer.parseInt(str.substring(11, 13)); //16 시
				minute = Integer.parseInt(str.substring(14, 16)); //18분 
				second = Integer.parseInt(str.substring(17, 19)); //14 초
				%>
          [new Date(<%=year%>,<%=month%>,<%=day%>,<%=hour%>,<%=minute%>,<%=second%>),<%=temper%>],
          <% }%>
        ]);

        var chart = new google.visualization.AnnotationChart(document.getElementById('chart_div'));
        
        var options = { //차트 옵션
           displayAnnotations: false, //우측 주석 삭제: false
          };

        chart.draw(data, options);
      }
    </script>
</head>
<body>
<div id="chart_div" style="width: 100%; height: 400px;"></div>
<%-- <br><%=year %>,<%=month %>,<%=day %>,<%=hour %>,<%=minute %>,<%=second %> --%>
</body>
 <%
			rs.close();
			stmt.close();
			conn.close();
		}catch(Exception e){
			out.print("1  "+e+ "     ");
			out.print("<script>"+"alert('해당 수조 데이터 테이블이 없습니다.'+'"+id+"');"+"</script>");
			
		}
	} catch(Exception e){
		out.println(e+" "+id);
	}
%>
</html>