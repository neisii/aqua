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
<title>제어 정보 수정 중</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8"); //Set encoding
	
	//변수
	String id = request.getParameter("id");
	String chked_l = request.getParameter("chked-l"); //조명 on off
	String chked_h = request.getParameter("chked-h"); //히터
	String chked_c = request.getParameter("chked-c"); //쿨러
	String cltimes = request.getParameter("ltimes"); // 조명 시작시간
	String cltimee = request.getParameter("ltimee"); //조명 종료시간
	double chtemp = Double.parseDouble(request.getParameter("htemp")); //히터 작동온도
	double cctemp = Double.parseDouble(request.getParameter("ctemp")); //쿨러 작동온도
	
	String option1 = request.getParameter("option1"); //옵션 체크
	String option2 = request.getParameter("option2"); //옵션 체크
	String light_option = "no";
	String hc_option = "no";
	
	if("light".equals(option1)){ //
		light_option = "yes";
	}else{
		light_option = "no";
	}
	if("hc".equals(option2)){
		hc_option = "yes";
	}else{
		hc_option = "no";
	}
	//1. JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = null;
	Statement stmt = null;
	
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/neisii";
		String dbUser = "neisii";
		String dbPass = "nenser32!@";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();

		String qu = "update "+id+"_c set chlight ='"+chked_l+"', chheat ='"+chked_h+"', chcool ='"+chked_c+"', cltimes ='"+cltimes+"', cltimee ='"+cltimee+"', chtemp ='"+chtemp+"', cctemp ='"+cctemp+"', ck1 ='"+light_option+"', ck2 ='"+hc_option+"'";
		stmt.executeUpdate(qu);
		//컨트롤 정보 업데이트
		
		stmt.close();
		conn.close();
	} catch (Exception e) {
		out.println(e+" "+id+" "+chked_l+" "+chked_h+" "+chked_c+" "+cltimes+" "+cltimee+" "+chtemp+" "+cctemp+"");
	}

/* 	out.print("<script>"+"alert('"+chked_l+" "+chked_h+" "+chked_c+" "+cltimes+"(시작) "+cltimee+"(종료) "+chtemp+"(히터) "+cctemp+"(쿨러) 제어 상태가 변경되었습니다.'); self.close(); self.location.href='control.jsp?id="+id+"';"+"</script>");
 */	out.print("<script>"+"alert('제어 상태가 변경되었습니다.'); self.close(); self.location.href='view_control.jsp?id="+id+"';"+"</script>");

%>
</body>
</html>