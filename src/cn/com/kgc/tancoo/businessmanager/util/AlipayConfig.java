package cn.com.kgc.tancoo.businessmanager.util;

public class AlipayConfig {
	
	  // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
		public static String app_id = "2016101500695957";
		
		// 商户私钥，您的PKCS8格式RSA2私钥
	    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDAImg4OLN5pwGmksjim9X1I97Z9Fx2w18xNJoPRUkF+8musYoATO4ZDvRqYd5hSZoGRHx0geUVrz/CXb5nQlyPFie//VPRlFovYzcajYtdb1wBniE2eVshLpZjfPIHzBoeapOreqx11eda/ai6l7c2uhXvqp6Lgv0JV9w/NtyQLD5HpwmfTs/JBTptruImO+kSlx5A2tz+ui7fwsW6hYX6QgxkxKJ8dOUGsDu0mMqiYB4srPZ+tjcJpHR2+mTCLCbQRrUnaP0fBHiTgqNr6eGDlUX8rnN1lYa5tI3RB65iBF/NQ772okQJMtTq1dQYOqS1qHMW1EbAKvoJr32urcRrAgMBAAECggEAFSV0TQPIlRIRd3DeVTqLkOByzZA8gQG9v1+nuRiKEfOFXgnCQ4g0CGQB+Jdu70w3fIsbG4OUYA+at9yzcQ/3ufPZSiMqj32Bc4e679w2Q4FXIgJya1lt8zf6a1a8GKmZElHukMf+pTV2sigK4waBrq9KbMddjcNL8DRQVFDIc8GJhRuWj2nRRxO5CHZNMhaGtJmnteLYMv3d0u2yQjhFvVDdIBWL34ui8fpAhjfbJDsm0uFCg/tz7JZ9QcKgsuIn7THdZ7jDxmXXYHQAQ81ynhXtbD5gMSRNB/lmyR1wsZrtRe4pNc3bHm7y6GXKwot3Wfk68IeslsdTQix7Hg3VCQKBgQD/qFcgpjIURIbU+vNYlNAFjn0M+6kzjefNhIaVdD+v68r0P/zv3LKN8/YT5D/hEuAy039LIwx5EyHxpDbbO8cLYuicZ7DBw/m5L9tvCQcCjhZUye7js8iQO/gZ3oxlOQ0AtqYxW15seuRDCGGGY6QLSRoGzR/lMHzUhix3IYYpHQKBgQDAZEk2xTXV/3i/zYsaiXIbaR2R8XMtFZs7q/WyJApIbLWLLGMLoieLXaSF/dV5gsiIbrgAR9MOtF/geffe71AaWZsxE0Kzs5JDFnIekOSzmt3mOa0gQovUcfAH0mOnvkHEERA4mwy5+zE95kM2lqkzVcALDL502kA6ZoZHzRy1JwKBgQC/sYXC4Vrjf45p29DjNpHT2MdDGOAB3AFXRGt1XLj0O6TuB5ysbZskfSyiNZ8AMJsTASqNODZ+Ai6NdUf8kpHoo70uqUELyNpSVOQAGZC8BbYQ1WjeK0vTemPJYel7bI+nXUy37X6bcHn/GSWnEsdJ/wIY321u+DBhWkm0+doSsQKBgBwRRWEZKj57E8mfmfCYJq57ClZVTEFCirAM6T5A5cMlIOMZ6aUz1eMOGUd2/aLJgqnsxSk9UTwu8mHUSWYbsar2cZ6aObvvsaHZ73IoH0VYjZDdzzUKoE2xBZyOg/1f00ZgWuZ3MEcdr1RheGLJXgvgMbEq/cocYQxkEqj88ng3AoGBAPqJsvvksGhJ7+qKZI3YosBWxkS6oPpFyjhW3/9URyXzclIGnB3b/yHJ1Jm3DaVkJn5LcqQB6fvGd+Ts1X4M7C5KG5w/WKh8QjiUY0BPzkFwz+xANbHUU3AC20orbUkkiT1fnCzpqtThFiFRAaKzW8SzZ4bqs6SNOJR15DIOfzBM";
		
		// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
	    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsRh0ev/4saM6tZMvO9P/tQh6jM8CImXzAqWtNGoCAYZ6qta1BEp3FUn6FHgFYLUYiqPjcUEVZYazK8Y0wmE24ikxgiYCnHyIRcQZpqPeSSwFR9n9xcAb6xs+QWtMg8WHUn2CZOQKqUXTM7+3fDg8CdptvUu9SxWxsCUItKuGvRq84qmL18eq4He1kF3N3+SGM2WX2KRvwYlIqHJAxJ+fdKqnSkhY7GDrKzUNBrhK+kCEH8f20+OEtKrCYkJ2fmBBLb86Glv5CsRM4aTSnTgqKJc7oNbcYe++DC4LWXmZXznsWS54/vgU7tc1Ft3LAqsfMD0PhkpYaoqEFQ9m6ara1wIDAQAB";

		// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
		public static String notify_url = "http://localhost:8080/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

		// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
		public static String return_url = "http://localhost:8080/businessmanager/queryPay";

		// 签名方式
		public static String sign_type = "RSA2";
		
		// 字符编码格式
		public static String charset = "utf-8";
		
		// 支付宝网关
		public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
		
		// 支付宝网关
		public static String log_path = "C:\\";
}
