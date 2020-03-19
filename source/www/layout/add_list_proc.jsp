<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입처리 중</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8"); //Set encoding
	String startdate = request.getParameter("startdate");
	String enddate = request.getParameter("enddate");
	String sort = request.getParameter("sort");
	String cusid = request.getParameter("cusid");
/* 	String cuspass = request.getParameter("cuspass"); */
	String cusname = request.getParameter("cusname");
	String cusphone = request.getParameter("cusphone");
	String cusemail = request.getParameter("cusemail");
	String aquaaddr = request.getParameter("aquaaddr");
	String camurl = request.getParameter("camurl");
	String tanksize = request.getParameter("tanksize");
	String heater = request.getParameter("heater");
	String filter1 = request.getParameter("filter1");
	String filter2 = request.getParameter("filter2");
	//POST로 signup.jsp로부터 입력받은 내용을 변수화

	//1. JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = null;
	Statement stmt, stmt2, stmt3, stmt3_3 = null;
	
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/neisii";
		String dbUser = "neisii";
		String dbPass = "nenser32!@";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		String query = "insert into member(usdate, uedate, usort, uid, uname, uphone, uemail, uaquaaddr, uaquaurl, uaquasize, uheater, ufilter1, ufilter2)value('"+startdate+"','"+enddate+"','"+sort+"','"+cusid+"','"+cusname+"','"+cusphone+"','"+cusemail+"','"+aquaaddr+"','"+camurl+"','"+tanksize+"','"+heater+"','"+filter1+"','"+filter2+"')";
		//시작일, 종료일, 분류, 아이디, 고객명, 전화번호, 이메일, 주소, 카메라url, 수조 크기, 히터, 여과기1, 여과기2
		stmt.executeUpdate(query);
		
		query = "create table "+cusid+"_t(temperature DOUBLE not null, time TIMESTAMP primary key not null)";
		//고객별 온도/기록 시간 데이터 테이블 생성
		stmt.executeUpdate(query);
		
		query = "insert into "+cusid+"_t(temperature, time) value('0', '1990-01-01 00:00:00')";
		//고객별 온도/기록 시간 데이터 테이블에 초기 값 저장
		stmt.executeUpdate(query);
		
		stmt = conn.createStatement();
		query = "create table "+cusid+"_c(chlight VARCHAR(10) primary key not null, chheat VARCHAR(10), chcool VARCHAR(10), cltimes VARCHAR(10), cltimee VARCHAR(10), chtemp DOUBLE, cctemp DOUBLE, ck1 VARCHAR(10), ck2 VARCHAR(10))";
		//고객별 제어 데이터 테이블 생성
		stmt.executeUpdate(query);
		
		query = "insert into "+cusid+"_c(chlight, chheat, chcool, cltimes, cltimee, chtemp, cctemp, ck1, ck2) value('off', 'off', 'off', '00:00:00', '00:00:00', '22', '27', 'no','no')";
		//생성된 고객별 제어 데이터 테이블에 초기 값 저장
		stmt.executeUpdate(query);
		
		stmt.close();
		
		conn.close();
	} catch (Exception e) {
		out.println("고객 정보 추가 실패"+e);
	}
	/* out.print("<script>"+"alert('고객 정보가 추가되었습니다.');"+"</script>"); */
	out.print("<script>"+"alert('고객 정보가 추가되었습니다.'); top.location.href='aqua.jsp';"+"</script>");
%>

</body>
</html>