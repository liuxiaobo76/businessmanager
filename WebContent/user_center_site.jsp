<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
	<title>天天生鲜-用户中心</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css"/>
	<link rel="stylesheet" type="text/css" href="css/main.css"/>
	<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
	
</head>
<body>
	<div class="header_con">
		<div class="header">
			<div class="welcome fl">欢迎来到天天生鲜!</div>
			<div class="fr">
				<c:if test="${!empty user }">
				<div class="login_info fl">
					欢迎您：<em class="login_info1">${user.userName}&nbsp;</em>
					<span>|</span>
					<a href="DoCancel">注销</a>
				</div>
				</c:if>
				<div class="login_btn fl">
					<c:if test="${empty user}">
					<a href="login.jsp">登录</a>
					</c:if>
					<span>|</span>
					<a href="register.jsp">注册</a>
				</div>
				<div class="user_link fl">
					<span>|</span>
					<a href="DoUser_center_info">用户中心</a>
					<span>|</span>
					<a href="DoCart">我的购物车</a>
					<span>|</span>
					<a href="DoUser_center_order">我的订单</a>
				</div>
			</div>
		</div>		
	</div>

	<div class="search_bar clearfix">
		<a href="DoIndex" class="logo fl"><img src="images/logo.png"/></a>
		<form action="DoList" method="post">
		<div class="search_con fl">
			<input type="text" class="input_text fl" name="search" placeholder="搜索商品"/>
			<input type="submit" class="input_btn fr" name="" value="搜索"/>
		</div>
		</form>
		<div class="guest_cart fr">
			<a href="DoCart" class="cart_name fl">我的购物车</a>
			<div class="goods_count fl" id="show_count">${size }</div>
		</div>
	</div>

	<div class="main_con clearfix">
		<div class="left_menu_con clearfix">
			<h3>用户中心</h3>
			<ul>
				<li><a href="DoUser_center_info" >· 个人信息</a></li>
				<li><a href="DoUser_center_order">· 全部订单</a></li>
				<li><a href="DoUser_center_site" class="active">· 收货地址</a></li>
			</ul>
		</div>
		<div class="right_content clearfix">
				<h3 class="common_title2">收货地址</h3>
				<div class="site_con">
					<dl>
						<dt>当前地址：</dt>
						<dd>${user.userAddr }（${user.userName}收） ${user.userPhone }</dd>
					</dl>					
				</div>
				<h3 class="common_title2">编辑地址</h3>
				<div class="site_con">
					<form method="post" action="UpdateUser_center_site1">
						<div class="form_group">
							<label>收件人：</label>
							<input type="text" class="username" name="username"/>
							<span></span>
						</div>
						<div class="form_group form_group2">
							<label>详细地址：</label>
							<textarea class="site_area" name="useraddress"></textarea>
						</div>
						<div class="form_group">
							<label>手机：</label>
							<input type="text" class="phone" name="userphone"/>
							<span></span>
						</div>

						<input type="submit" name="" value="提交" class="info_submit"/>
					</form>
				</div>
		</div>
	</div>



	<div class="footer">
		<div class="foot_link">
			<a href="#">关于我们</a>
			<span>|</span>
			<a href="#">联系我们</a>
			<span>|</span>
			<a href="#">招聘人才</a>
			<span>|</span>
			<a href="#">友情链接</a>		
		</div>
		<p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
		<p>电话：010-****888    京ICP备*******8号</p>
	</div>
	<script type="text/javascript">
	$(function () {
		var error_name = false;
		var error_phone=false;
		$(".username").blur(function(){
			check_user_name();
		})
		$(".phone").blur(function(){
			check_phone();
		})
		if($(".login_info1").html()!=""){			
			$(".login_info").show();
		}
		function check_phone() {
			var phone=$(".phone").val();
			if (phone=="") {
				$('.phone').next().html('请输入电话号码')
				$('.phone').next().show();
				 error_phone=true;
				return false;
				} else if (!(/^1[3456789]\d{9}$/.test(phone))) {
					$('.phone').next().html('请输入正确的手机号')
					$('.phone').next().show();
					 error_phone=true;
				        return false; 
			}else{
				$.post("UpdateUser_center_site","opr=yzphone&name="+phone,function(data){
					if (data=="true") {
						$('.phone').next().html('手机号已被使用！！');
						$('.phone').next().show();
						error_phone=true;
				        return false; 
					}else{
						 $('.phone').next().hide();
						 error_phone=false;	
					}
				})
			}
		}

		function check_user_name() {
			var name= $('.username').val();
			if (name == "") {
				$('.username').next().html('请输入用户名')
				$('.username').next().show();
				error_name = true;
			} else {
				var name = $('.username').val();
				$.post("UpdateUser_center_site", "opr=yzUser&name=" + name, function(data) {
					if (data == "true") {
						$('.username').next().html('用户名已被使用')
						$('.username').next().show();
						var error_name = true;
					} else {
						$('.username').next().hide();
						var error_name = false;
					}
				})
			}
		}
		$("submit").click(function() {
			check_user_name();
			check_phone();
			if (error_name ==false&&error_phone==false) {
				return true;
			}else{
				return false;
			}			
						
			});
		
	})
	</script>
</body>
</html>