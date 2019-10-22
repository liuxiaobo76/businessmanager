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
import cn.com.kgc.tancoo.businessmanager.entity.ShoppingTrolley;
import cn.com.kgc.tancoo.businessmanager.entity.User;
import cn.com.kgc.tancoo.businessmanager.server.impl.ProductServerImpl;
import cn.com.kgc.tancoo.businessmanager.server.impl.ShoppingTrolleyServerImpl;

/**
 * Servlet implementation class DoDetail
 */
@WebServlet("/DoDetail")
public class DoDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		ProductServerImpl pri = new ProductServerImpl();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");//用户的登陆账号
		List<Product> list = (List<Product>) session.getAttribute("list");
		if(user == null) {
			out.print("<script>alert('请先登录');location.href='login.jsp'</script>");
		}else {
			String Id = request.getParameter("id");
			String number = request.getParameter("number");
			ShoppingTrolleyServerImpl stsi = new ShoppingTrolleyServerImpl();
			List<ShoppingTrolley> shoplist = stsi.getAlById(user.getUserId());//获取当前用户的购物车列表
			request.setAttribute("size", shoplist.size());//显示购物车的数量
			if(number!=null) {
				if(Id!=null) {
					int id = Integer.parseInt(Id);
				ShoppingTrolley st = new ShoppingTrolley(0, id , user.getUserId(), null);
				stsi.add(st);
				out.print(true);
				}
			}
			if(Id!=null) {
				int id = Integer.parseInt(Id);
				Product pd = pri.getById(id);
				request.setAttribute("product", pd);	
				list.add(0, pd);
				session.setAttribute("list", list);
			}	
			
			request.getRequestDispatcher("detail.jsp").forward(request, response);
		}
	
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}