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
    <script src="js/jquery-1.12.4.js"></script>
    <script src="js/f.js"></script>
    <title>商品管理</title>
     <style type="text/css">
    	#color{
    	color:white;
    	}
    	.dqzy{
    		visibility:hidden;
    	}
    	#proType{
    		width:275px;
    	}
    	.InquireSelectTable  p{font-size: 30px;color: green;}
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
                    <li><i class="iconfont icon-tubiao_dingdan"></i><span>订单管理</span></li>
                </a>
                <a href="PtypeGetAll">
                    <li><i class="iconfont icon-fenlei"></i><span>分类管理</span></li>
                </a>
                <a href="ProductGetAll">      <li class="Select"><i class="iconfont icon-weibiaoti1"></i><span>商品管理</span></li></a>
            </ul>
        </div>
        <!--右侧-->
        <div class="RightBox">
            <div class="PublicContentBox">
                <!--公用指向页面名字-->
                <div class="PublicPointToAgeText">
                    <span class="span1">商品管理  </span> <span class="span2">后台管理商品列表</span>
                </div>
                <!--查询-->
                <form action="ProductGetAll" method="post">
                <div class="InquireBox clearfix">
                    <div class="InquireleftBox">
                        <div class="Text">商品名称：</div>
                        <div class="InputDiv">
                        	<input name="proName" value="${proName}"class="phoneInput" placeholder="请输入你需要查询的商品名称" />
                        	<input type="hidden" name="cutpage" value="${cutpage}"/>
                        </div>
                    </div>
                    <div class="InquireleftBox">
                        <div class="Text">商品分类：</div>
                        <div class="InputDiv">
                            <i class=" iconfont icon-xiala"></i>
                            <select name="proType" value="${fenlei}" class="phoneInput">
                            		<option value="0">请选择你的商品分类</option>
                           	 	<c:forEach items="${typelist}" var="type">
                           	 	<c:choose>
                           	 		<c:when test="${fenlei==type.ptypeId}">
                           	 		<option value="${type.ptypeId}" selected="selected">${type.ptypeName}</option>
                           	 		</c:when>
                           	 	<c:otherwise>
									<option value="${type.ptypeId}" >${type.ptypeName}</option>	                           	 	
                           	 	</c:otherwise>
                           	 	</c:choose>
                            	</c:forEach>
                            	
                            </select>
                        </div>
                    </div>
                    <div class="PublicBtnIcon Color1Btn fr">
                        <i class="iconfont icon-icon-chaxun"></i>
                        <input id="color" name="chaxun" type="submit" value="查询">
                        <!-- <span>查询</span> -->
                    </div>
                </div>
                </form>
                <!--表修改-->
                <div class="InquireTableBox">
                    <div class="headbox">
                        <div class="headboxtext">
                            <span class="span1">后台管理商品列表</span>
                        </div>
                        <!--批量删除-->
                        <div class="PublicBtnIcon Color5Btn">
                            <i class="iconfont icon-weibiaoti1"></i>
                            <!--<span>批量删除</span>-->
                        </div>

                        <div class="PublicBtnIcon Color2Btn fr Js_edit">
                            <i class="iconfont icon-changyongtubiao-mianxing-"></i>
                            <span>添加</span>
                        </div>
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
                                    <td>ID</td>
                                    <td>商品图片</td>
                                    <td>商品名称</td>
                                    <td>商品描述</td>
                                    <td>商品价格</td>
                                    <!-- <td>商品数量</td> -->
                                    <td>商品分类</td>
                                    <td>产品详情缩略图</td>
                                    <td>操作</td>
                                </tr>

                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="product">
                                <tr class="${product.proId}">
                                    <td>
                                        <input id="${product.proId}" class="inputcheck" type="checkbox" name="inputcheck1" />
                                        <label for="${product.proId}"></label>
                                    </td>
                                    <td>${product.proId}</td>
                                    <td>
                                        <div class="productImgBox">
                                            <img src="images/goods/${product.proBimg}" />
                                        </div>
                                    </td>
                                    <td>${product.proName}</td>
                                    <td>${product.proDescription}</td>
                                    <td>${product.proPrice}</td>
                                    <!-- <td>100</td> -->
                                    <td>${product.ptypeName}</td>
                                    <td>
                                        <div class="productImgBox">
                                            <img src="images/goods/${product.proSimg}" />
                                        </div>
                                    </td>

                                    <td>
                                        <div upid="${product.proId}" name="bianji" class="PublicTableBtnIcon Color3Btn Js_update">
                                            <i class="iconfont icon-tubiaozhizuomobanyihuifu-"></i>
                                            <span>编辑</span>
                                        </div>

                                        <div delid="${product.proId}" name="shanchu" class="PublicTableBtnIcon Color4Btn Js_delete">
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
						<div class="InquireSelectTable" style="height: 80px ;text-align: center" >
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
    <!--添加产品信息浮层-->
    <div class="PublicFloatBox adduser">
        <div class="kongfx">
            <div class=" wid400">
                <div class="f_Head">
                    <span>添加商品</span>
                    <i class="Js_closeBtn iconfont icon-buoumaotubiao20 fr"></i>
                </div>
                <div class="f_content">
                    <div class="f_alonediv">
                        <div class="f_alone_name">
                           	 商品类别:
                        </div>
                        <div class="f_alone_input">
                        	 <select id="proType" >
                           	 	<option value="0">请选择你的商品分类</option>
                           	 	<c:forEach items="${typelist}" var="type">
									<option value="${type.ptypeId}" >${type.ptypeName}</option>	                           	 	
                            	</c:forEach>
                           	 </select> 
                            <!-- <input class="f_p_input" /> -->
                        </div>
                        <!--提示消息-->
                        <div class="f_pormat">
                           	<!--  请输入正确的商品类别 -->
                        </div>
                    </div>
                    <div class="f_alonediv">
                        <div class="f_alone_name">
                            	商品图片:
                        </div>
                        <div class="f_alone_input">
                            <input id="proSimg" class="uploadimg" type="file" />
                        </div>
                        <!--提示消息-->
                        <div class="f_pormat">
                            	<!-- 请选择图片 -->
                        </div>
                    </div>
                    <div class="f_alonediv">
                        <div class="f_alone_name">
                           	 商品名称:
                        </div>
                        <div class="f_alone_input">
                            <input id="proName" class="f_p_input" />
                        </div>
                        <!--提示消息-->
                        <div class="f_pormat">
                            	<!-- 请输入正确的商品名称 -->
                        </div>
                    </div>
                    <div class="f_alonediv">
                        <div class="f_alone_name">
                            	商品描述:
                        </div>
                        <div class="f_alone_input">
                            <input id="proDescription" class="f_p_input" />
                        </div>
                        <!--提示消息-->
                        <div class="f_pormat">
                            	<!-- 请输入正确的商品描述 -->
                        </div>
                    </div>
                    <div class="f_alonediv">
                        <div class="f_alone_name">
                           	 商品价格:
                        </div>
                        <div class="f_alone_input">
                            <input id="proPrice" class="f_p_input" />
                        </div>
                        <!--提示消息-->
                        <div class="f_pormat">
                           	 <!-- 请输入正确的商品价格 -->
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
    </div>
    <!--修改产品信息浮层-->
    <div class="PublicFloatBox updateuser">
        <div class="kongfx">
            <div class=" wid400">
                <div class="f_Head">
                    <span>修改商品</span>
                    <i class="Js_closeBtn iconfont icon-buoumaotubiao20 fr"></i>
                </div>
                <div class="f_content">
                    <div class="f_alonediv">
                        <div class="f_alone_name">
                           	 商品类别:
                          </div>
                        <div class="f_alone_input">
                           <select id="proType1" >
                           	 	<option value="0">请选择你的商品分类</option>
                           	 	<c:forEach items="${typelist}" var="type">
									<option value="${type.ptypeId}" >${type.ptypeName}</option>	                           	 	
                            	</c:forEach>
                           	 </select> 
                        </div>
                        <!--提示消息-->
                        <div class="f_pormat">
                           	 <!-- 请输入正确的商品类别 -->
                        </div>
                    </div>
                    <div class="f_alonediv">
                        <div class="f_alone_name">
                            	商品图片:
                        </div>
                        <div class="f_alone_input">
                            <input id="proSimg1" class="uploadimg" type="file" />
                        </div>
                        <!--提示消息-->
                        <div class="f_pormat">
                            	<!-- 请选择图片 -->
                        </div>
                    </div>
                    <div class="f_alonediv">
                        <div class="f_alone_name">
                           	 商品名称:
                        </div>
                        <div class="f_alone_input">
                            <input id="proName1" class="f_p_input" />
                        </div>
                        <!--提示消息-->
                        <div class="f_pormat">
                            	<!-- 请输入正确的商品名称 -->
                        </div>
                    </div>
                    <div class="f_alonediv">
                        <div class="f_alone_name">
                            	商品描述:
                        </div>
                        <div class="f_alone_input">
                            <input id="proDescription1" class="f_p_input" />
                        </div>
                        <!--提示消息-->
                        <div class="f_pormat">
                            	<!-- 请输入正确的商品描述 -->
                        </div>
                    </div>
                    <div class="f_alonediv">
                        <div class="f_alone_name">
                           	 商品价格:
                        </div>
                        <div class="f_alone_input">
                            <input id="proPrice1" class="f_p_input" />
                        </div>
                        <!--提示消息-->
                        <div class="f_pormat">
                           	 <!-- 请输入正确的商品价格 -->
                        </div>
					</div>	                       
                    <div class="f_alonediv1">
                        <div class="f_alone_name">
                        </div>
                        <div class="f_alone_input1">
                            <!--publicbtn-->
                            <div class="publicf_btn">
                                <div class="publicf_btn1 queding">
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
    </div>
