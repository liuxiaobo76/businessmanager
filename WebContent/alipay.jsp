<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form action="sendAlipay" method="post">
       付款多少:	<input type="text" name="WIDtotal_amount"/>
  	订单名称： <input type="text" name="WIDsubject" />
       商品描述：	<input type="text" name="WIDbody"/>
  	<input type="submit" value="去付款" />
  </form>
</body>
</html>