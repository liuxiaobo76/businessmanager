<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link href="css/reset.css" rel="stylesheet" />
    <link href="css/index.css" rel="stylesheet" />
    <title>登录页</title>
    <script type="text/javascript" src="js/jquery-1.12.4.js" ></script>
<title>登录页</title>
</head>
<body>
<div class="LoginBox">
        <div class="VerticalCenteredBox">
            <div class="LoginHead">
                	天天生鲜管理系统
            </div>
            <form action="Login" method="post">
            	<div class="LoginUserBoxOut ">
                <div class="LoginUserBox mar_top30">
                    <input name="userName" class="LoginUserInput" placeholder="请输入账号" />
                    <span id="userspan"></span>
                </div>
            </div>
            <div class="LoginUserBoxOut">
                <div class="LoginUserBox">
                    <input name="userPwd" id="LoginPwdInput" class="LoginUserInput" placeholder="请输入密码" type="password" />
                    <span id="pwdspan"></span>
                </div>
            </div>

            <div class="LoginUserBoxOut">

                <div class="LoginLastBox clearfix">
                    <div class="leftBox">
                        <input id="inputcheck" class="inputcheck" type="checkbox" name="inputcheck" />
                        <label for="inputcheck"></label>
                        <span>下次自动登录</span>
                    </div>
                    <a>
                        <div >
                        	<input class="RightBox" type="submit" value="登录">
                        </div>
                    </a>
                </div>
            </div>
            </form>
        </div>
    </div>
</body>
<script type="text/javascript">
	$(function(){
		$(".LoginUserInput").blur(function(){
			$("#userspan").html("");
			var user = $(this).val();
			if(user==""){
				$("#userspan").html("账号不能为空");
				return false;
			}
		})
		$("#LoginPwdInput").blur(function(){
			$("#pwdspan").html("");
			var pwd = $(this).val();
			if(pwd==""){
				$("#pwdspan").html("密码不能为空");
				return false;
			}
		})
	})
</script>
</html>