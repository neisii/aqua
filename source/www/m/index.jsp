<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>QUA 어항 원격 관리 시스템: 로그인</title>
<link rel="stylesheet" href="../css/aqua_m.css" type="text/css" />
<link rel="stylesheet" href="../css/login.css" type="text/css" />
<!-- 그라디언트 -->
<script type="text/javascript">
window.onload = drawGradient;   
function drawGradient() {
    // Get the canvas element and specify a 2d drawing context.
    var context = document.getElementById("header").getContext("2d");
    // Create a linear gradient.
    var myGradient=context.createLinearGradient(0, 0, 300, 100);
    // Set the color stops.
    myGradient.addColorStop(0, "white");
    myGradient.addColorStop(1, "black");
    // Set the fill style to the gradient.
    context.fillStyle = myGradient;
    // Draw the rectangle.
    context.fillRect(0, 0, 200, 100);
}
</script>
<!-- 그라디언트 끝 -->
<!-- 주소창 숨기기 -->
<script type="text/javascript">
// 주소창 숨기기 아이폰인 경우
// 주소창 없애기
window.addEventListener('load', function(){
    document.body.style.height = (document.documentElement.clientHeight + 5) + 'px';
    window.scrollTo(0, 1);
}, false);
</script>
<!-- 주소창 숨기기  끝-->
  </head>
  <body>
    <div id="container">
      <div id="header">
        <h1 style="text-align: center;">QUA 어항 원격 관리 시스템</h1>
      </div>
      <div id="content-top">
      
		<form id="loginform" method="post" action="login_proc.jsp">
		<div class="login">
		   <input type="text" placeholder="Username" id="username" name="loginId">  
		  <input type="password" placeholder="password" id="password" name="loginPass">  
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