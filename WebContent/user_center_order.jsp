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
				<li><a href="DoUser_center_info">· 个人信息</a></li>
				<li><a href="DoUser_center_order" class="active">· 全部订单</a></li>
				<li><a href="DoUser_center_site">· 收货地址</a></li>
			</ul>
		</div>
		<div class="right_content clearfix">
				<h3 class="common_title2">全部订单</h3>
				<c:forEach items="${list}" var = "item">
				<ul class="order_list_th w978 clearfix">
					<li class="col01">${item.orderTime }</li>
					<li class="col02">订单号：${item.orderRandom }</li>
					<li class="col02 stress">${item.orderStatus }</li>		
				</ul>

				<table class="order_list_table w980">
					<tbody>
						<tr>
							<td width="55%">
								<ul class="order_goods_list clearfix">					
									<li class="col01"><img src="images/goods/${item.product.proSimg }"/></li>
									<li class="col02">${item.product.proName }<em>${item.product.proPrice }元/500g</em></li>	
									<li class="col03">数量${item.orderNum }</li>
									<li class="col04">${item.product.proPrice }元</li>	
								</ul>
								
							</td>
							<td width="15%">总共${item.orderPrice*item.orderNum }元</td>
							<td width="15%">${item.orderStatus}</td>
							<td width="15%"><a href="#" class="oper_btn">去付款</a></td>
						</tr>
					</tbody>
				</table>
				</c:forEach>
				
				<form action="DoUser_center_order" method="post"> 
				<div class="pagenation">
					<a href="javascript:void(0)" class="active firstpage">首页</a>
					<a href="javascript:void(0)" class="prevpage">上一页</a>
					<a href="javascript:void(0)" class="nextpage">下一页></a>
					<a href="javascript:void(0)" class="active lastpage">尾页</a>
					<input name="pageindex" class="pageindex" value="${pageindex }" type="hidden"/>
					<a>[第<span>${pageindex }</span>页/共<span class="totalpage">${totalpage }</span>页]</a>
				</div>
				</form>
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
		$(".firstpage").click(function(){
			$(".pageindex").val(1);
			$("form").submit();
		})
		$(".lastpage").click(function(){
			var totalpage = parseInt($(".totalpage").text());
			$(".pageindex").val(totalpage);
			$("form").submit();
		})
		$(".prevpage").click(function(){
			var pageindex = parseInt($(".pageindex").val());
			if(pageindex<=1){
				$(".pageindex").val(1);
			}else{
				$(".pageindex").val(pageindex-1);
			}
			$("form").submit();
		})
		$(".nextpage").click(function(){
			var pageindex = parseInt($(".pageindex").val());
			var totalpage = parseInt($(".totalpage").text());
			if(pageindex>=totalpage){
				$(".pageindex").val(totalpage);
			}else{
				$(".pageindex").val(pageindex+1);
			}
			$("form").submit();
		})
		
	})
	

	</script>
</body>
</html>