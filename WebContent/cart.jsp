<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<title>天天生鲜-购物车</title>
<link rel="stylesheet" type="text/css" href="css/reset.css"/>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
</head>
<body>
	<div class="header_con">
		<div class="header">
			<div class="welcome fl">欢迎来到天天生鲜!</div>
			<div class="fr">
				<div class="login_info fl">
					欢迎您：<em>张 山</em>
				</div>
				<div class="login_btn fl">
					<a href="login.html">登录</a> <span>|</span> <a href="register.html">注册</a>
				</div>
				<div class="user_link fl">
					<span>|</span> <a href="user_center_info.html">用户中心</a> <span>|</span>
					<a href="cart.html">我的购物车</a> <span>|</span> <a
						href="user_center_order.html">我的订单</a>
				</div>
			</div>
		</div>
	</div>

	<div class="search_bar clearfix">
		<a href="index.html" class="logo fl"><img src="images/logo.png"/></a>
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>
		<div class="search_con fr">
			<form action="DoList" method="post">
				<input type="text" class="input_text fl" name="search"
					value="${search}" placeholder="搜索商品" /> <input type="hidden"
					name="pageindex" value="1" /> <input type="submit"
					class="input_btn fr" name="" value="搜索" />
			</form>
		</div>
	</div>

	<div class="total_count">
		全部商品<em class="totalcount">2</em>件
	</div>
	<ul class="cart_list_th clearfix">
		<li class="col01">商品名称</li>
		<li class="col02">商品单位</li>
		<li class="col03">商品价格</li>
		<li class="col04">数量</li>
		<li class="col05">小计</li>
		<li class="col06">操作</li>
	</ul>
	<ul class="cart_list_td clearfix">
		<li class="col01"><input type="checkbox" name="" checked="checked" /></li>
		<li class="col02"><img src="images/goods/goods012.jpg"/></li>
		<li class="col03">奇异果<br />
		<em>25.80元/500g</em></li>
		<li class="col04">500g</li>
		<li class="col05">25.80元</li>
		<li class="col06">
			<div class="num_add">
				<a href="javascript:;" class="add fl">+</a> <input type="text"
					class="num_show fl" value="1"/> <a href="javascript:;"
					class="minus fl">-</a>
			</div>
		</li>
		<li class="col07">25.80元</li>
		<li class="col08"><a href="javascript:void(0);">删除</a></li>
	</ul>

	<ul class="cart_list_td clearfix">
		<li class="col01"><input type="checkbox" name="" checked="checked" /></li>
		<li class="col02"><img src="images/goods/goods003.jpg" /></li>
		<li class="col03">大兴大棚草莓<br />
		<em>16.80元/500g</em></li>
		<li class="col04">500g</li>
		<li class="col05">16.80</li>
		<li class="col06">
			<div class="num_add">
				<a href="javascript:;" class="add fl">+</a> <input type="text"
					class="num_show fl" value="1" /> <a href="javascript:;"
					class="minus fl">-</a>
			</div>
		</li>
		<li class="col07">16.80元</li>
		<li class="col08"><a href="javascript:void(0);">删除</a></li>
	</ul>


	<ul class="settlements">
		<li id="all"><input type="checkbox" name="" /></li>
		<li class="col02">全选</li>
		<li class="col03">合计(不含运费)：<span>¥</span><em id="total">42.60</em><br/>共计<b class="totalcount">2</b>件商品
		</li>
		<li class="col04"><a href="place_order.html">去结算</a></li>
	</ul>

	<div class="footer">
		<div class="foot_link">
			<a href="#">关于我们</a> <span>|</span> <a href="#">联系我们</a> <span>|</span>
			<a href="#">招聘人才</a> <span>|</span> <a href="#">友情链接</a>
		</div>
		<p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
		<p>电话：010-****888 京ICP备*******8号</p>
	</div>
	<script>
		$(function() {
			$(".col08").click(function() {
				$(this).parent().remove();
				allprice();
			})
			$(".add")
					.click(
							function() {
								var num = $(this).next().val();
								$(this).next().val(parseInt(num) + 1);

								var str = $(this).parent().parent().prev()
										.html();
								str = str.substring(0, (str.indexOf(".") + 2));
								$(this).parent().parent().next().html(
										str
												* (parseFloat($(this).next()
														.val())) );
								allprice();
							})
			$(".minus").click(
					function() {
						var num = $(this).prev().val();
						if (parseInt(num) > 1) {
							$(this).prev().val(parseInt(num) - 1);

							var str = $(this).parent().parent().prev().html();
							str = str.substring(0, (str.indexOf(".") + 2));
							$(this).parent().parent().next().html(
									str * (parseFloat($(this).prev().val())));
						}
						allprice();
					})
			$("#all").click(function() {
				
					$("input[type=checkbox]").prop("checked", true);
			
				allprice();
			})
			$("input[type=checkbox]").click(function() {
				var check = $("input[type=checkbox]").length;//2
				var checked = $("input[type=checkbox]:checked").length;//2
				if (check == checked) {
					$("#all").prop("checked", true);
				} else {
					$("#all").prop("checked", false);
				}
				allprice();
			})
			function allprice() {
				var sum = 0;
				var count = 0;
				$("input[type=checkbox]").each(
						function() {
							if (this.checked == true) {
								var a = $(
										$(this).parent().next().next().next()
												.next().next().next()).html();
								//var sumprice = a.substring(0, (a.indexOf(".") + 2));
								sum += parseFloat(a); 	
								var b = $($(this).parent().next().next().next().next().next().children().children(":first").next()).val();
								count += parseInt(b);
							}
							$("#total").html(sum+"元");
							$(".totalcount").html(count);
						})
			
			}
			function totalcount(){
				var sum = 0;
				$(".num_show").each(function(){
					if($($(this).parent().parent().parent().children(":first").children(":first")).checked==true){
						
						sum += parseFloat($(this).html());
					}
				});
				alert(sum);
			}

		})
	</script>
</body>
</html>