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
	
	String cusid = request.getParameter("id");
	String startdate = null;
	String enddate = null;
	String sort = null;
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
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QUA 어항 원격 관리 시스템: 고객 정보 수정</title>
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

<form method="post" action="edit_proc.jsp?id=<%=cusid%>">
<table class="gradienttable" width="100%">
<%

try{
	rs = stmt.executeQuery("select * from member where uid='" +cusid+ "'");
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
			filter1 = rs.getString("ufilter1");;
			filter2 = rs.getString("ufilter2");
		}
		if(cusid != null){
		%>
<!-- 계약정보 시작 -->
<tr><th colspan="2">계약 정보</th></tr>
<tr><td>계약 날짜</td>
<td>
<input type="date" min="1999-07-01" max="2099-12-31" step="1" name="startdate" value="<%=startdate%>">부터
<input type="date" min="1999-07-01" max="2099-12-31" step="1" name="enddate" value="<%=enddate%>">까지
</td></tr>

<tr><td>분류</td>
<td>
<select name="sort" size="1"> <!-- 몇 개씩 보기 선택 -->
    <option value="개인" <%if(sort.equals("개인")){%> selected<%}%>>개인</option>
    <option value="기업" <%if(sort.equals("기업")){%> selected<%}%>>기업</option>
</select>
</td></tr>

<tr><td>아이디</td>
<td><input value="<%=cusid%>" name="cusid" size="20" placeholder="영문 숫자 4자-10자" readonly="readonly"/>
</td></tr>

<tr><td>고객명</td>
<td>
<input value="<%=cusname%>" type="text" name="cusname" size="20"/>
</td></tr>

<tr><td rowspan="3">연락처</td>
<tr>
<td>
전화번호 <input value="<%=cusphone%>" type="text" name="cusphone" size="30" placeholder="예)010-1234-5678"/>
</td></tr>
<tr>
<td>
E-mail <input value="<%=cusemail%>" type="text" name="cusemail" size="30" placeholder="예)abc@abcd.com"/>
</td></tr>

<tr><td>주소</td>
<td>
<input value="<%=aquaaddr%>" type="text" name="aquaaddr" size="40"/>
</td></tr>

<tr><td>카메라URL</td>
<td>
<input value="<%=camurl%>" type="text" name="camurl" size="40" placeholder="http:// 제외하고 입력"/>
</td></tr>
<!-- 계약정보 끝, 수조정보 시작 -->
<tr><th colspan="2">수조 정보</th></tr>
<tr><td>수조 크기</td>
<td>
<input value="<%=tanksize%>" type="text" name="tanksize" size="20" placeholder="가로*세로*높이"/>cm
</td></tr>

<tr><td>히터 종류</td>
<td>
<input value="<%=heater%>" type="text" name="heater" size="10" placeholder="예)100"/>w(와트)
</td></tr>

<tr><td>여과기 종류</td>
<td>
<select name="filter1" size="1">
    <option value="상면" <%if(filter1.equals("상면")){%> selected<%}%>>상면</option>
    <option value="측면" <%if(filter1.equals("측면")){%> selected<%}%>>측면</option>
    <option value="저면" <%if(filter1.equals("저면")){%> selected<%}%>>저면</option>
    <option value="배면" <%if(filter1.equals("배면")){%> selected<%}%>>배면</option>
    <option value="외부" <%if(filter1.equals("외부")){%> selected<%}%>>외부</option>
    <option value="걸이식" <%if(filter1.equals("걸이식")){%> selected<%}%>>걸이식</option>
    <option value="스펀지" <%if(filter1.equals("스펀지")){%> selected<%}%>>스펀지</option>
</select>
 <input value="<%=filter2%>" type="text" name="filter2" size="20" placeholder="회사명 모델명 개수"/>
</td></tr>
<!-- 수조정보 끝 -->
<tr><td align="center" colspan="2">
<input class="submit" type="submit" value="저장" style="width:150px; height:50px" />
</td></tr>
</table>
<%
				}else{
					out.print("<script>"+"alert('수정할 정보가 없습니다.'+'"+cusid+"'); close();"+"</script>");
				}
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch(Exception e){
			out.print("editthis  "+e);
		}
	} catch(Exception e){
		out.println(e);
	}
%>

</form>
</body>
</html>