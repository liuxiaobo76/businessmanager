<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link href="css/reset.css" rel="stylesheet" />
<link href="css/iconfont.css" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" />
<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/f.js"></script>
<script src="js/adddate.js"></script>
<title>用户管理</title>
</head>
<body>
	<div class="PublicHead clearfix">
		<div class="leftBox clearfix">
			<div class="companyLogo">
				<img src="images/logo.png" />
			</div>
			<!--<i class="iconfont icon-caidan Js_MenuList"></i>-->

			<div class="companyText">天天生鲜后台管理</div>
		</div>
		<div class="RightBox clearfix">
			<div class="UserPhotoBox">
				<div class="UserPic">
					<img src="images/user.jpg" />
				</div>
				<div class="UserName">
					<p id="userName">${a.adminName}</p>
				</div>
			</div>
			<a href="javascript:void(0)" id="out">
				<div class="dropOutBox">
					<i class="iconfont icon-app_icons--"> </i> <span>退出</span>
				</div>
			</a>
		</div>
	</div>

	<div class="PublicDownWhole clearfix">
		<!--左侧-->
		<div class="leftBox Js_leftBox">
			<ul>
				<a href="../GetAll">
					<li><i class="iconfont icon-yonghuguanli"></i><span>管理员管理</span></li>
				</a>
				 <a href="../UserGetAll">
					<li class="Select"><i class="iconfont icon-tubiao_dingdan"></i><span>用户管理</span></li>
				</a>
				<!--<a href="ClassificationManagement.jsp">
					<li><i class="iconfont icon-fenlei"></i><span>分类管理</span></li>
				</a>
				<a href="ProductManagement.jsp">
					<li><i class="iconfont icon-weibiaoti1"></i><span>产品管理</span></li>
				</a> -->
			</ul>
		</div>
		<!--右侧-->
		<div class="RightBox Js_RightBox">
			<div class="PublicContentBox">
				<!--公用指向页面名字-->
				<div class="PublicPointToAgeText">
					<span class="span1">用户管理</span> <span class="span2">后台用户管理列表</span>
				</div>
				<!--查询-->
				<form action="../UserGetAll" method="post" id="form">
					<div class="InquireBox clearfix">
						<div class="InquireleftBox">
							<div class="Text">用户名：</div>
							<div class="InputDiv">
								<input name="userName" value="${userName}" class="phoneInput"
									placeholder="请输入你需要查询的用户名" />
							</div>
						</div>
						<input type="hidden" name="currentPage" value="${dqy}" />
						<div class="PublicBtnIcon Color1Btn fr">
							<i class="iconfont icon-icon-chaxun"></i> <span class="submit">查询</span>
						</div>
					</div>
				</form>
				<!--表修改-->
				<div class="InquireTableBox">
					<div class="headbox">
						<div class="headboxtext">
							<span class="span1">后台用户管理列表</span>
						</div>
						<!--批量删除-->
						<div class="PublicBtnIcon Color5Btn">
							<i class="iconfont  icon-shanchu"></i> <span>批量删除</span>
						</div>

						<div class="PublicBtnIcon Color2Btn fr Js_add">
							<i class="iconfont icon-changyongtubiao-mianxing-"></i> <span>添加</span>
						</div>
					</div>

					<!--查询到的表格-->

					<div class="InquireSelectTable">
						<table class="PublicTableCss">

							<thead id="user">
								<tr>
									<td><input id="inputcheck" class="inputcheck"
										type="checkbox" name="allcheck" /> <label for="inputcheck"></label>
										<span>全选</span></td>
									<td>ID</td>
									<td>用户名</td>
									<td>地址</td>
									<td>手机号</td>
									<td>真实姓名</td>
									<td>性别</td>
									<td>出生日期</td>
									<td>注册时间</td>
									<td>用户身份</td>
									<td>登录状态</td>
									<td>操作</td>
								</tr>

							</thead>
							<c:if test="${!empty list }">
								<tbody>
									<c:forEach items="${UserList }" var="u">
										<tr id="${u.userId }">
											<td><input id="${u.userId }i" class="inputcheck c"
												type="checkbox" name="inputcheck" value="${u.userId }" />
												<label for="${u.userId }i"></label></td>

											<td>${u.userId }</td>
											<td>${u.userName }</td>
											<td>${u.userAddr }</td>
											<td>${u.userPhone }</td>
											<td>${u.userTruename }</td>
											<td>${u.userSex }</td>
											<td>${u.userBirthday }</td>
											<td>${u.userRegtime }</td>
											<td>${u.userStatu }</td>
											<c:if test="${u.userStatus==0 }">
											<td>正常</td>
											</c:if>
											<c:if test="${u.userStatus==1 }">
											<td>冻结</td>
											</c:if>
											<td id="update${u.userId }">

												<div upid="${u.userId }" class="PublicTableBtnIcon Color3Btn Js_update">
													<i class="iconfont icon-tubiaozhizuomobanyihuifu-"></i> <span>编辑</span>
												</div>

												<div delid="${u.userId }"
													class="PublicTableBtnIcon Color4Btn Js_delete">
													<i class="iconfont icon-shanchu"></i> <span>删除</span>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</c:if>
						</table>
						<c:if test="${empty UserList }">
							<tbody>
								<p style="font-size: 30px">未查询到"${userName }"的用户</p>
							</tbody>
						</c:if>
					</div>
					<!--分页-->
					<div class="PageNumber">
						<p hidden="hidden">
							[<span id="currentPage">${dqy }</span>/<span
								id="totalPage">${zy }</span>]
						</p>
						<div class="NumbersBox">
							<div class="LeftArrow" id="firstPage">首页</div>
							<ul>
								<li id="prevPage">上一页</li>
								<li id="nextPage">下一页</li>
							</ul>
							<div class="RightArrow" id="lastPage">尾页</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<!-- alert通用 提示是否删除-->
	<div class="PublicFloatBox f_delete">
		<div class="f_MiddleBox wid260">
			<div class="f_Head">
				<span>提示消息</span> <i
					class="Js_closeBtn iconfont icon-buoumaotubiao20 fr"></i>
			</div>
			<div class="f_content clearfix">
				<!--提示消息内容-->
				<div class="f_someText">
					<i class="iconfont icon-tishi"></i> <span>确定删除此用户？</span>
				</div>
				<!--按钮-->
				<div class="f_pormatBtn  clearfix">
					<div class="f_pormatBtn1">确定</div>
					<div class="f_pormatBtn2">取消</div>
				</div>
			</div>
		</div>
	</div>
	<!--添加用户浮层-->
	<form action="../UserAdd" method="post" class="addform">
		<div class="PublicFloatBox adduser">
			<div class="f_MiddleBox wid400">
				<div class="f_Head">
					<span>添加用户</span> <i
						class="Js_closeBtn iconfont icon-buoumaotubiao20 fr"></i>
				</div>
				<div class="f_content">
					<div class="f_alonediv">
						<div class="f_alone_name">用户名</div>
						<div class="f_alone_input">
							<input class="f_p_input" type="text" name="Uname" />
						</div>
						<!--提示消息-->
						<div class="f_pormat"></div>
					</div>
					<div class="f_alonediv">
						<div class="f_alone_name">密码</div>
						<div class="f_alone_input">
							<input class="f_p_input" type="password" name="Upwd" />
						</div>
						<!--提示消息-->
						<div class="f_pormat"></div>
					</div>
					<div class="f_alonediv">
						<div class="f_alone_name">地址</div>
						<div class="f_alone_input">
							<input class="f_p_input" type="text" name="Uadd" />
						</div>
						<!--提示消息-->
						<div class="f_pormat"></div>
					</div>
					<div class="f_alonediv">
						<div class="f_alone_name">手机号</div>
						<div class="f_alone_input">
							<input class="f_p_input" type="text" name="Uphone" />
						</div>
						<!--提示消息-->
						<div class="f_pormat"></div>
					</div>
					<div class="f_alonediv">
						<div class="f_alone_name">真实姓名</div>
						<div class="f_alone_input">
							<input class="f_p_input" type="text" name="Utruename" />
						</div>
						<!--提示消息-->
						<div class="f_pormat"></div>
					</div>
					<div class="f_alonediv">
						<div class="f_alone_name">性别</div>
						<div class="f_alone_input">
							<select name="Usex">
								<option value="0">----请选择----</option>
								<option value="男">男</option>
								<option value="女">女</option>
							</select> <i class=" iconfont icon-xiala"></i>
						</div>
						<!--提示消息-->
						<div class="f_pormat"></div>
					</div>
					<div class="f_alonediv">
						<div class="f_alone_name">出生日期</div>
						<div class="f_alone_input date">
        						<input type="text" name="Ubirthday" onclick="SelectDate(this,'yyyy-MM-dd')"/>
						</div>
						<!--提示消息-->
						<div class="f_pormat"></div>
					</div>
					<div class="f_alonediv">
						<div class="f_alone_name">用户身份</div>
						<div class="f_alone_input">
							<select name="Utype">
								<option value="0">----请选择----</option>
								<option value="3">买家</option>
								<option value="4">卖家</option>
							</select> <i class=" iconfont icon-xiala"></i>
						</div>
						<!--提示消息-->
						<div class="f_pormat"></div>
					</div>
					<div class="f_alonediv">
						<div class="f_alone_name">用户状态</div>
						<div class="f_alone_input">
							<select name="Ustatus">
								<option value="3">----请选择----</option>
								<option value="0">正常</option>
								<option value="1">冻结</option>
							</select> <i class=" iconfont icon-xiala"></i>
						</div>
						<!--提示消息-->
						<div class="f_pormat"></div>
					</div>
					<div class="f_alonediv1">
						<div class="f_alone_name"></div>
						<div class="f_alone_input1">
							<!--publicbtn-->
							<div class="publicf_btn">
								<div class="publicf_btn1 addensure">确定</div>
								<div class="publicf_btn2 fr Js_closeBtn">取消</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!--修改用户浮层  -->
	<div class="PublicFloatBox update">
		<div class="f_MiddleBox wid400">
			<div class="f_Head">
				<span>修改用户</span> <i
					class="Js_closeBtn iconfont icon-buoumaotubiao20 fr"></i>
			</div>
			<div class="f_content">
				<div class="f_alonediv">
					<div class="f_alone_name">用户名</div>
					<div class="f_alone_input">
						<input class="f_p_input" type="text" name="uUname" />
					</div>
					<!--提示消息-->
					<div class="f_pormat"></div>
				</div>
				<div class="f_alonediv">
					<div class="f_alone_name">密码</div>
					<div class="f_alone_input">
						<input class="f_p_input" type="password" name="uUpwd" />
					</div>
					<!--提示消息-->
					<div class="f_pormat"></div>
				</div>
				<div class="f_alonediv">
					<div class="f_alone_name">地址</div>
					<div class="f_alone_input">
						<input class="f_p_input" type="text" name="uUadd" />
					</div>
					<!--提示消息-->
					<div class="f_pormat"></div>
				</div>
				<div class="f_alonediv">
					<div class="f_alone_name">手机号</div>
					<div class="f_alone_input">
						<input class="f_p_input" type="text" name="uUphone" />
					</div>
					<!--提示消息-->
					<div class="f_pormat"></div>
				</div>
				<div class="f_alonediv">
					<div class="f_alone_name">真实姓名</div>
					<div class="f_alone_input">
						<input class="f_p_input" type="text" name="uUtruename" />
					</div>
					<!--提示消息-->
					<div class="f_pormat"></div>
				</div>
				<div class="f_alonediv">
					<div class="f_alone_name">性别</div>
					<div class="f_alone_input">
						<select name="uUsex">
							<option value="0">----请选择----</option>
							<option value="男">男</option>
							<option value="女">女</option>
						</select> <i class=" iconfont icon-xiala"></i>
					</div>
					<!--提示消息-->
					<div class="f_pormat"></div>
				</div>
				<div class="f_alonediv">
					<div class="f_alone_name">出生日期</div>
					<div class="f_alone_input date">
						<input type="text" name="uUbirthday"
							onclick="SelectDate(this,'yyyy-MM-dd')" />
					</div>
					<!--提示消息-->
					<div class="f_pormat"></div>
				</div>
				<div class="f_alonediv">
					<div class="f_alone_name">用户身份</div>
					<div class="f_alone_input">
						<select name="uUtype">
							<option value="0">----请选择----</option>
							<option value="3">买家</option>
							<option value="4">卖家</option>
						</select> <i class=" iconfont icon-xiala"></i>
					</div>
					<!--提示消息-->
					<div class="f_pormat"></div>
				</div>
				<div class="f_alonediv">
					<div class="f_alone_name">用户状态</div>
					<div class="f_alone_input">
						<select name="uUstatus">
							<option value="3">----请选择----</option>
							<option value="0">正常</option>
							<option value="1">冻结</option>
						</select> <i class=" iconfont icon-xiala"></i>
					</div>
					<!--提示消息-->
					<div class="f_pormat"></div>
				</div>
				<div class="f_alonediv1">
					<div class="f_alone_name"></div>
					<div class="f_alone_input1">
						<!--publicbtn-->
						<div class="publicf_btn">
							<div class="publicf_btn1 updateensure">确定</div>
							<div class="publicf_btn2 fr Js_closeBtn">取消</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!--返回顶部-->
	<a href="javaScript:void();" class="back-to-top"><i
		class="iconfont icon-fanhuidingbu"></i> </a>
	<script type="text/javascript">
		$(function() {
			//点击编辑
			var updateid=null;
			$(".Js_update").click(function(){
				updateid=$(this).attr("upid");
				$("[name=uUname]").val("");
				$("[name=uUpwd]").val("");
				$("[name=uUadd]").val("");
				$("[name=uUphone]").val("");
				$("[name=uUtruename]").val("");
				$("[name=uUsex] option[value='0']").prop("selected",true);
				$("[name=uUbirthday]").val("");
				$("[name=uUtype] option[value='0']").prop("selected",true);
				$("[name=uUstatus] option[value='3']").prop("selected",true);
				$.getJSON("../UserUpdate","opr=queryUser&uUid="+updateid,function(data){
					var jsonData=JSON.stringify(data);//转成json格式
					var user=$.parseJSON(jsonData);//装成json对象
					$("[name=uUname]").val(user.userName);
					$("[name=uUpwd]").val(user.userPwd);
					$("[name=uUadd]").val(user.userAddr);
					$("[name=uUphone]").val(user.userPhone);
					$("[name=uUtruename]").val(user.userTruename);
					var sex=user.userSex;
					$("[name=uUsex] option[value='"+sex+"']").prop("selected",true);
					$("[name=uUbirthday]").val(user.userBirthday);
					var type=user.userType;
					$("[name=uUtype] option[value='"+type+"']").prop("selected",true);
					var status=user.userStatus;
					$("[name=uUstatus] option[value='"+status+"']").prop("selected",true);
				})
				
			})
			//编辑点击确定
			$(".updateensure").click(function(){
					var uUname=$("[name=uUname]").val();
					var uUpwd=$("[name=uUpwd]").val();
					var uUadd=$("[name=uUadd]").val();
					var uUphone=$("[name=uUphone]").val();
					var uUtruename=$("[name=uUtruename]").val();
					var uUsex=$("[name=uUsex]").val();
					var uUbirthday=$("[name=uUbirthday]").val();
					var uUtype=$("[name=uUtype]").val();
					var uUstatus=$("[name=uUstatus]").val();
					
					 if(uUname==""){
						 $("[name=uUname]").parent().next().html("请输入用户名");
						 return;
					 }
					 if(uUpwd==""){
						 $("[name=uUpwd]").parent().next().html("请输入密码");
						 return;
					 }
					 if(uUadd==""){
						 $("[name=uUadd]").parent().next().html("请输入地址");
						 return;
					 } 
					 if(uUphone==""){
						 $("[name=uUphone]").parent().next().html("请输入手机号");
						 return;
					 }
					 if(!(/^1(3|4|5|6|7|8|9)\d{9}$/.test(uUphone))){ 
						 $("[name=uUphone]").parent().next().html("手机号码有误，请重填");
						 return;
					 }
					 if(uUtruename==""){
						 $("[name=uUtruename]").parent().next().html("请输入真实姓名");
						 return;
					 }
					 if(uUsex==0){
						 $("[name=uUsex]").parent().next().html("请选择性别");
						 return;
					 }
					 if(uUbirthday==""){
						 $("[name=uUbirthday]").parent().next().html("请输入出生日期");
						 return;
					 }
					 var reg=/^\d\d\d\d-\d\d-\d\d$/;
					 if(reg.test(uUbirthday)==false){
						 $("[name=uUbirthday]").parent().next().html("出生日期不合法");
						 return;
					 }
					 if(uUtype==0){
						 $("[name=uUtype]").parent().next().html("请选择用户身份");
						 return;
					 }
					 if(uUstatus==3){
						 $("[name=uUstatus]").parent().next().html("请选择用户状态");
						 return;
					 }
					$.getJSON("../UserUpdate","opr=uUpdate&uUid="+updateid+"&uUname="+uUname+"&uUpwd="+uUpwd+"&uUadd="+uUadd+"&uUphone="+uUphone+"&uUtruename="+uUtruename+"&uUsex="+uUsex+"&uUbirthday="+uUbirthday+"&uUtype="+uUtype+"&uUstatus="+uUstatus,function(data){
						if(data==true){
							$("#update"+updateid).prev().prev().prev().prev().prev().prev().prev().prev().prev().html(uUname);
							$("#update"+updateid).prev().prev().prev().prev().prev().prev().prev().prev().html(uUadd);
							$("#update"+updateid).prev().prev().prev().prev().prev().prev().prev().html(uUphone);
							$("#update"+updateid).prev().prev().prev().prev().prev().prev().html(uUtruename);
							$("#update"+updateid).prev().prev().prev().prev().prev().html(uUsex);
							$("#update"+updateid).prev().prev().prev().prev().html(uUbirthday);
							if(uUtype==3){
								var u="买家";
							}
							if(uUtype==4){
								var u="卖家";
							}
							$("#update"+updateid).prev().prev().html(u);
							if(uUstatus==0){
								var s="正常";
							}
							if(uUstatus==1){
								var s="冻结";
								
							}
							$("#update"+updateid).prev().html(s);
							$(".update").fadeOut(200);
						}
					})
					
				})
			
			
			
			
			
			
			
			
			
			//单选删除
			var deleteid=null;
			$(".Js_delete").click(function() {
				deleteid = $(this).attr("delid");
			})
			//删除点击确定
			$(".f_pormatBtn1").click(function() {
					$.ajax({
						url : "../UserDelete",
						type : "GET",
						data : "opr=delete&id=" + deleteid,
						dataType : "text",
						success : function(data) {
							if (data == "true") {
								$("#" + deleteid).remove();
								$(".f_delete").fadeOut(200);
							}
						}
					})
			})
			//添加
			var flag=false;
			$("[name=Uname]").blur(function(){
				var Uname=$("[name=Uname]").val();
				if(Uname==""){
					$("[name=Uname]").parent().next().html("请输入用户名");
					flag=false;
				}else{
					$.ajax({
						url:"../CheckUserName",
						type:"GET",
						data:"Uname="+Uname,
						dataType:"text",
						success:function(data){
							if(data=="true"){
								$("[name=Uname]").parent().next().html("用户名重复不可用");
								flag=false;
							}else{
								$("[name=Uname]").parent().next().html("用户名可用");
								flag=true;
							}
						}
					})
				}
			})
			
			//添加确定按钮
			 $(".addensure").click(function(){
				 $("[name=Upwd]").parent().next().html("");
				 $("[name=Uadd]").parent().next().html("");
				 $("[name=Uphone]").parent().next().html("");
				 $("[name=Uphone]").parent().next().html("");
				 $("[name=Utruename]").parent().next().html("");
				 $("[name=Usex]").parent().next().html("");
				 $("[name=Ubirthday]").parent().next().html("");
				 $("[name=Ubirthday]").parent().next().html("");
				 $("[name=Utype]").parent().next().html("");
				 $("[name=Ustatus]").parent().next().html("");
				 var Uname=$("[name=Uname]").val();//用户名
				 var Upwd=$("[name=Upwd]").val();//密码
				 var Uadd=$("[name=Uadd]").val();//地址
				 var Uphone=$("[name=Uphone]").val();//手机号
				 var Utruename=$("[name=Utruename]").val();//真实姓名
				 var Usex=$("[name=Usex]").val();//性别
				 var Ubirthday=$("[name=Ubirthday]").val();//出生日期
				 var Utype=$("[name=Utype]").val();//用户身份
				 var Ustatus=$("[name=Ustatus]").val();//用户状态
				 var pyz=true;
				 var byz=true;
				 if(Uname==""){
					 $("[name=Uname]").parent().next().html("请输入用户名");
					 flag=false;
				 }
				 if(Upwd==""){
					 $("[name=Upwd]").parent().next().html("请输入密码");
					 flag=false;
				 }
				 if(Uadd==""){
					 $("[name=Uadd]").parent().next().html("请输入地址");
					 flag=false;
				 } 
				 if(Uphone==""){
					 $("[name=Uphone]").parent().next().html("请输入手机号");
					 flag=false;
				 }
				 if(!(/^1(3|4|5|6|7|8|9)\d{9}$/.test(Uphone))){ 
					 $("[name=Uphone]").parent().next().html("手机号码有误，请重填");
				     pyz=false;
				 }
				 if(Utruename==""){
					 $("[name=Utruename]").parent().next().html("请输入真实姓名");
					 flag=false;
				 }
				 if(Usex==0){
					 $("[name=Usex]").parent().next().html("请选择性别");
					 flag=false;
				 }
				 if(Ubirthday==""){
					 $("[name=Ubirthday]").parent().next().html("请输入出生日期");
					 flag=false;
				 }
				 var reg=/^\d\d\d\d-\d\d-\d\d$/;
				 if(reg.test(Ubirthday)==false){
					 $("[name=Ubirthday]").parent().next().html("出生日期不合法");
					 byz=false;
				 }
				 if(Utype==0){
					 $("[name=Utype]").parent().next().html("请选择用户身份");
					 flag=false;
				 }
				 if(Ustatus==3){
					 $("[name=Ustatus]").parent().next().html("请选择用户状态");
					 flag=false;
				 }
				 
				 if(flag==true&&pyz==true&&byz==true){
					 $(".addform").submit();
				 }
			})
			//批量删除
			$(".Color5Btn").click(function() {
				var ids = [];
				if ($(".c:checked").length > 0) {
					$(".c:checked").each(function(i) {
						ids[i] = $(this).val();
					})
					location.href = "../UserBatchDelete?ids=" + ids;
				} else {
					alert("请选择你要删除的信息");
				}
			})
			//删除取消按钮
			$(".f_pormatBtn2").click(function() {
				$(".f_delete").fadeOut(200);
			});
			//退出
			$("#out").click(function() {
				location.href = "../AdminLoginOut";
			})

			var userName = $("#userName").text();
			if (userName == "") {
				location.href = "login.jsp";
			}
			//全选和反选
			$("#inputcheck").click(function() {
				if (this.checked == true) {
					$(".c").prop("checked", true);
				} else {
					$(".c").prop("checked", false);
				}
			})
			//复选框
			$(".c").click(function() {
				var clength = $(".c").length;
				var allcheck = $(".c:checked").length;
				if (clength == allcheck) {
					$("#inputcheck").prop("checked", true);
				} else {
					$("#inputcheck").prop("checked", false);
				}
			})
			//查询
			$(".submit").click(function() {
				$("[name=currentPage]").val(1);
				$("#form").submit();
			})
			//首页
			$("#firstPage").click(function() {
				$("[name=currentPage]").val(1);
				$("#form").submit();
			})
			//尾页
			$("#lastPage").click(function() {
				var totalPage = parseInt($("#totalPage").text());
				$("[name=currentPage]").val(totalPage);
				$("#form").submit();
			})
			//上一页
			$("#prevPage").click(function() {
				var currentPage = parseInt($("#currentPage").text());
				if (currentPage - 1 <= 1) {
					$("[name=currentPage]").val(1);
				} else {
					$("[name=currentPage]").val(currentPage - 1);
				}
				$("#form").submit();
			})
			//下一页
			$("#nextPage").click(function() {
				var currentPage = parseInt($("#currentPage").text());
				var totalPage = parseInt($("#totalPage").text());
				if (currentPage + 1 >= totalPage) {
					$("[name=currentPage]").val(totalPage);
				} else {
					$("[name=currentPage]").val(currentPage + 1);
				}
				$("#form").submit();
			})
		})
		
		
		
	</script>
	
	
</body>
</html>