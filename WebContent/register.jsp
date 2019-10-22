<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>天天生鲜-注册</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/register.js"></script>
</head>
<body>
	<div class="register_con">
		<div class="l_con fl">
			<a class="reg_logo"><img src="images/logo02.png"></a>
			<div class="reg_slogan">足不出户 · 新鲜每一天</div>
			<div class="reg_banner"></div>
		</div>

		<div class="r_con fr">
			<div class="reg_title clearfix">
				<h1>用户注册</h1>
				<a href="login.jsp">登录</a>
			</div>
			<div class="reg_form clearfix">
				<form name="reg_testdate">
					<ul>
						<li><label>用户名:</label> <input type="text" name="user_name"
							id="user_name"> <span class="error_tip">提示信息</span></li>

						<li><label>地址:</label> <input type=text name=userAddr><span
							id=addryz></span></li>
						<li><label>真实姓名:</label> <input type=text name=userTruename>
						</li>
						<li><label>性别:</label> <select name=userSex>
								<option value="volvo">--请选择--</option>
								<option value="男">男</option>
								<option value="女">女</option>
						</select><span id=uesr_sex></span>
						
						<label>买家/卖家:</label> <select name=userSex>
								<option value="volvo">--请选择--</option>
								<option value="买家">买家</option>
								<option value="卖家">卖家</option>
						</select><span id=uesr_sex></span>
						
						</li>
						 <li>
						 <label>选择出生年月</label>
						   <select name="YYYY" onchange="YYYYDD(this.value)">
   							 <option value="">请选择 年</option>
  								</select>
 								 <select name="MM" onchange="MMDD(this.value)">
   									 <option value="">选择 月</option>
  								</select>
								 <select name="DD">
    							<option value="">选择 日</option>
  								</select>
						 
						 </li>
						
						
						<li><label>手机号:</label> <input type="text" name="phone"
							id="phone"> <span class="error_tip">提示信息</span></li>
						<li><label>密码:</label> <input type="password" name="pwd"
							id="pwd"> <span class="error_tip">提示信息</span></li>
						<li><label>确认密码:</label> <input type="password" name="cpwd"
							id="cpwd"> <span class="error_tip">提示信息</span></li>
						<li class="agreement"><input type="checkbox" name="allow"
							id="allow" checked="checked"> <label>同意”天天生鲜用户使用协议“</label>
							<span class="error_tip2">提示信息</span></li>

						<li class="reg_sub"><input type="submit" value="注 册" name="">
						</li>

					</ul>
				</form>
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
			var error_check_password = false;

			var error_check = false;

			$('#user_name').blur(function() {
				check_user_name();
			});

			$('#pwd').blur(function() {
				check_pwd();
			});

			$('#cpwd').blur(function() {
				check_cpwd();
			});

			$('#email').blur(function() {
				check_email();
			});

			$('#allow').click(function() {
				if ($(this).is(':checked')) {
					error_check = false;
					$(this).siblings('span').hide();
				} else {
					error_check = true;
					$(this).siblings('span').html('请勾选同意');
					$(this).siblings('span').show();
				}
			});

			
			function check_user_name() {
				var len = $('#user_name').val().length;
				if (len <= 0) {
					$('#user_name').next().html('请输入用户名')
					$('#user_name').next().show();
					error_name = true;
				} else {
					var name = $('#user_name').val();
					
					$.post("DoLogin", "opr=yzUser&name=" + name, function(data) {
						if (data == 1) {
							$('#user_name').next().html('用户名已被使用')
							$('#user_name').next().show();
							var error_name = true;
						} else {
							$('#user_name').next().hide();
							var error_name = false;
						}
					})
				}
			}

			function check_pwd() {
				var len = $('#pwd').val().length;
				if (len<8||len>20) {
					$('#pwd').next().html('密码最少8位，最长20位')
					$('#pwd').next().show();
					error_password = true;
				} else {
					$('#pwd').next().hide();
					error_password = false;
				}
			}

			function check_cpwd() {
				var pass = $('#pwd').val();
				var cpass = $('#cpwd').val();

				if (pass != cpass) {
					$('#cpwd').next().html('两次输入的密码不一致')
					$('#cpwd').next().show();
					error_check_password = true;
				} else {
					$('#cpwd').next().hide();
					error_check_password = false;
				}

			}

			function check_email() {
				var re = /^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/;

				if (re.test($('#email').val())) {
					$('#email').next().hide();
					error_email = false;
				} else {
					$('#email').next().html('你输入的邮箱格式不正确')
					$('#email').next().show();
					error_check_password = true;
				}

			}

			$('#reg_form')
					.submit(
							function() {
								check_user_name();
								check_pwd();
								check_cpwd();
								check_email();

								if (error_name == false
										&& error_password == false
										&& error_check_password == false
										&& error_email == false
										&& error_check == false) {
									return true;
								} else {
									return false;
								}

							});
			

		})
	</script>
	<script language="JavaScript"><!--   
   function YYYYMMDDstart()   
   {   
           MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];   
    
           //先给年下拉框赋内容   
           var y  = new Date().getFullYear();   
           for (var i = (y-30); i < (y+30); i++) //以今年为准，前30年，后30年   
                   document.reg_testdate.YYYY.options.add(new Option(" "+ i +" 年", i));   
    
           //赋月份的下拉框   
           for (var i = 1; i < 13; i++)   
                   document.reg_testdate.MM.options.add(new Option(" " + i + " 月", i));   
    
           document.reg_testdate.YYYY.value = y;   
           document.reg_testdate.MM.value = new Date().getMonth() + 1;   
           var n = MonHead[new Date().getMonth()];   
           if (new Date().getMonth() ==1 && IsPinYear(YYYYvalue)) n++;   
                writeDay(n); //赋日期下拉框Author:meizz   
           document.reg_testdate.DD.value = new Date().getDate();   
   }   
   if(document.attachEvent)   
       window.attachEvent("onload", YYYYMMDDstart);   
   else   
       window.addEventListener('load', YYYYMMDDstart, false);   
   function YYYYDD(str) //年发生变化时日期发生变化(主要是判断闰平年)   
   {   
           var MMvalue = document.reg_testdate.MM.options[document.reg_testdate.MM.selectedIndex].value;   
           if (MMvalue == ""){ var e = document.reg_testdate.DD; optionsClear(e); return;}   
           var n = MonHead[MMvalue - 1];   
           if (MMvalue ==2 && IsPinYear(str)) n++;   
                writeDay(n)   
   }   
   function MMDD(str)   //月发生变化时日期联动   
   {   
        var YYYYvalue = document.reg_testdate.YYYY.options[document.reg_testdate.YYYY.selectedIndex].value;   
        if (YYYYvalue == ""){ var e = document.reg_testdate.DD; optionsClear(e); return;}   
        var n = MonHead[str - 1];   
        if (str ==2 && IsPinYear(YYYYvalue)) n++;   
       writeDay(n)   
   }   
   function writeDay(n)   //据条件写日期的下拉框   
   {   
           var e = document.reg_testdate.DD; optionsClear(e);   
           for (var i=1; i<(n+1); i++)   
                e.options.add(new Option(" "+ i + " 日", i));   
   }   
   function IsPinYear(year)//判断是否闰平年   
   {     return(0 == year%4 && (year%100 !=0 || year%400 == 0));}   
   function optionsClear(e)   
   {   
        e.options.length = 1;   
   }   
   //--></script>
</body>
</html>