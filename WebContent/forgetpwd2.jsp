<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Author" contect="http://www.webqin.net">

<title>忘记密码</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.8.3-min.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">

</script>
</head>
<style>
#btn{
 top: 100px
font-size:14px;
margin : 2px;
width: 90px;
height: 30px;
}
.phone{
	margin-top:1px;
	display:none;
		color:red;
	width: 338px;
	height: 24px;
	float: right
}
.subtijiao{
	margin-top:21px;
	float: right;
	width: 345px;
	
	
		}
	
</style>
<body>
  <div class="content">
   <div class="web-width">
     <div class="for-liucheng">
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liulist"></div>
      <div class="liulist"></div>
      <div class="liutextbox">
       <div class="liutext for-cur"><em>1</em><br /><strong>填写账户名</strong></div>
       <div class="liutext for-cur"><em>2</em><br /><strong>验证身份</strong></div>
       <div class="liutext"><em>3</em><br /><strong>设置新密码</strong></div>
       <div class="liutext"><em>4</em><br /><strong>完成</strong></div>
      </div>
     </div><!--for-liucheng/-->
     <form  action="forgetPwd3.jsp" method="get" class="forget-pwd">
       <dl>
        <dt>验证方式：</dt>
        <dd>
         <select class="selyz">
          <option value="0">已验证手机</option>
         </select>
        </dd>
        <div class="clears"></div>
       </dl>
       
       
       <dl class="sel-yzsj">
        <dt>已验证手机：</dt>
      		<input type="hidden" value="false" calss="ValidateDx" name="dxflag"/>
        <dd><input type="text" value="${phone}" id='phone' readonly /></dd>
        <div class="clears"></div>
       </dl> 
       <dl>
        <dt>手机校验码：</dt>
        <dd><input type="text" id=VerificationCode /><input type="button" id="btn" value="获取验证码"  id=btn>    <div class="phone"></div></dd>
     
       </dl>
       
       <div class="subtijiao"><input type="submit" value="提交"  /></div> 
      </form><!--forget-pwd/-->
   </div><!--web-width/-->
  </div><!--content/-->
 
</body>
<script type="text/javascript">
//手机验证码的倒计时
$(function () {
	var error_clickTime=false;	 
	var error_yzm=false; 
	 var phone="${phone}"
	 if (phone=="") {
		 location.href='Demo.jsp';
	}
	$('#btn').click(function () {
		 clickTime();
       })
       $('#VerificationCode').blur(function() {
    	   check_useryam();
	})
       
	function clickTime() {
		transmit();
		error_clickTime=false;
			  var count = 100;
                var countdown = setInterval(CountDown, 500);
                function CountDown() {
                    $("#btn").attr("disabled", true);
                    $("#btn").val( count + "s后重新获取");
                    if (count == 0) {
                        $("#btn").val("获取验证码").removeAttr("disabled");
                        clearInterval(countdown);
                        error_clickTime==true;
                      
                    }
                    count--;
                }
		
	
	}
	 function transmit() {
		$.post("Doresetting","opr=dx&phone3=",function(data){	
		})
	} 
	 
	 
	 function check_useryam() {
			var yzm=$('#VerificationCode').val();
			if (yzm=="") {
				$('.phone').html('请输入验证码！！')
				$('.phone').show();
				error_yzm=true
				return false;
				
			}else if (error_clickTime==true) {
				$('.phone').html('验证失效请重新获取验证码！！')
				$('.phone').show();
				error_yzm=true;
			}else{
				$.post("Doresetting","opr=yzm&name="+yzm,function(data){
					if (data=="false") {
						$('.phone').html('请输入正确验证码！！');
						$('.phone').show();
						error_yzm=true
						return false;
					}else{
						$("[name=dxflag]").val("true");
						$('.phone').hide();
						error_yzm = false;
					}
				})
			}
		}
	 $('.subtijiao').click(function() {
		 check_useryam();
		 if (error_yzm==false&&error_clickTime==false) {
			$('#VerificationCode').val("");
			return true;
		}else{
			return false;
		}
	})
	 
	
        });
</script>
</html>
