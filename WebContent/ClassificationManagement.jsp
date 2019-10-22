<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <script src="js/jquery-1.12.4.js" ></script>
    <title>分类管理</title>
</head>
<body>
	<div class="PublicHead clearfix">
        <div class="leftBox clearfix">
            <div class="companyLogo">
                <img src="images/logo.jpg" />
            </div>
            <!--<i class="iconfont icon-caidan Js_MenuList"></i>-->

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
        <div class="leftBox Js_leftBox">
            <ul>
                <a href="UserManagement.jsp"> <li><i class="iconfont icon-yonghuguanli"></i><span>个人中心</span></li></a>
                <a href="OrderGetAll">
                    <li><i class="iconfont icon-tubiao_dingdan"></i><span>订单管理</span></li>
                </a>
                <a href="PtypeGetAll">
                    <li class="Select"><i class="iconfont icon-fenlei"></i><span>分类管理</span></li>
                </a>
                <a href="ProductGetAll"><li><i class="iconfont icon-weibiaoti1"></i><span>商品管理</span></li></a>
            </ul>
        </div>
        <!--右侧-->
        <div class="RightBox Js_RightBox">
            <div class="PublicContentBox">
                <!--公用指向页面名字-->
                <div class="PublicPointToAgeText">
                    <span class="span1">分类管理 </span> <span class="span2">后台管理分类列表</span>
                </div>
                <!--查询-->
                <!--<div class="InquireBox clearfix">
                    <div class="InquireleftBox">
                        <div class="Text">手机号：</div>
                        <div class="InputDiv">   <input class="phoneInput" placeholder="请输入你需要查询的手机号" /></div>
                    </div>
                    <div class="PublicBtnIcon Color1Btn fr">
                        <i class="iconfont icon-icon-chaxun"></i>
                        <span>查询</span>
                    </div>
                </div>-->
                <!--表修改-->
                <div class="InquireTableBox">
                    <div class="headbox">
                        <div class="headboxtext">
                            <span class="span1">后台管理分类列表</span>
                        </div>
                        <!--批量删除-->
                        <div class="PublicBtnIcon Color5Btn">
                            <i class="iconfont icon-fenlei"></i>
                          <!--  <span>批量删除</span>-->
                        </div>

                        <div name="tianjia" class="PublicBtnIcon Color2Btn fr Js_edit">
                            <i class="iconfont icon-changyongtubiao-mianxing-"></i>
                            <span>添加</span>
                        </div>
                    </div>

                    <!--查询到的表格-->

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
                                    <td>分类名称</td>
                                    <td>操作</td>
                                </tr>

                            </thead>
                            <tbody class="shuju">
                                <c:forEach items="${list}" var="ptype">
                                <tr>
                                    <td>
                                        <input id="${ptype.ptypeId}" class="inputcheck" type="checkbox" name="inputcheck1" />
                                        <label for="${ptype.ptypeId}"></label>
                                    </td>
                                    <td>${ptype.ptypeId}</td>
                                    <td>${ptype.ptypeName}</td>
                                    <td>
                                       <div upid="${ptype.ptypeId}" name="bianji" class="PublicTableBtnIcon Color3Btn Js_update">
                                            <i class="iconfont icon-tubiaozhizuomobanyihuifu-"></i>
                                            <span>编辑</span>
                                       </div>
                                       <!-- <div class="PublicTableBtnIcon Color4Btn Js_delete">
                                            <i class="iconfont icon-shanchu"></i>
                                            <span>删除</span>
                                        </div>-->
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </div>
                    <!--分页-->
                    <!-- <div class="PageNumber">
                        <div class="NumbersBox">
                            <div class="LeftArrow">
                                上一页
                            </div>
                            <ul>
                                <li class="Select">1</li>
                                <li class="">2</li>
                                <li class="">...</li>
                                <li class="">4</li>
                                <li class="">5</li>
                            </ul>
                            <div class="RightArrow ">
                                下一页
                            </div>
                        </div>
                    </div> -->
					<div style="height: 50px">
					</div>

                </div>
            </div>

        </div>
    </div>


    <!-- alert通用 提示是否删除-->
    <!--<div class="PublicFloatBox f_delete">
        <div class="f_MiddleBox wid260">
            <div class="f_Head">
                <span>提示消息</span>
                <i class="Js_closeBtn iconfont icon-buoumaotubiao20 fr"></i>
            </div>
            <div class="f_content clearfix">
                <!--提示消息内容-->
                <!--<div class="f_someText">
                    <i class="iconfont icon-tishi"></i>
                    <span>确定删除此信息？</span>
                </div>-->
                <!--按钮-->
                <!--<div class="f_pormatBtn  clearfix">
                    <div class="f_pormatBtn1">
                        确定
                    </div>
                    <div class="f_pormatBtn2">
                        删除
                    </div>
                </div>-->
        <!--    </div>
        </div>
    </div>-->
    <!--添加浮层-->
    <div id="add" class="PublicFloatBox adduser">
        <div class="f_MiddleBox wid400">
            <div class="f_Head">
                <span>添加分类</span>
                <i class="Js_closeBtn iconfont icon-buoumaotubiao20 fr"></i>
            </div>
            <div class="f_content">   
                <!-- <div class="f_alonediv">
                    <div class="f_alone_name">
                        ID:
                    </div>
                    <div class="f_alone_input">
                        <input class="f_p_input" />
                    </div>
                    提示消息
                    <div class="f_pormat">
                        	请输入要添加的ID
                    </div>
                </div> -->
                <div class="f_alonediv">
                    <div class="f_alone_name">
                        	添加分类:
                    </div>
                    <div class="f_alone_input">
                        <input id="fenlei" class="f_p_input" />
                    </div>
                    <!--提示消息-->
                    <div class="f_pormat">
                        	<!-- 请输入要添加的分类 -->
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
	<!--修改分类浮层-->
	<div id="updatefenlei" class="PublicFloatBox updateuser">
        <div class="f_MiddleBox wid400">
            <div class="f_Head">
                <span>修改分类</span>
                <i class="Js_closeBtn iconfont icon-buoumaotubiao20 fr"></i>
            </div>
            <div class="f_content">   
              <!--  <div class="f_alonediv">
                    <div class="f_alone_name">
                        ID:
                    </div>
                    <div class="f_alone_input">
                        <input class="f_p_input" />
                    </div>
                    提示消息
                    <div class="f_pormat">
                        	请输入要修改的ID
                    </div>
                </div> -->
                <div class="f_alonediv">
                    <div class="f_alone_name">
                        	修改分类:
                    </div>
                    <div class="f_alone_input">
                        <input id="ptypeName" class="f_p_input" />
                    </div>
                    <!--提示消息-->
                    <div class="f_pormat">
                        	<!-- 请输入要修改的分类 -->
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
    <!--返回顶部-->
    <a href="javaScript:void();" class="back-to-top"><i class="iconfont icon-fanhuidingbu"></i> </a>
