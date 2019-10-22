package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.kgc.tancoo.businessmanager.entity.User;
import cn.com.kgc.tancoo.businessmanager.server.impl.UserServerImpl;

/**
 * Servlet implementation class DoLogin
 */
@WebServlet("/DoLogin")
public class DoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");	
		 response.setCharacterEncoding("UTF-8");
		 response.setContentType("text/html;charset=UTF-8");
		 HttpSession session = request.getSession();	
		 String name =request.getParameter("username");
		 String pwd =request.getParameter("pwd");
		  PrintWriter out=response.getWriter();//
		 UserServerImpl  getAct=new UserServerImpl();
		 			if (name!=null&&pwd!=null) {
		 				 	User yz=getAct.login(name, pwd);
		 				 	request.setAttribute("user", yz);
		 				 	if (yz==null) {
		 				 		out.print("<script>alert('账号或密码错误');location.href='login.jsp';</script>");	
		 					}else {
		 						 session.setAttribute("user", yz);
		 						request.getRequestDispatcher("index.jsp").forward(request, response);
		 					}	
					}
			 String opr=request.getParameter("opr");
			
			 if (opr!=null&&opr.equals("yzUser")) {
				String yzname=request.getParameter("name");
				int num=getAct.yzUesr(yzname);
				out.print(num);
			}
		}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
