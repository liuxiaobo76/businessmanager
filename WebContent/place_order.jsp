<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
	<title>天天生鲜-提交订单</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css"/>
	<link rel="stylesheet" type="text/css" href="css/main.css"/>
	<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
</head>
<body>
	<div class="header_con">
		<div class="header">
			<div class="welcome fl">欢迎来到天天生鲜!</div>
			<div class="fr">
<<<<<<< HEAD
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
=======
				<div class="login_info fl">
					欢迎您：<em>${user.userName}</em>
				</div>
				<div class="login_btn fl">
					<a href="login.html">登录</a>
					<span>|</span>
					<a href="register.html">注册</a>
				</div>
				<div class="user_link fl">
					<span>|</span>
					<a href="user_center_info.html">用户中心</a>
					<span>|</span>
					<a href="cart.html">我的购物车</a>
					<span>|</span>
					<a href="user_center_order.html">我的订单</a>
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
				</div>
			</div>
		</div>		
	</div>

	<div class="search_bar clearfix">
<<<<<<< HEAD
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
=======
		<a href="index.html" class="logo fl"><img src="images/logo.png"/></a>
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;提交订单</div>
		<div class="search_con fr">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品"/>
			<input type="button" class="input_btn fr" name="" value="搜索"/>
		</div>		
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
	</div>
	
	<h3 class="common_title">确认收货地址</h3>

	<div class="common_list_con clearfix">
		<dl>
<<<<<<< HEAD
			<dt>寄送到：${user.userAddr }</dt>
			<dd><input type="radio" name="" checked=""/> ${user.userName}&nbsp;${user.userPhone }</dd>
=======
			<dt>寄送到：${user.Addr }</dt>
			<dd><input type="radio" name="" checked=""/> ${user.userName}&nbsp;${user.Phone }</dd>
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
		</dl>
		<a href="user_center_site.jsp" class="edit_site">编辑收货地址</a>

	</div>
	
	<h3 class="common_title">支付方式</h3>	
	<div class="common_list_con clearfix">
		<div class="pay_style_con clearfix">
<<<<<<< HEAD
			
			<input type="radio" name="pay_style"/>
			<label class="zhifubao"></label>
			
=======
			<input type="radio" name="pay_style" checked/>
			<label class="cash">货到付款</label>
			<input type="radio" name="pay_style"/>
			<label class="weixin">微信支付</label>
			<input type="radio" name="pay_style"/>
			<label class="zhifubao"></label>
			<input type="radio" name="pay_style"/>
			<label class="bank">银行卡支付</label>
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
		</div>
	</div>

	<h3 class="common_title">商品列表</h3>
	
	<div class="common_list_con clearfix">
		<ul class="goods_list_th clearfix">
			<li class="col01">商品名称</li>
			<li class="col02">商品单位</li>
			<li class="col03">商品价格</li>
			<li class="col04">数量</li>
			<li class="col05">小计</li>		
		</ul>
<<<<<<< HEAD
		
=======
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
		<ul class="goods_list_td clearfix">
			<li class="col01">1</li>			
			<li class="col02"><img src="images/goods/${product.proSimg }"/></li>
			<li class="col03">${product.proName }</li>
			<li class="col04">500g</li>
			<li class="col05">${product.proPrice}元</li>
			<li class="col06">${number }</li>
			<li class="col07">${product.proPrice*number}元</li>	
		</ul>
<<<<<<< HEAD
		
	
=======
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
	</div>

	<h3 class="common_title">总金额结算</h3>

	<div class="common_list_con clearfix">
		<div class="settle_con">
			<div class="total_goods_count">共<em>${number }</em>件商品，总金额<b>${product.proPrice*number}元</b></div>
<<<<<<< HEAD
			<div class="transit">运费：<b>0元</b></div>
			<div class="total_pay">实付款：<b>${product.proPrice*number+0}元</b></div>
=======
			<div class="transit">运费：<b>10元</b></div>
			<div class="total_pay">实付款：<b>${product.proPrice*number+10}元</b></div>
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
		</div>
	</div>

	<div class="order_submit clearfix">
<<<<<<< HEAD
		
		<a href="javascript:;"  name="WIDtotal_amount">提交订单</a>
		
=======
		<a href="javascript:;" id="order_btn">提交订单</a>
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
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

	<div class="popup_con">
		<div class="popup">
			<p>订单提交成功！</p>
		</div>
		
		<div class="mask"></div>
	</div>
	<script type="text/javascript" src="js/jquery-1.12.2.js"></script>
	<script type="text/javascript">
<<<<<<< HEAD
	$(function () {
		$(".col07").html($(".col07").html().toFixed(2));
		if($(".login_info1").html()!=""){				
			$(".login_info").show();
		}
	})
		$('.order_submit').click(function() {
=======
		$('#order_btn').click(function() {
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
			localStorage.setItem('order_finish',2);

			$('.popup_con').fadeIn('fast', function() {

				setTimeout(function(){
					$('.popup_con').fadeOut('fast',function(){
						window.location.href = 'DoIndex';
					});	
				},3000)
				
			});
		});
	</script>
</body>
</html>