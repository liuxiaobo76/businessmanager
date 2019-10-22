<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>个人中心</title>
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
                <a href="UserManagement.jsp"> <li class="Select"><i class="iconfont icon-yonghuguanli"></i><span>个人中心</span></li></a>
                <a href="OrderGetAll">
                    <li><i class="iconfont icon-tubiao_dingdan"></i><span>订单管理</span></li>
                </a>
                <a href="PtypeGetAll">
                    <li><i class="iconfont icon-fenlei"></i><span>分类管理</span></li>
                </a>
                <a href="ProductGetAll"><li><i class="iconfont icon-weibiaoti1"></i><span>商品管理</span></li></a>
            </ul>
        </div>
        <!--右侧-->
        <div class="RightBox Js_RightBox">
            <div class="PublicContentBox">
                <!--公用指向页面名字-->
                <div class="PublicPointToAgeText">
                    <span class="span1">个人中心</span> <span class="span2">个人管理中心</span>
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
                            <span class="span1">个人信息</span>
                        </div>
                        <!--批量删除-->
                        <div class="PublicBtnIcon Color5Btn">
                            <i class="iconfont icon-yonghuguanli"></i>
                          <!--  <span>批量删除</span>-->
                        </div>
                        <!--<div class="PublicBtnIcon Color2Btn fr Js_edit">
                            <i class="iconfont icon-tubiaozhizuomobanyihuifu-"></i>
                            <!--<span>编辑</span>-->
                       <!-- </div>-->
                    </div>
                    <!--查询到的表格-->
                    <div class="InquireSelectTable">
                        <table class="PublicTableCss">
                            <thead>
                                <tr>
                                    <td>
                                        <input id="inputcheck" class="inputcheck" type="checkbox" name="inputcheck" />
                                        <!--<label for="inputcheck"></label>-->
                                        <span>用户编号 </span>
                                    </td>
                                    <td>${user.userId}</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <input id="aa" class="inputcheck" type="checkbox" name="inputcheck" />
                                        <!--<label for="aa"></label>-->
                                        <span>用户名</span>
                                    </td>
                                    <td>${user.userName}</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input id="aa" class="inputcheck" type="checkbox" name="inputcheck" />
                                        <span>联系方式</span>
                                    </td>
                                    <td>${user.userphone}</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input id="aa" class="inputcheck" type="checkbox" name="inputcheck" />
                                        <span>地址</span>
                                    </td>
                                    <td>${user.userAddr}</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input id="aa" class="inputcheck" type="checkbox" name="inputcheck" />
                                        <span>注册时间</span>
                                    </td>
                                    <td>${user.userregtime}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                    <div style="height: 50px" >
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--返回顶部-->
    <a href="javaScript:void();" class="back-to-top"><i class="iconfont icon-fanhuidingbu"></i> </a>
</body>
</html>