</body>
<script type="text/javascript">
	$(function(){
		var bjthis = null;
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
   		
   		//添加  确认点击事件
   		$(".publicf_btn1").click(function(){
   			$("#proName").parent().next().html("");
   			$("#proType").parent().next().html("");
   			$("#proDescription").parent().next().html("");
   			$("#proSimg").parent().next().html("");
   			$("#proPrice").parent().next().html("");
   			
   			var proName = $("#proName").val();
   			var proType = $("#proType").val();
   			var proDescription = $("#proDescription").val();
   			var proSimg = ($("#proSimg").val()).substring(12);
   			var proPrice = $("#proPrice").val();
   			
   			if(proName==""){
   				$("#proName").parent().next().html("请输入正确的商品名称");
   				return false;
   			}
   			if(proType==0){
   				$("#proType").parent().next().html("请选择正确的商品分类");
   				return false;
   			}
   			if(proDescription==""){
   				$("#proDescription").parent().next().html("请输入正确的商品描述");
   				return false;
   			}
   			if(proSimg==""){
   				$("#proSimg").parent().next().html("请选择图片");
   				return false;
   			}
   			if(proPrice<=0){
   				$("#proPrice").parent().next().html("请输入正确的商品价格");
   				return false;
   			}
   			if(isNaN(proPrice)){
   				$("#proPrice").parent().next().html("请输入数字");
   				return false;
   			}
   			$.getJSON("AjaxProduct","opr=add&proName="+proName+"&proType="+proType+"&proDescription="+proDescription+"&proSimg="+proSimg+"&proPrice="+proPrice,add);
   				function add(data){
   					if(data==true){
   						alert("添加成功");
						$(".adduser").fadeOut(200);
						window.location="ProductGetAll";
   					}
   				}
   		})
   		
   		//删除点击事件
   		$("[name='shanchu']").click(function(){
   			var proId = $(this).attr("delid");
   			$(".f_pormatBtn1").click(function(){
   				$.getJSON("AjaxProduct","opr=delete&proId="+proId,deleteProduct);
   				function deleteProduct(data){
   					if(data==true){
   						alert("删除成功");
   						$(".f_delete").fadeOut(200);
   						$("."+proId).remove();
   					}
   				}
   			})
   		})
   		//编辑点击事件
   		$("[name='bianji']").click(function(){
   			bjthis = $(this);
   			var proId = $(this).attr("upid");
   			$.getJSON("AjaxProduct","opr=update&proId="+proId,update);
   			function update(data){
   				var jsonData = JSON.stringify(data);// 转成JSON格式
				var result = $.parseJSON(jsonData);// 转成JSON对象
				$("#proName1").val(result.proName);
				$("#proType1").val(result.proType);
				$("#proDescription1").val(result.proDescription);
				$("#proPrice1").val(result.proPrice);
				$("#proSimg1").val(result.proSimg);
			
   			}
   		})
		//编辑 确认点击事件
		$(".queding").click(function(){
			$("#proName1").parent().next().html("");
   			$("#proType1").parent().next().html("");
   			$("#proDescription1").parent().next().html("");
   			$("#proSimg1").parent().next().html("");
   			$("#proPrice1").parent().next().html("");
   			
   			var proName = $("#proName1").val();
   			var proType = $("#proType1").val();
   			var proDescription = $("#proDescription1").val();
   			var proSimg = ($("#proSimg1").val()).substring(12);
   			var proPrice = $("#proPrice1").val();
   		
   			if(proName==""){
   				$("#proName1").parent().next().html("请输入正确的商品名称");
   				return false;
   			}
   			if(proType==0){
   				$("#proType1").parent().next().html("请选择正确的商品分类");
   				return false;
   			}
   			if(proDescription==""){
   				$("#proDescription1").parent().next().html("请输入正确的商品描述");
   				return false;
   			}
   			if(proSimg==""){
   				$("#proSimg1").parent().next().html("请选择图片");
   				return false;
   			}
   			if(proPrice<=0){
   				$("#proPrice1").parent().next().html("请输入正确的商品价格");
   				return false;
   			}
   			if(isNaN(proPrice)){
   				$("#proPrice1").parent().next().html("请输入数字");
   				return false;
   			}
   			
   			$.getJSON("AjaxProduct","opr=updateinfo&proName="+proName+"&proType="+proType+"&proDescription="+proDescription+"&proSimg="+proSimg+"&proPrice="+proPrice,updateinfo);
   			function updateinfo(data){
   				if(data==true){
   					alert("修改成功！");
					
					$(bjthis).parent().prev().prev().prev().prev().prev().html(proName);
					$(bjthis).parent().prev().prev().prev().prev().html(proDescription);
					$(bjthis).parent().prev().prev().prev().html(proPrice);
					$(bjthis).parent().prev().prev().html(proType);
					$(bjthis).parent().prev().children().children().attr('src','images/goods/'+proSimg);
					$(bjthis).parent().prev().prev().prev().prev().prev().prev().children().children().attr('src','images/goods/'+proSimg);
					$(".updateuser").fadeOut(200);
					//window.location="ProductGetAll";
				}
   			}
		})
		
	})
</script>
</html>