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
 * Servlet implementation class DoCart
 */
@WebServlet("/DoCart")
public class DoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		ProductServerImpl pri = new ProductServerImpl();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		ShoppingTrolleyServerImpl stsi = new ShoppingTrolleyServerImpl();
		List<ShoppingTrolley> list= stsi.getAll();
		User user = (User) session.getAttribute("user");//用户的登陆账号
		
		if(user==null) {
			out.print("<script>alert('请先登录');location.href='login.jsp'</script>");
		}else {
			List<ShoppingTrolley> shoplist = new ArrayList<ShoppingTrolley>();//该用户的的购物车数据
			if(!list.isEmpty()) {
				for (int i = 0; i < list.size(); i++) {
					if(list.get(i).getUserId()==user.getUserId()) {
						shoplist.add(list.get(i));
					}
				}
			}
			String Id = request.getParameter("id");
			if(Id!=null) {
				int id = Integer.parseInt(Id);
				for (int i = 0; i < shoplist.size(); i++) {
					if(id==shoplist.get(i).getProId()) {
						int num = stsi.delete(shoplist.get(i).getTroId());
						if(num!=0) {
							out.print("true");
						}else {
							out.print("false");
						}
					}
				}	
			
			}else {
				ProductServerImpl psi = new ProductServerImpl();
				List<Product> newlist = new ArrayList<Product>();//商品数据
				for (int i = 0; i < shoplist.size(); i++) {
					newlist.add(psi.getById(shoplist.get(i).getProId()));
				}
				
				request.setAttribute("list", newlist);
				request.getRequestDispatcher("cart.jsp").forward(request, response);
			}
		}
		
		
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}