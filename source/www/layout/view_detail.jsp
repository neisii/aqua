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
	String startdate = null;
	String enddate = null;
	String sort = null;
	String cusid = null;
/* 	String cuspass =  null; */
	String cusname = null;
	String cusphone = null;
	String cusemail = null;
	String aquaaddr = null;
	String camurl = null;
	String tanksize = null;
	String heater = null;
	String filter1 = null;
	String filter2 = null;

	try{
		Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/neisii";
		String dbUser = "neisii";
		String dbPass = "nenser32!@";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		
		try{
			rs = stmt.executeQuery("select * from member where uid='" +id+ "'");
			if(rs != null){
				while(rs.next()) {
					startdate = rs.getString("usdate");
					enddate = rs.getString("uedate");
					sort = rs.getString("usort");
					cusid = rs.getString("uid");
					cusname = rs.getString("uname");
					cusphone = rs.getString("uphone");
					cusemail = rs.getString("uemail");
					aquaaddr = rs.getString("uaquaaddr");
					camurl = rs.getString("uaquaurl");
					tanksize = rs.getString("uaquasize");
					heater = rs.getString("uheater");
					filter1 = rs.getString("ufilter1");
					filter2 = rs.getString("ufilter2");
				}
				if(cusid != null){
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QUA 어항 원격 관리 시스템: [<%=cusname%>님의 수조 정보]</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<link rel="stylesheet" href="../css/table.css" type="text/css" />
<!-- This goes in the document HEAD so IE7 and IE8 don't cry -->
	<!--[if lt IE 9]>
	<style type="text/css">
		table.gradienttable th {
			filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d5e3e4', endColorstr='#b3c8cc',GradientType=0 );
			position: relative;
			z-index: -1;
		}
		table.gradienttable td {
			filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ebecda', endColorstr='#ceceb7',GradientType=0 );
			position: relative;
			z-index: -1;
		}
	</style>
	<![endif]-->
</head>
<body>

<form method="post" action="edit_this.jsp?id=<%=id%>">
	<table class="gradienttable" width="100%">
	<!-- 계약정보 시작 -->
	<tr><th colspan="2">계약 정보</th></tr>
	<tr><td width="100px" align="center">
	계약 날짜
	</td>
	<td><%=startdate%> ~ <%=enddate%></td></tr>
	
	<tr><td width="100px" align="center">
	분류
	</td>
	<td><%=sort%></td></tr>
	
	<tr><td width="100px" align="center">
	고객명
	</td>
	<td><%=cusname%></td></tr>
	
	<tr><td rowspan="3" width="100px" align="center">
	연락처
	</td>
	<tr>
	<td>전화번호 <%=cusphone%></td></tr>
	<tr>
	<td>E-mail <%=cusemail%></td></tr>
	
	<tr><td width="100px" align="center">주소</td>
	<td><%=aquaaddr%></td></tr>
	
	<!-- 계약정보 끝, 수조정보 시작 -->
	<tr><th colspan="2">수조 정보</tr>
	<tr><td width="100px" align="center">
	수조 크기
	</td>
	<td><%=tanksize%>cm</td></tr>
	
	<tr><td width="100px" align="center">
	히터 종류
	</td>
	<td> <%=heater%>w(와트)</td></tr>
	
	<tr><td width="100px" align="center">
	여과기 종류
	</td>
	<td><%=filter1%> <%=filter2%></td></tr>
	<!-- 수조정보 끝, 동영상 시작 -->
	<tr><th colspan="2" align="center">수조 영상</th></tr>
	<tr><td colspan="2" align="center">
				<video width="400" height="320" controls autoplay preload>
				  <source src="http://<%=camurl%>"></source>
				  비디오 태그를 지원하지 않는 브라우저입니다.<br>
				  Chrome, Opera 또는 Firefox 브라우저를 이용해주세요.<br>
				</video>
				<br><br>
				실시간 동영상 특성상 데이터를 로드하는데 시간이 걸릴 수 있습니다.
				
				<!-- 동영상 끝 -->
	</td></tr>		
	<tr> <td colspan="2" style="text-align:center;">
	<input type="submit" value="정보 수정" name="modify" style="width:150px; height:50px" />
	</td> </tr>
	</table>
	
<%
				}else{
					out.print("<script>"+"alert('해당 회원이 없습니다.'+'"+id+"'); close();"+"</script>");
				}
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch(Exception e){
			out.print("1  "+e);
		}
	} catch(Exception e){
		out.println(e);
	}
%>

</form>
</body>
</html>