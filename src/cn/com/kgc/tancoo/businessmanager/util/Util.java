package cn.com.kgc.tancoo.businessmanager.util;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

import com.ucpaas.restDemo.client.AbsRestClient;
import com.ucpaas.restDemo.client.JsonReqClient;

public class Util {
	private static int id;
	 /**
	    * 将短时间格式时间转换为字符串 yyyy-MM-dd
	    * 
	    * @param dateDate
	    * @param k
	    * @return
	    */
	 public static String dateToStr(Date dateDate) {
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	    String dateString = formatter.format(dateDate);
	    return dateString;
	 }
	 /**
	    * 将短时间格式字符串转换为时间 yyyy-MM-dd 
	    * 
	    * @param strDate
	    * @return
	   */
	 public static Date strToDate(String strDate) {
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	    ParsePosition pos = new ParsePosition(0);
	    Date strtodate = formatter.parse(strDate, pos);
	    return strtodate;
	}
	 public static String dateToStr1(Date dateDate) {
		    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		    String dateString = formatter.format(dateDate);
		    return dateString;
		 }
	 private static AbsRestClient InstantiationRestAPI() {
			return new JsonReqClient();
		}
		
	
		public static String  testSendSms(String mobile,String param){
			String sid = "e12db3d19ac79a695459ae0c7ca46d6a";
			String token = "7eae63687799ee12f36037023c21ded5";
			String appid = "d9fe918c034b40f3b0f7f96c387e2a63";
			String templateid = "509472";
			String uid="";
			try {
				return InstantiationRestAPI().sendSms(sid, token, appid, templateid, param, mobile, uid);
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		/**
		 * 将手机号中间4位隐藏
		 * @param phone
		 * @return
		 */
		public static String hidePhoneNum(String phone){
			String result = "";
			if (phone != null && !"".equals(phone)) {
					result = phone.substring(0, 3) + "****" + phone.substring(7);
				}
			return result;

		}
	public static String getRandom() {
		id++;
		Date date = new Date();
		String strDate = dateToStr1(date).substring(0,8);
		String str = "";
		if(id/10==0) {
			str ="00000"+id;
		}else if(id/100==0) {
			str = "0000"+id;
		}else if(id/1000==0) {
			str = "000"+id;
		}else if(id/10000==0) {
			str = "00"+id;
		}else if(id/100000==0) {
			str = "0"+id;
		}else {
			id=1;
			str="000001";
		}
		return strDate+str;
	}
	@Test
	public void tests() {
		System.out.println(getRandom());
	}
	 
}
