<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
	<title>天天生鲜-用户中心</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css"/>
	<link rel="stylesheet" type="text/css" href="css/main.css"/>
	<script type="text/javascript" src="js/register.js"></script>
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
				<li><a href="DoUser_center_info" class="active">· 个人信息</a></li>
				<li><a href="DoUser_center_order">· 全部订单</a></li>
				<li><a href="DoUser_center_site">· 收货地址</a></li>
			</ul>
		</div>
		<div class="right_content clearfix">
				<div class="info_con clearfix">
				<h3 class="common_title2">基本信息</h3>
						<ul class="user_info_list">
							<li><span>用户名：</span>${user.userName }</li>
							<li><span>联系方式：</span>${user.userPhone }</li>
							<li><span>联系地址：</span>${user.userAddr }</li>			
						</ul>
				</div>
				
				<h3 class="common_title2">最近浏览</h3>
				<div class="has_view_list">
					<ul class="goods_type_list clearfix">
				<c:forEach items="${list }" var="item">
				<li>
					<a href="DoDetail"><img src="images/goods/${ item.proSimg}"/></a>
					<h4><a href="DoDetail">${item.proName }</a></h4>
					<div class="operate">
						<span class="prize">￥${item.proPrice }</span>
						<span class="unit">${item.proPrice }/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>
				</c:forEach>	
				<c:if test="${empty list }">
					<li>
						<p style="font-size: 18px;">您还没有任何浏览记录</p>
					</li>					
				</c:if>
			
			</ul>
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
		if($(".login_info1").html()!=""){				
			$(".login_info").show();
		}
	})
	</script>
</body>
</html>