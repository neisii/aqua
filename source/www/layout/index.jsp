<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="./icons/favicon.ico" type="image/x-icon" />
<title>QUA 어항 원격 관리 시스템: 로그인</title>
<link rel="stylesheet" href="../css/aqua.css" type="text/css" />
<link rel="stylesheet" href="../css/login.css" type="text/css" />
  </head>
  <body>
    <div id="container">
      <div id="header">
        <h1>QUA 어항 원격 관리 시스템</h1>
      </div>
      <div id="content-top">
      
		<form id="loginform" method="post" action="login_proc.jsp">
		<div class="login">
		   <input type="text" placeholder="Username" id="username" name="loginId" value="admin" />  
		  <input type="password" placeholder="password" id="password" name="loginPass" value="1234" />  
		  <!-- <a href="#" class="forgot">forgot password?</a> -->
		  <input type="submit" value="로그인">
		</div>
		<div class="shadow"></div>
		</form>
		
	 </div>
      <div id="footer">
        <p>Copyright&copy;2014 TEAM.QUA All rights reserved.</p>
      </div>
    </div>
  </body>
</html>