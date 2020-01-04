<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
=======
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
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
					<span>|</span> <a href="DoUser_center_info">用户中心</a> <span>|</span>
					<a href="DoCart">我的购物车</a> <span>|</span> <a
						href="DoUser_center_order">我的订单</a>
=======
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
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
				</div>
			</div>
		</div>
	</div>
<<<<<<< HEAD
	
	<div class="search_bar clearfix">
		<a href="DoIndex" class="logo fl"><img src="images/logo.png"/></a>
=======

	<div class="search_bar clearfix">
		<a href="index.html" class="logo fl"><img src="images/logo.png"/></a>
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
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
<<<<<<< HEAD
		全部商品<em class="totalcount">0</em>件
=======
		全部商品<em class="totalcount">2</em>件
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
	</div>
	<ul class="cart_list_th clearfix">
		<li class="col01">商品名称</li>
		<li class="col02">商品单位</li>
		<li class="col03">商品价格</li>
		<li class="col04">数量</li>
		<li class="col05">小计</li>
		<li class="col06">操作</li>
	</ul>
<<<<<<< HEAD
	<c:if test="${empty list }">
		<ul class="cart_list_td clearfix">
			<li style="font-size: 50px">您还没有添加任何商品</li>
		</ul>
	</c:if>
	<c:if test="${!empty list }">
	<c:forEach items="${list}" var="item">	
	<ul class="cart_list_td clearfix">
		<li class="col01"><input class="check" type="checkbox" name=""  /></li>
		<li class="col02"><img src="images/goods/${item.proSimg }"/></li>
		<li class="col03">${item.proName }<br />
		<em>${item.proPrice }元/500g</em></li>
		<li ><input type="text" class="proId" value="${item.proId }" hidden="hidden"/>500g</li>
		<li class="col05">${item.proPrice}元</li>
=======
	<ul class="cart_list_td clearfix">
		<li class="col01"><input type="checkbox" name="" checked="checked" /></li>
		<li class="col02"><img src="images/goods/goods012.jpg"/></li>
		<li class="col03">奇异果<br />
		<em>25.80元/500g</em></li>
		<li class="col04">500g</li>
		<li class="col05">25.80元</li>
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
		<li class="col06">
			<div class="num_add">
				<a href="javascript:;" class="add fl">+</a> <input type="text"
					class="num_show fl" value="1"/> <a href="javascript:;"
					class="minus fl">-</a>
			</div>
		</li>
<<<<<<< HEAD
		<li class="col07">${item.proPrice }元</li>
		<li class="col08"><a href="javascript:void(0);">删除</a></li>
	</ul>
	</c:forEach>
	</c:if>
=======
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
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808


	<ul class="settlements">
		<li id="all"><input type="checkbox" name="" /></li>
		<li class="col02">全选</li>
<<<<<<< HEAD
		<li class="col03">合计(不含运费)：<span>¥</span><em id="total">0</em><br/>共计<b class="totalcount">0</b>件商品
		</li>
		<li class="col04"><a href="javascript:void(0);">去结算</a></li>
=======
		<li class="col03">合计(不含运费)：<span>¥</span><em id="total">42.60</em><br/>共计<b class="totalcount">2</b>件商品
		</li>
		<li class="col04"><a href="place_order.html">去结算</a></li>
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
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
<<<<<<< HEAD
	
		$(function() {
			if($(".login_info1").html()!=""){				
				$(".login_info").show();
			}
			$(".col08").click(function() {
				 var a=confirm("是否删除该收藏！！！");
				 var b = $(this);
				 var id = $(this).prev().prev().prev().prev().children().val();
				 if(a==true){
			            $.ajax({
			                type:"post",
			                url:"DoCart?opr=opr",
			                data:{"id":id},
			                dataType:"text",
			                success:function(data){
			                    if(data != "false"){//删除成功：移除删除行
			                        alert("删除成功");
			                        $(b).parent().remove();
			                        allprice();
			                    }else{//删除失败
			                    	alert("删除失败");
			                    }
			                }
			            })
			      }
				 
				
=======
		$(function() {
			$(".col08").click(function() {
				$(this).parent().remove();
				allprice();
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
			})
			$(".add")
					.click(
							function() {
								var num = $(this).next().val();
								$(this).next().val(parseInt(num) + 1);

								var str = $(this).parent().parent().prev()
										.html();
								str = str.substring(0, (str.indexOf(".") + 2));
<<<<<<< HEAD
								$(this).parent().parent().next().html((str* (parseFloat($(this).next().val()))).toFixed(2) );
=======
								$(this).parent().parent().next().html(
										str
												* (parseFloat($(this).next()
														.val())) );
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
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
<<<<<<< HEAD
									(str * (parseFloat($(this).prev().val()))).toFixed(2));
						}
						allprice();
					})
			$("#all").click(function(){
 				if(this.checked != true){
					$(".check").prop("checked",true);
				}else{
					$(".check").prop("checked",false);
				}
				allprice();
			})
			$(".check").click(function() {
				var check = $(".check").length;//2
				var checked = $(".check:checked").length;//2
=======
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
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
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
<<<<<<< HEAD
				$(".check").each(
=======
				$("input[type=checkbox]").each(
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
						function() {
							if (this.checked == true) {
								var a = $(
										$(this).parent().next().next().next()
<<<<<<< HEAD
												.next().next().next()).html();//总价
								//var sumprice = a.substring(0, (a.indexOf(".") + 2));
								sum += parseFloat(a); //总价	
								var b = $($(this).parent().next().next().next().next().next().children().children(":first").next()).val();
								count += parseInt(b);//总数量
							}
							
				})
				$("#total").html(sum.toFixed(2)+"元");
				$(".totalcount").html(count);
			
			}
		 	function totalcount(){
				var sum = 0;
				$(".num_show").each(function(){
					if($($(this).parent().parent().parent().children(":first").children(":first")).checked==true){						
						sum += parseFloat($(this).html());
					}
				});
			} 
		 	$(".col04").click(function(){
		 		var listId = null;
		 		var listNum = null;
		 		var totalprice =$("#total").html();
		 		$(".check").each(function() {
		 			if (this.checked == true) {
		 				var id = $(this).parent().next().next().next().children(":first").val();
		 				var number = $($(this).parent().next().next().next().next().next().children().children(":first").next()).val();
						listId=id;
						listNum=number;
		 			};
		 		});
				$(location).attr("href", "DoPlace_order?listId="+listId+"&listNum="+listNum+"&totalprice="+totalprice);	
		 	})
=======
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
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808

		})
	</script>
</body>
</html>