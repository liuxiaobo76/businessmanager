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
				<c:if test="${a.adminAuth==1 }">
					<a href="../GetAll">
						<li class="Select"><i class="iconfont icon-yonghuguanli"></i><span>管理员管理</span></li>
					</a>
				</c:if>
				<c:if test="${a.adminAuth==1 }">
					<a href="../UserGetAll">
						<li><i class="iconfont icon-tubiao_dingdan"></i><span>用户管理</span></li>
					</a>
				</c:if>
				<c:if test="${a.adminAuth==2 }">
					<a href="../UserGetAll">
						<li class="Select"><i class="iconfont icon-tubiao_dingdan"></i><span>用户管理</span></li>
					</a>
				</c:if>
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
				<form action="../GetAll" method="post" id="form">
					<div class="InquireBox clearfix">
						<div class="InquireleftBox">
							<div class="Text">用户名：</div>
							<div class="InputDiv">
								<input name="adminName" value="${adminName}" class="phoneInput"
									placeholder="请输入你需要查询的用户名" />
							</div>
						</div>
						<input type="hidden" name="currentPage" value="${currentPage}" />
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

							<thead id="admin">
								<tr>
									<td><input id="inputcheck" class="inputcheck"
										type="checkbox" name="allcheck" /> <label for="inputcheck"></label>
										<span>全选</span></td>
									<td>ID</td>
									<td>用户名</td>
									<td>密码</td>
									<td>管理员级别</td>
									<td>操作</td>
								</tr>

							</thead>


							<c:if test="${!empty list }">
								<tbody>
									<c:forEach items="${list }" var="a">
										<tr id="${a.adminId }">
											<td><input id="${a.adminId }i" class="inputcheck c"
												type="checkbox" name="inputcheck" value="${a.adminId }" />
												<label for="${a.adminId }i"></label></td>

											<td>${a.adminId }</td>
											<td>${a.adminName }</td>
											<td>${a.adminPwd }</td>
											<td>${a.userStatus }</td>
											<td id="update${a.adminId }">

												<div upid="${a.adminId }"
													class="PublicTableBtnIcon Color3Btn Js_update">
													<i class="iconfont icon-tubiaozhizuomobanyihuifu-"></i> <span>编辑</span>
												</div>

												<div delid="${a.adminId }"
													class="PublicTableBtnIcon Color4Btn Js_delete">
													<i class="iconfont icon-shanchu"></i> <span>删除</span>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</c:if>
						</table>
						<c:if test="${empty list }">
							<tbody>
								<p style="font-size: 30px">未查询到"${adminName }"的用户</p>
							</tbody>
						</c:if>
					</div>
					<!--分页-->
					<div class="PageNumber">
						<p hidden="hidden">
							[<span id="currentPage">${currentPage }</span>/<span
								id="totalPage">${totalPage }</span>]
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
	<form action="../AdminAdd" method="post" class="addform">
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
							<input class="f_p_input" type="text" name="Aname" />
						</div>
						<!--提示消息-->
						<div class="f_pormat"></div>
					</div>
					<div class="f_alonediv">
						<div class="f_alone_name">密码</div>
						<div class="f_alone_input">
							<input class="f_p_input" type="password" name="Apwd" />
						</div>
						<!--提示消息-->
						<div class="f_pormat"></div>
					</div>
					<div class="f_alonediv">
						<div class="f_alone_name">级别：</div>
						<div class="f_alone_input">
							<select name="AAuth">
								<option value="0">----请选择----</option>
								<option value="2">普通管理员</option>
								<option value="1">超级管理员</option>
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
					<div class="f_alone_name">用户名：</div>
					<div class="f_alone_input">
						<input class="f_p_input" type="text" name="uAname" />
					</div>
					<!--提示消息-->
					<div class="f_pormat"></div>
				</div>
				<div class="f_alonediv">
					<div class="f_alone_name">密码：</div>
					<div class="f_alone_input">
						<input class="f_p_input" type="password" name="uApwd" />
					</div>
					<!--提示消息-->
					<div class="f_pormat"></div>
				</div>
				<div class="f_alonediv">
					<div class="f_alone_name">级别：</div>
					<div class="f_alone_input">
						<select name="uAauth">
							<option value="0">----请选择----</option>
							<option value="2">普通管理员</option>
							<option value="1">超级管理员</option>
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
			var updateid = null;
			$(".Js_update").click(
					function() {
						updateid = $(this).attr("upid");
						$("[name=uAname]").val("");
						$("[name=uApwd]").val("");
						$("[name=uAauth] option[value='0']").prop("selected",
								true);
						$.getJSON("../AdminUpdate", "opr=queryAdmin&uAdminId="
								+ updateid, function(data) {
							var jsonData = JSON.stringify(data);//转成json格式
							var admin = $.parseJSON(jsonData);//转成json对象
							$("[name=uAname]").val(admin.adminName);
							$("[name=uApwd]").val(admin.adminPwd);
							var auth = admin.adminAuth;
							$("[name=uAauth] option[value='" + auth + "']")
									.prop("selected", true);
						})

					})
			//编辑  点击确认
			$(".updateensure").click(
					function() {
						var adminName = $("[name=uAname]").val();
						var adminPwd = $("[name=uApwd]").val();
						var adminAuth = $("[name=uAauth]").val();
						if (adminName == "") {
							$("[name=Aname]").parent().next().html("请输入用户名");
							return;
						}
						if (adminPwd == "") {
							$("[name=Apwd]").parent().next().html("请输入密码");
							return;
						}
						if (adminAuth == 0) {
							$("[name=AAuth]").parent().next().html("请选择级别");
							return;
						}
						$.getJSON("../AdminUpdate", "opr=aUpdate&uAid="
								+ updateid + "&uAname=" + adminName + "&uApwd="
								+ adminPwd + "&uAauth=" + adminAuth, function(
								data) {
							if (data == true) {
								$("#update" + updateid).prev().prev().prev()
										.html(adminName);
								$("#update" + updateid).prev().prev().html(
										adminPwd);
								if (adminAuth == 1) {
									var a = "超级管理员";
								}
								if (adminAuth == 2) {
									var a = "普通管理员";
								}
								$("#update" + updateid).prev().html(a);
								$(".update").fadeOut(200);
							}
						})
					})

			//单选删除
			var deleteid = null;
			$(".Js_delete").click(function() {
				deleteid = $(this).attr("delid");
			})
			//点击确定
			$(".f_pormatBtn1").click(function() {
				$.ajax({
					url : "../AdminDelete",
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
			var flag = false;
			$("[name=Aname]").blur(
					function() {
						var Aname = $("[name=Aname]").val();
						if (Aname == "") {
							$("[name=Aname]").parent().next().html("请输入用户名");
							flag = false;
						} else {
							$.ajax({
								url : "../CheckAdminName",
								type : "get",
								data : "Aname=" + Aname,
								dataType : "text",
								success : function(data) {
									if (data == "true") {
										$("[name=Aname]").parent().next().html(
												"用户名重复不可用");
										flag = false;
									} else {
										$("[name=Aname]").parent().next().html(
												"用户名可用");
										flag = true;
									}
								}
							})
						}
					})
			//添加确定按钮
			$(".addensure").click(function() {
				var Aname = $("[name=Aname]").val();
				var Apwd = $("[name=Apwd]").val();
				var AAuth = $("[name=AAuth]").val();
				if (Aname == "") {
					$("[name=Aname]").parent().next().html("请输入用户名");
					flag = false;
				}
				if (Apwd == "") {
					$("[name=Apwd]").parent().next().html("请输入密码");
					flag = false;
				}
				if (AAuth == 0) {
					$("[name=AAuth]").parent().next().html("请选择级别");
					flag = false;
				}
				if (flag == true) {
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
					location.href = "../BatchDelete?ids=" + ids;
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