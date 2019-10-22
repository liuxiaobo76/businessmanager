<!DOCTYPE html>
<%@page import="java.net.URLDecoder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>

<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link href="css/reset.css" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" />
<title>登录页</title>
</head>

<body>
	<div class="LoginBox">
		<div class="VerticalCenteredBox">
			<div class="LoginHead">天天生鲜后台登录</div>
			<form action="../AdminLogin" method="post">
				<%
					String name="";
					String pwd="";
					Cookie[] cks=request.getCookies();
					if(cks!=null&&cks.length>0){
						for(Cookie ck:cks){
							if(ck.getName().equals("name")){
								name=ck.getValue();
								name=URLDecoder.decode(name,"UTF-8");
							}
							if(ck.getName().equals("pwd")){
								pwd=ck.getValue();
							}
						}
					}
				%>
				<div class="LoginUserBoxOut ">
					<div class="LoginUserBox mar_top30">
						<input class="LoginUserInput" placeholder="请输入账号" name="adminName" value="<%=name%>"/>
						<span></span>
					</div>
				</div>
				<div class="LoginUserBoxOut">
					<div class="LoginUserBox">
						<input class="LoginUserInput" placeholder="请输入密码" name="adminPwd"
							type="password" value="<%=pwd%>"/> <span></span>
					</div>
				</div>

				<div class="LoginUserBoxOut">

					<div class="LoginLastBox clearfix">
						<div class="leftBox">
							<input id="inputcheck" class="inputcheck" type="checkbox"
								name="inputcheck" value="checked"/> <label for="inputcheck"></label> <span>下次自动登录</span>
						</div>
						<a href="javascript:void(0)">
							<div class="RightBox">登录</div>
						</a>
					</div>
				</div>
			</form>
				
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".RightBox").click(function() {
				$("form").submit();
			})
			$("[name='adminName']").blur(function() {
				$("[name='adminName']").next().html("");
				var adminName = $(this).val();
				if (adminName == "") {
					$("[name='adminName']").next().html("请输入账号");
				}
			})
			$("[name='adminPwd']").blur(function() {
				$("[name='adminPwd']").next().html("");
				var adminName = $(this).val();
				if (adminName == "") {
					$("[name='adminPwd']").next().html("请输入密码");
				}
			})
			$("form").submit(function() {
				var adminName = $("[name='adminName']").val();
				var adminPwd = $("[name='adminPwd']").val();
				if(adminName==""){
					$("[name='adminName']").next().html("请输入账号");
					return false;
				}
				if(adminPwd==""){
					$("[name='adminPwd']").next().html("请输入密码");
					return false;
				}
				return true;
			})
			
		})
	</script>
</body>

</html>