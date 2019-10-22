<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>忘记密码</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.8.3-min.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
</head>
<style>
#error_cpwd,#error_pwd{
	display:none;
	color:red;
	width: 350px;
	height: 40px;
	float: right
	
	}
	#cpwd{
	margin-top: 17px; 
	}
	.subtijiao{
	margin-top:33px;
	float: right;
	width: 345px;
	
	
		}
	
</style>
<body>
	<%
	session.removeAttribute("dx");
	String dx=request.getParameter("dxflag");
	if(dx!=null&&dx.equals("false")){
		out.print("<script>location.href='Demo.jsp'</script>");
	}else if(dx==null){
		out.print("<script>location.href='Demo.jsp'</script>");
	}
	%>

	<div class="content">
		<div class="web-width">
			<div class="for-liucheng">
				<div class="liulist for-cur"></div>
				<div class="liulist for-cur"></div>
				<div class="liulist for-cur"></div>
				<div class="liulist"></div>
				<div class="liutextbox">
					<div class="liutext for-cur">
						<em>1</em><br />
						<strong>填写账户名</strong>
					</div>
					<div class="liutext for-cur">
						<em>2</em><br />
						<strong>验证身份</strong>
					</div>
					<div class="liutext for-cur">
						<em>3</em><br />
						<strong>设置新密码</strong>
					</div>
					<div class="liutext">
						<em>4</em><br />
						<strong>完成</strong>
					</div>
				</div>
			</div>
			<!--for-liucheng/-->
			<form action="Doresetting" method="post" class="forget-pwd">
				<dl>
					<dt>新密码：</dt>
					<dd>
						<input type="password" name='pwd' id='pwd' /><div class="clears" id=error_pwd>1231231</div>
					</dd>
					
				</dl>
				<dl>
					<dt>确认密码：</dt>
					<dd>
						<input type="password" name='cpwd' id='cpwd'/><div class="clears" id=error_cpwd>123131</div>
					</dd>
					
				</dl>
				<div class="subtijiao">
					<input type="submit" value="提交" name='sub'/>
				</div>
			</form>
			<!--forget-pwd/-->
		</div>
		<!--web-width/-->
	</div>
	<!--content/-->
</body>
<script type="text/javascript">
	var phone = "${phone}"
	if (phone == "") {
		location.href = 'Demo.jsp';
	}
	$(function() {
		var error_password = false;
		var error_check_password = false;
		//第一次密码
		$('#pwd').blur(function() {
			check_pwd();
		});
		//确认密码
		$('#cpwd').blur(function() {
			check_cpwd();
		});
		
		
		
		
		function check_pwd() {
			var len = $('#pwd').val().length;
	if (len<=0) {
	$('#error_pwd').html('请输入密码')
	$('#error_pwd').show();
	error_password = true;
	}
		else if (len<6||len>20) {
				$('#error_pwd').html('密码最少6位，最长20位')
				$('#error_pwd').show();
				error_password = true;
			} else {
				$('#error_pwd').hide();
				error_password = false;
			}
		}

		function check_cpwd() {
			var pass = $('#pwd').val();
			var cpass = $('#cpwd').val();
			if (pass != cpass) {
				$('#error_cpwd').html('两次输入的密码不一致')
				$('#error_cpwd').show();
				error_check_password = true;
			} else {
				$('#error_cpwd').hide();
				error_check_password = false;
				return false;
			}
		}
		$("[name=sub]").submit(function() {
			check_cpwd();
			check_pwd();
			if (error_check_password=false&error_password==false) {
				return true;
			}else{
				return false;
			}
		})
	})
</script>
</html>
