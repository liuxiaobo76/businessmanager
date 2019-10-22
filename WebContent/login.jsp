<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>天天生鲜-登录</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/register.js"></script>
</head>
<body>
	<div class="login_top clearfix">
		<a href="index.html" class="login_logo"><img
			src="images/logo02.png"></a>
	</div>

	<div class="login_form_bg">
		<div class="login_form_wrap clearfix">
			<div class="login_banner fl"></div>
			<div class="slogan fl">日夜兼程 · 急速送达</div>
			<div class="login_form fr">
				<div class="login_title clearfix">
					<h1>用户登录</h1>
					<a href="register.jsp">立即注册</a>
				</div>
				<div class="form_input">
					<form action="DoLogin" method="post">
						<input type="text" name="username" class="name_input"
							placeholder="请输入用户名">
						<div class="user_error">输入错误</div>
						<input type="password" name="pwd" class="pass_input"
							placeholder="请输入密码">
						<div class="pwd_error">输入错误</div>
						<div class="more_input clearfix">
							<input type="checkbox" name=""> <label>记住用户名</label> <a
								href="#">忘记密码</a>
						</div>
						<input type="submit" name="" value="登录" class="input_submit">
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="footer no-mp">
		<div class="foot_link">
			<a href="#">关于我们</a> <span>|</span> <a href="#">联系我们</a> <span>|</span>
			<a href="#">招聘人才</a> <span>|</span> <a href="#">友情链接</a>
		</div>
		<p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
		<p>电话：010-****888 京ICP备*******8号</p>
	</div>
	<script type="text/javascript">
		$(function() {

			var error_name = false;
			var error_password = false;
			$(".name_input").blur(function() {
				check_user_name();
			});

			$(".pass_input").blur(function() {
				check_pwd();
			});

			$('#cpwd').blur(function() {
				check_cpwd();
			});

			$('#email').blur(function() {
				check_email();
			});
				
			

			function check_user_name() {
				var len = $(".name_input").val();
				if (len=="") {
					$(".name_input").next().html('请输入用户名')
					$(".name_input").next().show();
					error_name = true;
				} else {
					$(".name_input").next().hide();
					error_name = false;
				}
			}

			function check_pwd() {
				var len = $(".pass_input").val().length;
				if (len<6||len>20) {
					$(".pass_input").next().html('密码最少6位，最长20位')
					$(".pass_input").next().show();
					error_password = true;
				} else {
					$(".pass_input").next().hide();
					error_password = false;
				}
			}
			
			

			$("form").submit(function() {
						 var user_pwd_error=false;
				var pwd=$(".pass_input").val();
				var name=$(".name_input").val();
				if (pwd==""&name=="") {
					error_name = true;
					$(".pass_input").next().html('密码最少6位，最长20位')
					$(".pass_input").next().show();
					error_password = true;
					$(".name_input").next().html('请输入用户名')
					$(".name_input").next().show();
					return false;
				}else{	
					return true;
					 $("form").submit();
					
				}
				
			});

		})
	</script>
</body>
</html>