</body>
<script type="text/javascript">
	
	$(function(){
		/*全选事件*/
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
		//编辑点击事件
		$("[name='bianji']").click(function(){
			bithis = $(this);
			var ptypeId = $(this).attr("upid");
			$.getJSON("AjaxPtype","opr=update&ptypeId="+ptypeId,update);
			function update(data){
				var jsonData = JSON.stringify(data);// 转成JSON格式
				var result = $.parseJSON(jsonData);// 转成JSON对象
				$("#ptypeName").val(result.ptypeName);
			}
		})
		//编辑 确认点击事件
		$(".publicf_btn1").click(function(){
			$("#ptypeName").parent().next().html("");
			var ptypeName = $("#ptypeName").val();
			if(ptypeName==""){
				$("#ptypeName").parent().next().html("请输入要修改的分类");
				return false;
			}
			$.getJSON("AjaxPtype","opr=updateinfo&ptypeName="+ptypeName,updateinfo);
			function updateinfo(data){
				if(data==true){
					$(bithis).parent().prev().html(ptypeName);
					alert("修改成功！");
					$(".updateuser").fadeOut(200);
				}
			}
		})
		//添加点击事件
		//$("[name='tianjia']").click(function(){
			 //添加 确认点击
			 $(".queding").click(function(){
				 var ptypeName = $("#fenlei").val();
				 if(ptypeName==""){
					 $("#fenlei").parent().next().html("请输入要添加的分类");
					 return false;
				 }
				 $.getJSON("AjaxPtype","opr=add&ptypeName="+ptypeName,add);
				 function add(data){
					 if(data==true){
						 alert("添加成功");
						 $(".adduser").fadeOut(200);
						 window.location="PtypeGetAll";
					 }
				 }
			 })
		//})
		
	})
	
</script>
</html>