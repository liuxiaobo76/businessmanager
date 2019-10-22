package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.kgc.tancoo.businessmanager.entity.Product;
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
		 PrintWriter out=response.getWriter();//
		 HttpSession session = request.getSession();	
		 String opr=request.getParameter("opr");
		 UserServerImpl  getAct=new UserServerImpl();
		 List<Product> list = new ArrayList<Product>();
		 session.setAttribute("list", list);
		 
		 if (opr!=null&opr.equals("dologin")) {
				 String name =request.getParameter("name");
				
				 String pwd =request.getParameter("pwd");
				
				 	User yz=getAct.login(name, pwd);
				 	
				 	
				 	request.setAttribute("user", yz);
				 	if (yz!=null) {
				 			session.setAttribute("user", yz);
				 		out.print("true");
					}else {
						out.print("false");		
					}	
				 	
		}else if(opr!=null&&opr.equals("yzUser")) {
					String yzname=request.getParameter("name");
					int num=getAct.yzUesr(yzname);
					out.print(num);			
		}
}

		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
