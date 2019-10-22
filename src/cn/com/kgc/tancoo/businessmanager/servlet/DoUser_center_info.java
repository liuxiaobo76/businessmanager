package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.kgc.tancoo.businessmanager.entity.Product;
import cn.com.kgc.tancoo.businessmanager.entity.ShoppingTrolley;
import cn.com.kgc.tancoo.businessmanager.entity.User;
import cn.com.kgc.tancoo.businessmanager.server.impl.ShoppingTrolleyServerImpl;

/**
 * Servlet implementation class DoUser_center_info
 */
@WebServlet("/DoUser_center_info")
public class DoUser_center_info extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		User user = (User) session.getAttribute("user");
		List<Product> list = (List<Product>) session.getAttribute("list");
		if(list.size()>=5) {
			list = list.subList(0, 5);
		}
		request.setAttribute("list", list);
		if(user==null) {
			out.print("<script>alert('请先登录');location.href='login.jsp'</script>");
		}else {
			ShoppingTrolleyServerImpl stsi = new ShoppingTrolleyServerImpl();
			List<ShoppingTrolley> shoplist = stsi.getAlById(user.getUserId());//获取当前用户的购物车列表
			request.setAttribute("size", shoplist.size());//显示购物车的数量
			/*
			 * if(user==null) { request.setAttribute("username", user.getUserName()); }
			 */
			request.getRequestDispatcher("user_center_info.jsp").forward(request, response);
		}
	
	
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}