package cn.com.kgc.tancoo.businessmanager.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.kgc.tancoo.businessmanager.entity.Admin;
import cn.com.kgc.tancoo.businessmanager.server.impl.AdminServerImpl;



/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminLogin() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String adminName=request.getParameter("adminName");
		String adminPwd=request.getParameter("adminPwd");
		AdminServerImpl asi=new AdminServerImpl();
		PrintWriter out=response.getWriter();
		Admin a=asi.login(adminName, adminPwd);
		if(a!=null) {
			String check=request.getParameter("inputcheck");
			if(check!=null&&check.equals("checked")) {
				adminName=URLEncoder.encode(adminName, "UTF-8");
				Cookie cookie1=new Cookie("name",adminName);
				Cookie cookie2=new Cookie("pwd",adminPwd);
				cookie1.setMaxAge(60*60*24*30);
				cookie2.setMaxAge(60*60*24*30);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
			}else {
				/*Cookie[] cks=request.getCookies();
			for (Cookie ck : cks) {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}*/
			}
			HttpSession session=request.getSession();
			session.setAttribute("a",a);
			response.sendRedirect("AdminDoLogin");
		}else {
			out.print("<script>alert('账号或密码错误！请重试！');location.href='HOUTAI/login.jsp'</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
