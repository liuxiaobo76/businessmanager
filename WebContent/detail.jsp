<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
	<title>天天生鲜-商品详情</title>
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
					欢迎您：<em>张 山</em>
				</div>
				<div class="login_btn fl">
					<a href="DoLogin">登录</a>
					<span>|</span>
					<a href="register.html">注册</a>
				</div>
				<div class="user_link fl">
					<span>|</span>
					<a href="user_center_info.html">用户中心</a>
					<span>|</span>
					<a href="cart.jsp">我的购物车</a>
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
=======
		<a href="index.html" class="logo fl"><img src="images/logo.png"/></a>
		<div class="search_con fl">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品"/>
			<input type="button" class="input_btn fr" name="" value="搜索"/>
		</div>
		<div class="guest_cart fr">
			<a href="cart.jsp" class="cart_name fl">我的购物车</a>
			<div class="goods_count fl" id="show_count">0</div>
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
		</div>
	</div>

	<div class="navbar_con">
		<div class="navbar clearfix">
			<div class="subnav_con fl">
				<h1>全部商品分类</h1>	
				<span></span>			
				<ul class="subnav">
					<li><a href="#" class="fruit">新鲜水果</a></li>
					<li><a href="#" class="seafood">海鲜水产</a></li>
					<li><a href="#" class="meet">猪牛羊肉</a></li>
					<li><a href="#" class="egg">禽类蛋品</a></li>
					<li><a href="#" class="vegetables">新鲜蔬菜</a></li>
					<li><a href="#" class="ice">速冻食品</a></li>
				</ul>
			</div>
			<ul class="navlist fl">
				<li><a href="">首页</a></li>
				<li class="interval">|</li>
				<li><a href="">手机生鲜</a></li>
				<li class="interval">|</li>
				<li><a href="">抽奖</a></li>
			</ul>
		</div>
	</div>

	<div class="breadcrumb">
		<a href="#">全部分类</a>
		<span>></span>
		<a href="#">${product.ptypeName }</a>
		<span>></span>
		<a href="#">商品详情</a>
	</div>

	<div class="goods_detail_con clearfix">
		<div class="goods_detail_pic fl"><img width="350px" height="350px" src="images/goods/${product.proBimg}"/></div>

		<div class="goods_detail_list fr">
		<input type="hidden" class="pro_id" value="${product.proId }" />
			<h3>${product.proName }</h3>
			<p>${product.proDescription }</p>
			<div class="prize_bar">
				<span class="show_pirze">¥<em>${product.proPrice }</em></span>
				<span class="show_unit">单  位：元/500g</span>
			</div>
			<div class="goods_num clearfix">
				<div class="num_name fl">数 量：</div>
				<div class="num_add fl">
					<input type="text" class="num_show fl" value="1"/>
					<a href="javascript:;" class="add fr">+</a>
					<a href="javascript:;" class="minus fr">-</a>	
				</div> 
			</div>
			<div class="total">总价：<em>${product.proPrice }元</em></div>
			<div class="operate_btn">
				<a href="javascript:void(0)" class="buy_btn">立即购买</a>
				<a href="javascript:;" class="add_cart" id="add_cart">加入购物车</a>				
			</div>
		</div>
	</div>

	<div class="main_wrap clearfix">
		<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>新品推荐</h3>
				<ul>
					<li>
						<a href="#"><img src="images/goods/goods001.jpg"/></a>
						<h4><a href="#">进口柠檬</a></h4>
						<div class="prize">￥3.90</div>
					</li>
					<li>
						<a href="#"><img src="images/goods/goods002.jpg"/></a>
						<h4><a href="#">玫瑰香葡萄</a></h4>
						<div class="prize">￥16.80</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="r_wrap fr clearfix">
			<ul class="detail_tab clearfix">
				<li class="active">商品介绍</li>
				<li>评论</li>
			</ul>

			<div class="tab_content">
				<dl>
					<dt>商品详情：</dt>
					<dd>${product.proParam}</dd>
				</dl>
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
	<div class="add_jump"></div>

	<script type="text/javascript">
<<<<<<< HEAD
	
=======
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
		var $add_x = $('#add_cart').offset().top;
		var $add_y = $('#add_cart').offset().left;

		var $to_x = $('#show_count').offset().top;
		var $to_y = $('#show_count').offset().left;
<<<<<<< HEAD
		$(function () {
			if($(".login_info1").html()!=""){				
				$(".login_info").show();
			}
		})
		$(".add_jump").css({'left':$add_y+80,'top':$add_x+10,'display':'block'})
		$('#add_cart').click(function(){
			
			var id = $(".pro_id").val();
			var number = $(".num_show").val();
			$.ajax({
                url:"DoDetail",
                type:"post",
                data:{'id':id,'number':number},
                dataType:"json",
                success:function(data){
                 
                }
            });

=======

		$(".add_jump").css({'left':$add_y+80,'top':$add_x+10,'display':'block'})
		$('#add_cart').click(function(){
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
			$(".add_jump").stop().animate({
				'left': $to_y+7,
				'top': $to_x+7},
				"fast", function() {
					$(".add_jump").fadeOut('fast',function(){
						var num = $('#show_count').html();
						$('#show_count').html(1+parseInt(num));
				});
			});
		})
		$(function(){
			$(".add").click(function() {
				var num = $(this).prev().val();
				$(this).prev().val(parseInt(num) + 1);
				var price = $(".show_pirze").children().html();
<<<<<<< HEAD
				$(".total").children().html(((parseInt(num)+1)*price).toFixed(2)+"元");
=======
				$(".total").children().html((parseInt(num)+1)*price+"元");
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
			})
			$(".minus").click(function() {
				var num = $(this).prev().prev().val();
				if(num>1){
					$(this).prev().prev().val(parseInt(num) - 1);
					var price = $(".show_pirze").children().html();
<<<<<<< HEAD
					$(".total").children().html(((parseInt(num)-1)*price).toFixed(2)+"元");
=======
					$(".total").children().html((parseInt(num)-1)*price+"元");
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
				}						
				 
			})
			$(".buy_btn").click(function(){
				$(location).attr("href", "DoPlace_order?id="+$('.pro_id').val()+"&number="+$('.num_show').val());
			})
		})
<<<<<<< HEAD
	
		
=======
		
			
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808

	</script>
	
</body>
</html>