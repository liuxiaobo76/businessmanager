package cn.com.kgc.tancoo.businessmanager.util;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Util {
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
}
