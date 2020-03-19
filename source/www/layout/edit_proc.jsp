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
<title>고객 정보 수정 중....</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8"); //Set encoding
	String startdate = request.getParameter("startdate");
	String enddate = request.getParameter("enddate");
	String sort = request.getParameter("sort");
	String cusid = request.getParameter("cusid");
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
	Statement stmt = null;
	
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/neisii";
		String dbUser = "neisii";
		String dbPass = "nenser32!@";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		String query = "update member set usdate='"+startdate+"', uedate='"+enddate+"', usort='"+sort+"', uname='"+cusname+"', uphone='"+cusphone+"', uemail='"+cusemail+"', uaquaaddr='"+aquaaddr+"', uaquaurl='"+camurl+"', uaquasize='"+tanksize+"', uheater='"+heater+"', ufilter1='"+filter1+"', ufilter2='"+filter2+"' where uid='"+cusid+"'";
		//시작일, 종료일, 분류, 아이디, 고객명, 전화번호, 이메일, 주소, 카메라url, 수조 크기, 히터, 여과기1, 여과기2
		stmt.executeUpdate(query);
		stmt.close();
		conn.close();
	} catch (Exception e) {
		out.println(e);
	}
	/* out.print("<script>"+"alert('고객 정보가 추가되었습니다.');"+"</script>"); */
	out.print("<script>"+"alert('고객 정보가 수정되었습니다.'); self.location.href='view_detail.jsp?id="+cusid+"';"+"</script>");
%>

</body>
</html>