package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.kgc.tancoo.businessmanager.entity.User;
import cn.com.kgc.tancoo.businessmanager.server.impl.UserServerImpl;
import cn.com.kgc.tancoo.businessmanager.util.Util;

/**
 * Servlet implementation class Doresetting
 */
@WebServlet("/Doresetting")
public class Doresetting extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();//\
		 HttpSession session = request.getSession();	
		 UserServerImpl uDi = new UserServerImpl();
		 
		 
		 
		String opr=request.getParameter("opr");
		User user = (User) session.getAttribute("uname");// 手机号
		String pwd=request.getParameter("pwd");
		if (opr!=null&&opr.equals("yzname")) {
			String userName=request.getParameter("name");
			User uname=uDi.userNameQreuery(userName);
			if (uname!=null) {
				out.print("true");
				session.setAttribute("uname", uname);
				 User phone=(User) session.getAttribute("uname");
				 session.setAttribute("phone", Util.hidePhoneNum(phone.getUserPhone()));
			}else {
				out.print("false");
			}
			
			
			
		}else if(opr!=null&&opr.equals("dx")) {//短信发送
			User phonedx = (User) session.getAttribute("uname");// 手机号
		String phone=phonedx.getUserPhone();
			if (phonedx!=null) {
				Random random=new Random();
				String  ran1 ="";
				for (int i = 0; i < 6; i++) {
					ran1+=random.nextInt(10);
					}	
				session.setAttribute("dx",ran1);
				String dx=Util.testSendSms(phone, ran1);
				System.out.println(ran1);
					if (dx==null) {
						out.print("true");
					}else {
						out.print("false");
					}
					
				}
		}else if (opr!=null&&opr.equals("yzm")) {
			String yzm=request.getParameter("name");
			String dx=(String) session.getAttribute("dx");
			if (yzm.equals(dx)) {
				out.print("true");
			
			}else {
				out.print("false");
			}
		}else if(user==null) {
			out.print("<script>alert('权限失效请重新操作');location.href='Demo.jsp'</script>");
		}
		
		if (user!=null&&pwd!=null) {
			User updated=new User(user.getUserId(), user.getUserName(),pwd , user.getUserAddr(), user.getUserPhone(), user.getUserTruename(), user.getUserSex(), user.getUserBirthday(), user.getUserRegtime(), user.getUserType(), user.getUserStatus()); 
			int num=uDi.update(updated);
			if (num>0) {
				/*session.invalidate();*/
				out.print("<script>location.href='forgetPwd4.jsp'</script>");
				
			}else {
				out.print("<script>alert('密码重置失败请重新操作');location.href='Demo.jsp'</script>");
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
