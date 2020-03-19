<%@page import="org.eclipse.jdt.internal.compiler.ast.FalseLiteral"%>
<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String uname = null;
	String id = null;

	try{
		Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/neisii";
		String dbUser = "neisii";
		String dbPass = "nenser32!@";

		String query = "select * from member where not uid='admin' order by uname";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QUA 어항 원격 관리 시스템: 고객 목록</title>
<link rel="stylesheet" href="../css/Nested_Side_Bar_Menu.css" type="text/css" />
<script type='text/javascript' src='../js/Nested_Side_Bar_Menu.js'></script>
</head>
<body>
<div class="sidebarmenu">
<ul id="sidebarmenu1">
		<%
		try{
			rs = stmt.executeQuery(query);
			if(rs != null){

				while(rs.next()) {
					uname = rs.getString("uname");
					id = rs.getString("uid");

%>
	<li style="text-align: center;"><a href="#"><%=uname%></a>
	  <ul>
	  <li><a href="view_detail.jsp?id=<%=id%>" target="frame">고객 정보</a></li>
	  <li><a href="view_control.jsp?id=<%=id%>" target="frame">어항 관리</a></li>
	  </ul>
	</li>
<%
				}
			}else{
%>
				<p align="center" colspan="5">회원 목록이 존재하지 않습니다.</p>
<%
			}
%>
<!-- 2단 메뉴
	<li><a href="#">Folder 2</a>
	  <ul>
	  <li><a href="#">Sub Item 2.1</a></li>
	  <li><a href="#">Folder 2.1 &gt;</a>
	    <ul>
	    <li><a href="#">Sub Item 2.1.1</a></li>
	    <li><a href="#">Sub Item 2.1.2</a></li>
	    <li><a href="#">Sub Item 2.1.3</a></li>
	    <li><a href="#">Sub Item 2.1.4</a></li>
	    </ul>
	  </li>
	</ul>
	</li> -->
</ul>
</div>
	
</body>
</html>
<%
			rs.close();
			stmt.close();
			conn.close();
		}catch(Exception e){
			out.print(" ---회원 목록 조회 실패!----- "+e);
		}
	} catch(Exception e){
		out.println(e);
	}
%>