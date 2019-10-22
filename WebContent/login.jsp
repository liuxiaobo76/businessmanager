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
<script src="js/jquery.min.js"></script>
<script src="js/jq-slideVerify.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="css/jquery.slider.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.slider.min.js"></script>
<style>
        #parent {
            /*background: url('yourimage') no-repeat;*/
            width: 120px;
            height: 30px;
            overflow: hidden;
            background-color: #eeeeee;
        }

        #parent select {
            border: none;
            padding-left: 10px;
            width: 120px;
            height: 100%;
            -webkit-appearance: none;   /* Safari 和 Chrome */
            -moz-appearance: none;   /* Firefox */
            background: transparent;
        }
       
    </style>
</head>
<body>
	<div class="login_top clearfix">
		<a href="DoIndex" class="login_logo"><img
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
					<form >
						<input type="text" name="username" class="name_input"
							placeholder="请输入用户名">
						<div class="user_error">输入错误</div>
						<input type="password" name="pwd" class="pass_input"
							placeholder="请输入密码">
						<div class="pwd_error">输入错误</div>
						<div class="more_input clearfix">
							<input type="checkbox" name=""> <label>记住用户名</label> <a
								href="Demo.jsp">忘记密码</a>
						</div>
						<input type="submit"  >
						<div id="slider2" class="slider" style="position:absolute;left:0;top:180px;"></div>
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
			var flag = false;
			$(".name_input").blur(function() {
				check_user_name();
			});

			$(".pass_input").blur(function() {
				check_pwd();
			});
			
			
			
			

			function check_user_name() {
				var len = $(".name_input").val();
				if (len=="") {
					$(".name_input").next().html('请输入用户名')
					$(".name_input").next().show();
					error_name = true;
					$("#slider2").slider("restore");
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
					$("#slider2").slider("restore");
				} else {
					$(".pass_input").next().hide();
					error_password = false;
					
					
				}
			}
			function submit() {
				check_user_name();
				check_pwd();
				if (error_name==false&error_password==false) {
					var name = $(".name_input").val();
					var pwd = $(".pass_input").val();
					$.post("DoLogin","opr=dologin&name="+name+"&pwd="+pwd,function(data){
						if (data=="false") {
							alert(' 密码或账号错误！！！！');
							$("#slider2").slider("restore");
						}else{
							$(".pass_input").next().hide();
							error_password = false;
							location.href="DoIndex";
					return true;
						}
					})	 
				}else{	
					$("#slider2").slider("restore");
					return false;
				
				
				}
			}
			

		
				$("#slider2").slider({
					width: 307, // width
					height: 40, // height
					sliderBg: "rgb(134, 134, 131)", // 滑块背景颜色
					color: "#fff", // 文字颜色
					fontSize: 14, // 文字大小
					bgColor: "#33CC00", // 背景颜色
					textMsg: "按住滑块拖拽进行登录", // 提示文字
					successMsg: "正在登录....", // 验证成功提示文字
					successColor: "red", // 滑块验证成功提示文字颜色
					time: 400, // 返回时间
					callback: function(result) { // 回调函数，true(成功),false(失败)
					
						if (result=true) {
							submit();
						}
					
					}
				});

		})
	</script>
</body>
</html>