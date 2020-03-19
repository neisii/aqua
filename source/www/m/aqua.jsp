<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sessionId = (String)session.getAttribute("loginedId");
boolean loginOn = sessionId == null ? false:true;
%> <!-- 로그인 여부 확인 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 해상도 별 크기 조절  -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<script type="text/javascript" language = "javascript"> 
window.addEventListener('load', function() {
setTimeout(scrollTo, 0, 0, 1);
}, false);
</script>
<!-- 해상도 별 크기 조절 끝 -->
<link rel="shortcut icon" href="./icons/favicon.ico" type="image/x-icon" />
<title>QUA 어항 원격 관리 시스템: 관리자 모드</title>
<link rel="stylesheet" href="../css/aqua_m.css" type="text/css" />
<link rel="stylesheet" href="../css/top_menu_bar.css" type="text/css" />
	<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
	<script type='text/javascript' src='../js/top_menu_jquery.js'></script>
<!--[if gte IE 9]>
  <style type="text/css">
    .gradient {
       filter: none;
    }
  </style>
<![endif]-->
  </head>
  <body>
    <div id="container">
      <div id="header">
        <h1>QUA 어항 원격 관리 시스템</h1>
      </div>  
<%
if(loginOn==true){
%>
      <div id="top-menu">
<div id='cssmenu'>
<ul>
   <li class='active'><a href='aqua.jsp' title="처음 페이지로" target="_self"><span>Home</span></a></li>
   <li><a href='about.jsp' title="어항원격관리시스템에 대해" target="frame"><span>About</span></a></li>
   <li><a href='add_list.jsp' title="고객 추가" target="frame"><span>Add</span></a></li>
   <!-- <li><a href='contact_us.jsp' title="연락주십시오." target="frame"><span>Contact</span></a></li> -->
   <li class='last'><a href='logout.jsp' title="로그아웃" onclick="if (confirm('로그아웃하시겠습니까?')) { location.href='logout.jsp'; } else { return false; }"><span>Logout</span></a></li>
</ul>
</div>
      </div>

      <div id="sidebar-left">
		<jsp:include page="view_list.jsp"/>
      </div>
<%
	}else{
%>
      <div id="top-menu">
			로그인 후 이용해주세요.
        </ul>
      </div>
      <div id="sidebar-left">
			로그인 후 이용해주세요.
      </div>
      <div id="content">
        <h2>어항 원격 관리 시스템</h2>
        <p>
			로그인 후 이용해주세요.<br>
			<a href="index.jsp"> 돌아가기 </a>
		</p>
	 </div>
<% } %>
      <div id="footer">
        <p>Copyright&copy;2014 TEAM.QUA All rights reserved.</p>
      </div>
    </div><!-- 컨테이너 종료 -->
  </body>
</html>