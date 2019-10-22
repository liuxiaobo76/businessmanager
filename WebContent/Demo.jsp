<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>忘记密码</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.slider.min.js"></script>
<link rel="stylesheet" href="css/jquery.slider.css" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.slider {
	margin : 10px;
	width: 380px;
	height: 40px;
	float: right
}
.user_error{
	display:none;
		color:red;
	width: 350px;
	height: 20px;
	float: right
	
}

</style>
<body>
	<div class="content">
		<div class="web-width">
			<div class="for-liucheng">
				<div class="liulist for-cur"></div>
				<div class="liulist"></div>
				<div class="liulist"></div>
				<div class="liulist"></div>
				<div class="liutextbox">
					<div class="liutext for-cur">
						<em>1</em><br />
						<strong>填写账户名</strong>
					</div>
					<div class="liutext">
						<em>2</em><br />
						<strong>验证身份</strong>
					</div>
					<div class="liutext">
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
			<form  class="forget-pwd">
				<dl>
					<dt>账户名：</dt>
					<dd>
						<input type="text" id=name />
					</dd>
					<div class="user_error">输入错误</div>
				</dl>

		<div id="slider2" class="slider"></div>
			</form>
			<!--forget-pwd/-->
		</div>
		<!--web-width/-->
	</div>
	<!--content/-->
</body>
<script type="text/javascript">
	
	
	$(function() {
		
		var flag = false;
		$('#name').blur(function() {
			name_yz();
		})
		
		
		$("#slider2").slider({		
			width : 191, // width
			height : 32, // height
			sliderBg : "rgb(134, 134, 131)", // 滑块背景颜色
			color : "#fff", // 文字颜色
			fontSize : 14, // 文字大小
			bgColor : "#33CC00", // 背景颜色
			textMsg : "拖动验证", // 提示文字
			successMsg : "正在验证", // 验证成功提示文字
			successColor : "red", // 滑块验证成功提示文字颜色
			time : 400, // 返回时间
			callback : function(result) { // 回调函数，true(成功),false(失败)
				if (result==true) {
					submit();
				}

			}
		});
		
		
		
		function name_yz() {
			var name = $('#name').val();
			if (name == "") {
				$('.user_error').html("请输入账号昵称");
				$('.user_error').show();
				$(".slider2").slider("restore");
				return false;
				flag=false;
			} else {
				$.post("Doresetting", "opr=yzname&name=" + name, function(data) {
					if (data =="true") {
						$('.user_error').hide();
						flag=true;
						
					} else if (data == "false") {
						$('.user_error').html("请输入正确的账号");
						$('.user_error').show();
						$("#slider2").slider("restore");
						flag=false;
						return false;
					}
				})
			}
		}
		
		
	function submit() {
		name_yz();
		if (flag==true) {
		location.href='forgetpwd2.jsp';
		}else{
			$("#slider2").slider("restore");
		}
	}
	})
</script>

</html>