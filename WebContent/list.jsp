<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
	<title>天天生鲜-商品列表</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css"/>
	<link rel="stylesheet" type="text/css" href="css/main.css"/>
	<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
</head>
<body>
<%  

%>
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
			<input type="text" name="pageindex" value="${pageindex }" hidden="hidden"/>
			<input type="submit" class="input_btn fr" name="" value="搜索"/>
		</div>
		</form>
		<div class="guest_cart fr">
			<a href="DoCart" class="cart_name fl">我的购物车</a>
			<div class="goods_count fl" id="show_count">${size }</div>
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
				<li><a href="index1.jsp">商家登陆</a></li>
				<li class="interval">|</li>
				<li><a href="HOUTAI/login.jsp">管理员登陆</a></li>
			</ul>
		</div>
	</div>

	<div class="breadcrumb">
		<a href="#">全部分类</a>
		<span></span>
		<a href="#">全部水果</a>
	</div>

	<div class="main_wrap clearfix">
		<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>新品推荐</h3>
				<ul class="dramic">
					<li>
						<a href="#"><img src="images/goods/goods001.jpg"></a>
						<h4><a href="#">进口柠檬</a></h4>
						<div class="prize">￥3.90</div>
					</li>
					<li>
						<a href="#"><img src="images/goods/goods002.jpg"></a>
						<h4><a href="#">玫瑰香葡萄</a></h4>
						<div class="prize">￥16.80</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="r_wrap fr clearfix">
			<div class="sort_bar">
				<a href="#" class="active">默认</a>
			</div>

			<ul class="goods_type_list clearfix">
				
				<c:if test="${empty list }">
					<p>没有数据</p>
				</c:if>
				<c:if test="${!empty list }">		
				<c:forEach items="${list}" var = "item">
				<li>
				
					<a href="DoDetail?id=${item.proId}"><img src="images/goods/${item.proSimg}"/></a>
					<h4><a href="DoDetail?id=${item.proName}">${item.proName}</a></h4>
					<div class="operate">
						<span class="prize1">￥${item.proPrice}</span>
						<span class="unit">${item.proPrice}/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>
				</c:forEach>
				</c:if>		
				
				
			</ul>

			<div class="pagenation">
			
			<a href="javascript:void(0)" id="firstpage">首页</a>
			<a href="javascript:void(0)" id="prevpage">上一页</a>
			<a href="javascript:void(0)" id="nextpage">下一页</a>
			<a href="javascript:void(0)" id="lastpage">尾页</a>
			<a>[第<span id="pageindex">${pageindex}</span>页/共<span id="totalpage">${totalpage}</span>页]</a>
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
		$(function (){
			$("#firstpage").click(function(){
				$("[name='pageindex']").val(1);
				$("form").submit();
			})
			$("#lastpage").click(function(){
				var totalpage = parseInt($("#totalpage").text());
				$("[name='pageindex']").val(totalpage);
				$("form").submit();
			})
			$("#prevpage").click(function(){
				var pageindex = parseInt($("#pageindex").text());
				if(pageindex<=1){
					$("[name='pageindex']").val(1);
				}else{
					$("[name='pageindex']").val(pageindex-1);
				}
				$("form").submit();
			})
			$("#nextpage").click(function(){
				var pageindex = parseInt($("#pageindex").text());
				var totalpage = parseInt($("#totalpage").text());
				if(pageindex>=totalpage){
					$("[name='pageindex']").val(totalpage);
				}else{
					$("[name='pageindex']").val(pageindex+1);
				}
				$("form").submit();
			})
			
		
		})
	</script>
</body>
</html>