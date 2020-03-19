<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>
<!-- 현재 시간  -->
<%@ page import ="java.util.Date"%>
<%@ page import ="java.lang.System"%>
<%@ page import ="java.text.SimpleDateFormat"%>


<%		
	Connection conn = null;
	Statement stmt,stmt2 = null;
	ResultSet rs, rs2 = null;
	
	String id = request.getParameter("id"); //검색할 사용자 아이디
	String chlight = null; //조명 작동 여부
	String chheat = null; //히터 작동 여부
	String chcool =null; //쿨러 작동 여부
	String cltimes = null; //조명 작동 시작 시간
	String cltimee = null; //조명 작동 종료 시간
	String ck1 = null;
	String ck2 = null;
	double chtemp = 0; //히터 작동 온도 예 22도
	double cctemp = 0; //쿨러 작동 온도 예 27도
	double recenttemp = 0;	
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/neisii";
		String dbUser = "neisii";
		String dbPass = "nenser32!@";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		stmt2 = conn.createStatement();
		
		try{
			//최근 온도 데이터 가져오기
			rs = stmt.executeQuery("select * from "+id+"_t order by time desc limit 1");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>QUA 어항 원격 관리 시스템: </title>
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
<table class="gradienttable" width="100%">
<!-- <tr><th colspan="5" class="vv" height="40">&lt;<%=id%>님의 수조&gt;</th></tr> -->

<tr><th colspan="5" height="40">수온 변화</th></tr>
<tr><td colspan="5" align="center" style="padding: 5px;"><jsp:include page="./view_chart.jsp"></jsp:include></td></tr>
<%
			if(rs != null){
				while(rs.next()) {
					//최근 온도
					recenttemp = rs.getDouble("temperature");
					%>
<tr><th colspan="2" height="40">현재 온도</th><td colspan="3"><%=recenttemp %>℃</td></tr>

<% 
				}
			}
		rs.close(); stmt.close();
		}catch(Exception e){
			out.print(e+"최근 온도"+recenttemp+id+"_t");
		}
		
		try{
			rs2 = stmt2.executeQuery("select * from "+id+"_c");
			if(rs2 != null){
 				while(rs2.next()) {
					//작동 여부
					chlight = rs2.getString("chlight");
					chheat = rs2.getString("chheat");
					chcool = rs2.getString("chcool");
					//작동 시간(타이머)
					cltimes = rs2.getString("cltimes");
					cltimee = rs2.getString("cltimee");
					//작동 온도
					chtemp = rs2.getDouble("chtemp");
					cctemp = rs2.getDouble("cctemp");
					//옵션 체크
					ck1 = rs2.getString("ck1"); //타이머 작동 옵션
					ck2 = rs2.getString("ck2"); //히터 쿨러 작동 옵션 */
	
	%>
<form method="post" action="ctrl_this.jsp?id=<%=id%>">
<tr><th colspan="2" height="40">작동 상태</th><th colspan="3">옵션</th></tr>
<tr><td width="70px" align="center" bgcolor="#DCDC00">조명</td>
<td align="center"><!-- 조명 작동 상태 -->
<input type="radio" name="chked-l" value="on" <%if(chlight.equals("on")){%> checked="checked"<%}%>>On
<input type="radio" name="chked-l" value="off" <%if(chlight.equals("off")){%> checked="checked"<%}%>>Off</td>
<td align="center" width="90px">타이머</td>
<td><input type="time" value="<%=cltimes %>" name="ltimes">부터 <input type="time" value="<%=cltimee %>" name="ltimee">까지</td>
<td width="50px" align="center"><input type="checkbox" name="option1" value="light" <%if(ck1.equals("yes")){%> checked="checked"<%}%>/></td></tr>

<tr><td align="center" bgcolor="#DC0000">히터</td>
<td align="center"><!-- 히터 작동 상태 -->
<input type="radio" name="chked-h" value="on" <%if(chheat.equals("on")){%> checked="checked"<%}%>>On
<input type="radio" name="chked-h" value="off" <%if(chheat.equals("off")){%> checked="checked"<%}%>>Off</td>
<td align="center">작동 온도</td>
<td>섭씨 <input value="<%=chtemp%>" type="text" name="htemp" size="10"/>도 이하일 시 작동한다.</td>
<td rowspan="2" align="center"><input type="checkbox" name="option2" value="hc" <%if(ck2.equals("yes")){%> checked="checked"<%}%>/></td></tr>

<tr><td align="center" bgcolor="#0000DC">쿨러</td>
<td align="center"><!-- 쿨러 작동 상태 -->
<input type="radio" name="chked-c" value="on" <%if(chcool.equals("on")){%> checked="checked"<%}%>>On
<input type="radio" name="chked-c" value="off" <%if(chcool.equals("off")){%> checked="checked"<%}%>>Off</td>
<td align="center">작동 온도</td>
<td>섭씨 <input value="<%=cctemp%>" type="text" name="ctemp" size="10"/>도 이상일 시 작동한다.</td></tr>

<tr><td colspan="5" style="text-align:center;"><input type="submit" value="저장" name="modify" style="width:150px; height:50px" /></td></tr>
</table>

	
<%
 				}
			}
			rs2.close(); stmt2.close();
			conn.close();
		}catch(Exception e){
			out.print(id+"_c"+e);
		}
	}catch(Exception e){
		out.print("디비 커넥션 에러"+e);
	}
%>
</form>
</body>
</html>