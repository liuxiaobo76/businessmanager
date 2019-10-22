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
    <link href="css/iconfont.css" rel="stylesheet" />
    <link href="css/index.css" rel="stylesheet" />
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/f.js"></script>
    <script src="js/jquery-1.12.4.js"></script>
    <title>订单管理</title>
    
    <style type="text/css">
    	#color{
    	color:white;
    	}
    	.dqzy{
    		visibility:hidden;
    	}
    	.InquireSelectTable  p{
    		font-size: 30px;
    		color: green;
    	}
    </style>
</head>
<body>
	<div class="PublicHead clearfix">
        <div class="leftBox clearfix">
            <div class="companyLogo">
                <img src="images/logo.jpg" />
            </div>
            <!--<i class="iconfont icon-caidan"></i>-->

            <div class="companyText">
                	天天生鲜管理系统
            </div>
        </div>
        <div class="RightBox clearfix">
            <div class="UserPhotoBox">
                <div class="UserPic">
                    <img src="images/user.jpg" />
                </div>
                <div class="UserName">
                    ${user.userName}
                </div>
            </div>
            <a href="index1.jsp">
                <div class="dropOutBox">
                    <i class="iconfont icon-app_icons--">
                    </i>
                    <span>退出</span>
                </div>
            </a>
        </div>
    </div>

    <div class="PublicDownWhole clearfix">
        <!--左侧-->
        <div class="leftBox">
            <ul>
                <a href="UserManagement.jsp"> <li class=""><i class="iconfont icon-yonghuguanli"></i><span>个人中心</span></li></a>
                <a href="OrderGetAll">
                    <li class="Select"><i class="iconfont icon-tubiao_dingdan"></i><span>订单管理</span></li>
                </a>
                <a href="PtypeGetAll">
                    <li><i class="iconfont icon-fenlei"></i><span>分类管理</span></li>
                </a>
                <a href="ProductGetAll">      <li><i class="iconfont icon-weibiaoti1"></i><span>商品管理</span></li></a>
            </ul>
        </div>
        <!--右侧-->
        <div class="RightBox">
            <div class="PublicContentBox">
                <!--公用指向页面名字-->
                <div class="PublicPointToAgeText">
                    <span class="span1">订单管理 </span> <span class="span2">后台管理订单列表</span>
                </div>
                <!--查询-->
                <form action="OrderGetAll" method="post">
                	<div class="InquireBox clearfix">
                    <div class="InquireleftBox">
                        <div class="Text">订单号：</div>
                        <div class="InputDiv"><input type="text" name="bianhao" class="phoneInput" value="${bianhao}" placeholder="请输入你需要查询的订单号" /></div>
                        <input type="hidden" name="cutpage" value="${cutpage}"/>
                    </div>
                    <div class="PublicBtnIcon Color1Btn fr">
                        <i class="iconfont icon-icon-chaxun"> </i>
                        <input id="color" type="submit" value="查询">
                    </div>
                </div>
                </form>
                <!--表修改-->
                <div class="InquireTableBox">
                    <div class="headbox">
                        <div class="headboxtext">
                            <span class="span1">后台管理订单列表</span>
                        </div>
                        <!--批量删除-->
                        <div class="PublicBtnIcon Color5Btn">
                            <i class="iconfont icon-tubiao_dingdan"></i>
                            <span></span>
                        </div>

                        <!--<div class="PublicBtnIcon Color2Btn fr Js_edit">
                            <i class="iconfont icon-changyongtubiao-mianxing-"></i>
                            <span>添加</span>
                        </div>-->
                    </div>

                    <!--查询到的表格-->
					<c:if test="${!(empty list)}">
                    <div class="InquireSelectTable">
                        <table class="PublicTableCss">
                            <thead>
                                <tr>
                                    <td>
                                        <input id="inputcheck" class="inputcheck" type="checkbox" name="inputcheck" />
                                        <label for="inputcheck"></label>
                                        <span>全选</span>
                                    </td>
                                    <td>姓名</td>
                                    <td>手机号</td>
                                    <td>地址</td>
                                    <td>应付金额</td>
                                    <td>订单编号</td>
                                    <td>下单时间</td>
                                    <td>操作</td>
                                </tr>

                            </thead>
                            <tbody>
                            	<c:forEach items="${list}" var="order">
                            	<tr class="${order.orderRandom}">
                                    <td>
                                        <input id="${order.orderRandom}" class="inputcheck" type="checkbox" name="inputcheck1" />
                                        <label for="${order.orderRandom}"></label>
                                    </td>
                                    <td>${order.userName}</td>
                                    <td>${order.userphone}</td>
                                    <td>${order.userAddr}</td>
                                    <td>${order.orderPrice}</td>
                                    <td>${order.orderRandom}</td>
                                    <td>${order.orderTime}</td>
                                    <input type="hidden" class="userId" value="${order.userId}"/>
                                    <td>
                                        <div upid="${order.userId}" name="bianji" class="PublicTableBtnIcon Color3Btn Js_edit">
                                            <i class="iconfont icon-tubiaozhizuomobanyihuifu-"></i>
                                            <span>编辑</span>
                                        </div>
                                        <div  delid="${order.orderRandom}" name="shanchu" class="PublicTableBtnIcon Color4Btn Js_delete">
                                            <i class="iconfont icon-shanchu"></i>
                                            <span>删除</span>
                                        </div>
                                    </td>
                                </tr>
                            	</c:forEach>
                            </tbody>
                        </table>

                    </div>
                    <!--分页-->
                    <div class="PageNumber">
                        <div class="NumbersBox">
                          <ul>
                          		<li class="dqzy"><a>第<span id="cutpage">${cutpage}</span>页/共<span id="totalpage">${totalpage}</span>页</a></li>
                                <li id="firstpage" class="Select">首页</li>
                                <li id="prevpage" class="">上一页 </li>
                                <li id="nextpage" class="">下一页</li>
                                <li id="lastpage" class="">尾页</li>
                            </ul>
                        </div>
                    </div>
                    </c:if>
                    <c:if test="${empty list}">
						<div class="InquireSelectTable" style="height: 80px;text-align: center">
       						<p>没有查找到订单信息</p >
      					</div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <!-- alert通用 提示是否删除-->
    <div class="PublicFloatBox f_delete">
        <div class="f_MiddleBox wid260">
            <div class="f_Head">
                <span>提示消息</span>
                <i class="Js_closeBtn iconfont icon-buoumaotubiao20 fr"></i>
            </div>
            <div class="f_content clearfix">
                <!--提示消息内容-->
                <div class="f_someText">
                    <i class="iconfont icon-tishi"></i>
                    <span>确定删除此信息？</span>
                </div>
                <!--按钮-->
                <div class="f_pormatBtn  clearfix">
                    <div class="f_pormatBtn1">
                        确定
                    </div>
                    <div class="f_pormatBtn2">
                        取消
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--修改用户浮层-->
    <div class="PublicFloatBox adduser">
        <div class="f_MiddleBox wid400">
            <div class="f_Head">
                <span>修改订单信息</span>
                <i class="Js_closeBtn iconfont icon-buoumaotubiao20 fr"></i>
            </div>
            <div class="f_content">
                <div class="f_alonediv">
                    <div class="f_alone_name">
                        	手机号:
                    </div>
                    <div class="f_alone_input">
                        <input id="phone" class="f_p_input" />
                    </div>
                    <!--提示消息-->
                    <div class="f_pormat">
                        	<!-- 请输入正确的手机号 -->
                    </div>
                </div>
                <div class="f_alonediv">
                    <div class="f_alone_name">
                        	地址:
                    </div>
                    <div class="f_alone_input">
                        <input id="address" class="f_p_input" />
                    </div>
                    <!--提示消息-->
                    <div class="f_pormat">
                       <!-- 	 请输入正确的地址 -->
                    </div>
                </div>
                <div class="f_alonediv1">
                    <div class="f_alone_name">
                    </div>
                    <div class="f_alone_input1">
                        <!--publicbtn-->
                        <div class="publicf_btn">
                            <div class="publicf_btn1">
                                确定
                            </div>
                            <div class="publicf_btn2 fr Js_closeBtn">
                                取消
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
	$(function(){
		var bjthis = null;
		//全选
		/* $("input[name='inputcheck']").click(function(){
			if($(this).checked == true){
				$("input[name='inputcheck1']").prop("checked","true");
			}else{
				$("input[name='inputcheck1']").prop("checked","false");
			}
		}) */
		$("input[name='inputcheck']").click(function(){
			   $("input[name='inputcheck1']").each(function(){
			    $(this).prop("checked",!$(this).prop("checked"));
			   })   
		})
		$("input[name='inputcheck1']").click(function(){
			var check = $("input[name='inputcheck1']").length;//2
			var checked = $("input[name='inputcheck1']:checked").length;
			if(check==checked){
				$("input[name='inputcheck']").prop("checked",true);
			}else{
				$("input[name='inputcheck']").prop("checked",false);
			}
		})
		//分页点击事件
		//首页
		$("#firstpage").click(function(){
			$("[name='cutpage']").val(1);
			$("form").submit();
		})
		//尾页
		$("#lastpage").click(function(){
			var totalpage = parseInt($("#totalpage").text());
			$("[name='cutpage']").val(totalpage);
			$("form").submit();
		})
		//上一页
		$("#prevpage").click(function(){
    		var cutpage = parseInt($("#cutpage").text());
   			if(cutpage<=1){
    			$("[name='cutpage']").val(1);
   			}else{
    			$("[name='cutpage']").val(cutpage-1);
   			}
   			$("form").submit();
 		})
 		//下一页
		$("#nextpage").click(function(){
    		var cutpage = parseInt($("#cutpage").text());
    		var totalpage = parseInt($("#totalpage").text());
    		if(cutpage>=totalpage){
     			$("[name='cutpage']").val(totalpage);
    		}else{
     			$("[name='cutpage']").val(cutpage+1);
    		}
    		$("form").submit();
   		}) 			
		//编辑点击事件
		$("[name='bianji']").click(function(){
			bithis = $(this);
			$("#phone").val("");
			$("#address").val("");
			var userId = $(this).attr("upid");
			$.getJSON("AjaxSelect","opr=update&userId="+userId,update);
			function update(data){
				var jsonData = JSON.stringify(data);// 转成JSON格式
				var result = $.parseJSON(jsonData);// 转成JSON对象
				$("#phone").val(result.userphone);
				$("#address").val(result.userAddr);
			}
		})
		//编辑 确认点击事件
		$(".publicf_btn1").click(function(){
			$("#phone").parent().next().html("");
			$("#address").parent().next().html("");
			var userphone = $("#phone").val();
			var userAddr = $("#address").val();
			if(userphone==""){
				$("#phone").parent().next().html("请输入正确的手机号");
				return false;
			}else if(!(/^1[3456789]\d{9}$/.test(userphone))) {
				 $("#phone").parent().next().html("手机号格式错误");
				 return false;
			}
			if(userAddr==""){
				$("#address").parent().next().html("请输入正确的地址");
				return false;
			}else{
				$("#address").parent().next().hide();
			}
			 
			$.getJSON("AjaxSelect","opr=updateinfo&userphone="+userphone+"&userAddr="+userAddr,updateinfo);
				function updateinfo(data){
				 	if(data==true){ 
				 		 $(bithis).parent().prev().prev().prev().prev().prev().html(userAddr);
				 		 $(bithis).parent().prev().prev().prev().prev().prev().prev().html(userphone);
				 		alert("修改成功！");
						$(".adduser").fadeOut(200);
				}
			}
		})
		//删除点击事件
		 $("[name='shanchu']").click(function(){
			var orderRandom = $(this).attr("delid");
			$(".f_pormatBtn1").click(function(){
				$.getJSON("AjaxSelect","opr=delete&orderRandom="+orderRandom,deleteorder);
				function deleteorder(data){
					if(data==true){
						alert("删除成功！");
						$("."+orderRandom).remove();
						$(".f_delete").fadeOut(200);
					}		
				}
			})
			
		}) 
		
	})
	
</script>
</html>