<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>忘记密码</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
</head>

<body>
	<%
session.invalidate();
	%>
  <div class="content">
     <div class="for-liucheng">
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liutextbox">
       <div class="liutext for-cur"><em>1</em><br /><strong>填写账户名</strong></div>
       <div class="liutext for-cur"><em>2</em><br /><strong>验证身份</strong></div>
       <div class="liutext for-cur"><em>3</em><br /><strong>设置新密码</strong></div>
       <div class="liutext for-cur"><em>4</em><br /><strong>完成</strong></div>
      </div>
     </div><!--for-liucheng/-->
      <div class="successs">
       <h3>恭喜您，修改成功！</h3>
      </div>
      <br>
	<center>
		<h2>
			${message}<br>
			注意!!页面将在<span id="num" style="display:inline;color:red">3</span>秒后跳转至主页
		</h2>
	</center>
      
   </div><!--web-width/-->
  </div><!--content/-->
 <script type="text/javascript">

	 var i=3;
	 var num=document.getElementById("num");
	 	 function getTime(){
		 num.innerHTML--;
			
			if(num.innerHTML<=0){
			location.href="login.jsp";
				}
			}

	setInterval("getTime()",1000);
	//var x=setTimeout('getTime()',1000)//1000毫秒=1秒
	//window.οnlοad=getTime;//开始执行倒计时
 
 
 </script>
</body>

</html>
