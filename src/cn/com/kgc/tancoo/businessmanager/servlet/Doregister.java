package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.kgc.tancoo.businessmanager.dao.impl.UserDaoImpl;
import cn.com.kgc.tancoo.businessmanager.entity.User;
import cn.com.kgc.tancoo.businessmanager.server.impl.UserServerImpl;
import cn.com.kgc.tancoo.businessmanager.util.Util;

/**
 * Servlet implementation class Doregister
 */
@WebServlet("/Doregister")
public class Doregister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();//\
		 HttpSession session = request.getSession();	
		 UserServerImpl uDi = new UserServerImpl();
		String opr=request.getParameter("opr");
		
		String user_name = request.getParameter("user_name");// 姓名

		String userAddr ="";
	
		String userTruename ="";
		
		String userSex = request.getParameter("userSex");// 性别
		

		String userBuy = request.getParameter("userBuy");// 买家卖家
		
			int userType=0;
			if (userBuy!=null) {
				userType = Integer.parseInt(userBuy);	
			}
			
		String YYYY = request.getParameter("YYYY");// 年
		
		String MM = request.getParameter("MM");// 月

		String DD = request.getParameter("DD");// 日
		String time = YYYY + "-" + MM + "-" + DD;
		String phone = request.getParameter("phone");// 手机号
		String pwd = request.getParameter("pwd");// 密码
//注册时间 now（） ,user.getUserRegtime(),
	
		if (user_name!=null&pwd!=null& phone!=null&userSex!=null&time!=null&userType!=0) {
			User user = new User(0, user_name, pwd, userAddr, phone, userTruename, userSex, time, new Date(), userType, 0);
			if (uDi.add(user) == 1) {
				out.print("<script>alert('账号注册成功');location.href='login.jsp';</script>");
			} else {
				out.print("<script>alert('账号注册失败请重新注册');location.href='login.jsp';</script>");
			}
		}else if(opr!=null&opr.equals("yzphone")) {
		String yphone=request.getParameter("name");
			int num=uDi.queryPhone(yphone);
			
			if (num>=1) {
			
				out.print("true");
			}else {
				out.print("false");
			}
		}else if(opr!=null&opr.equals("dx")) {
			String phonedx = request.getParameter("phone3");// 手机号
			Random random=new Random();
			String  ran1 ="";
			for (int i = 0; i < 6; i++) {
				ran1+=random.nextInt(10);
			}	
			session.setAttribute("dx",ran1);
			Util.testSendSms(phonedx, ran1);
			out.print("true");
			
		}else if (opr!=null&opr.equals("yzm")) {
			String yzm=request.getParameter("name");
			String dx=(String) session.getAttribute("dx");
			System.out.println();
			if (yzm.equals(dx)) {
				out.print("true");
			}else {
				out.print("false");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
// TODO Auto-generated method stub
		doGet(request, response);
	}
}
