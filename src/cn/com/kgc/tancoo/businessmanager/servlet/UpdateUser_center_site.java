package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.kgc.tancoo.businessmanager.entity.User;
import cn.com.kgc.tancoo.businessmanager.server.impl.UserServerImpl;

/**
 * Servlet implementation class UpdateUser_center_site
 */
@WebServlet("/UpdateUser_center_site")
public class UpdateUser_center_site extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 /* response.setCharacterEncoding("UTF-8");
		  request.setCharacterEncoding("UTF-8"); HttpSession session =
		  request.getSession(); PrintWriter out = response.getWriter();
		  response.setContentType("text/html;charset=UTF-8"); User user = (User)
		  session.getAttribute("user"); if(user!=null) {
		  request.setAttribute("username", user.getUserName()); } String userName =
		  request.getParameter("username"); String userAddr =
		  request.getParameter("useraddress"); String userPhone =
		  request.getParameter("userphone"); UserServerImpl usi = new UserServerImpl();
		  User newuser = new User(user.getUserId(), user.getUserName(),
		  user.getUserPwd(), userAddr, userPhone, userName, user.getUserSex(),
		  user.getUserBirthday(), user.getUserRegtime(), user.getUserType(),
		  user.getUserStatus(), user.getUserStatu()); if(usi.update(newuser)==0) {
		  out.println(
		  "<script>alert('修改失败');location.href='DoUser_center_site'</script>"); }else {
		  session.removeAttribute("user"); session.setAttribute("user", newuser);
		  out.println(
		  "<script>alert('修改成功');location.href='DoUser_center_site'</script>"); }*/
		 
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();//
		 HttpSession session = request.getSession();	
		 
		
		 User user = (User) session.getAttribute("user");//用户的登陆账号
		 String opr=request.getParameter("opr");
		 String userName = request.getParameter("name");// 姓名
		String phone = request.getParameter("phone");// 手机号
		String userAddr = request.getParameter("useraddress");
		UserServerImpl usi = new UserServerImpl();
		if (userName!=null && phone!=null && userAddr!=null) {
			
			user.setUserAddr(userAddr);
			user.setUserName(userName);
			user.setUserPhone(phone);
			if (usi.add(user) == 1) {
				out.print("<script>alert('修改成功');location.href='DoUser_center_site';</script>");
			} else {
				out.print("<script>alert('修改失败');location.href='DoUser_center_site';</script>");
			}
		}else if(opr!=null&&opr.equals("yzphone")) {
			String yphone=request.getParameter("name");
			if(yphone.equals(user.getUserPhone())) {
				out.print("false");
			}else {
				int num=usi.queryPhone(yphone);
				if (num>=1) {
					out.print("true");
				}else {
					out.print("false");
				}
			}
				
		}else if (opr!=null&&opr.equals("yzUser")) {
			String name = request.getParameter("name");// 姓名
			if(name.equals(user.getUserName())) {
				out.print("false");
			}else {
				if (usi.checkUserName(name)!=0) {
					out.print("true");
				}else {
					out.print("false");
				}
			}
			
		}		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}