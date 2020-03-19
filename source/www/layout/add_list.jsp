<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QUA 어항 원격 관리 시스템: 고객 정보 추가</title>
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

<form method="post" action="add_list_proc.jsp">
<table class="gradienttable" width="100%">
<!-- 계약정보 시작 -->
<tr><th colspan="2">계약 정보</th></tr>
<tr><td>계약 날짜</td>
<td>
<input type="date" min="1999-07-01" max="2099-12-31" step="1" name="startdate">부터
<input type="date" min="1999-07-01" max="2099-12-31" step="1" name="enddate">까지
</td></tr>

<tr><td>분류</td>
<td>
<select name="sort" size="1"> <!-- 몇 개씩 보기 선택 -->
    <option value="개인">개인</option>
    <option value="기업">기업</option>
</select>
</td></tr>

<tr><td>아이디</td>
<td><input value="" name="cusid" size="20" placeholder="영문 숫자 4자-10자"/>
</td></tr>

<tr><td>고객명</td>
<td>
<input value="" type="text" name="cusname" size="20"/>
</td></tr>

<tr><td rowspan="3">연락처</td>
<tr>
<td>
전화번호 <input value="" type="text" name="cusphone" size="30" placeholder="예)010-1234-5678"/>
</td></tr>
<tr>
<td>
E-mail <input value="" type="text" name="cusemail" size="30" placeholder="예)abc@abcd.com"/>
</td></tr>

<tr><td>주소</td>
<td>
<input value="" type="text" name="aquaaddr" size="40"/>
</td></tr>

<tr><td>카메라URL</td>
<td>
<input value="" type="text" name="camurl" size="40" placeholder="http:// 제외하고 입력"/>
</td></tr>
<!-- 계약정보 끝, 수조정보 시작 -->
<tr><th colspan="2">수조 정보</th></tr>
<tr><td>수조 크기</td>
<td>
<input value="" type="text" name="tanksize" size="20" placeholder="가로*세로*높이"/>cm
</td></tr>

<tr><td>히터 종류</td>
<td>
<input value="" type="text" name="heater" size="10" placeholder="예)100"/>w(와트)
</td></tr>

<tr><td>여과기 종류</td>
<td>
<select name="filter1" size="1">
    <option value="상면">상면</option>
    <option value="측면">측면</option>
    <option value="저면">저면</option>
    <option value="배면">배면</option>
    <option value="외부">외부</option>
    <option value="걸이식">걸이식</option>
    <option value="스펀지">스펀지</option>
</select>
 <input value="" type="text" name="filter2" size="20" placeholder="회사명 모델명"/>
</td></tr>
<!-- 수조정보 끝 -->
<tr><td align="center" colspan="2">
<input class="submit" type="submit" value="저장" style="width:150px; height:50px" />
</td></tr>
</table>
</form>

</body>
</html>