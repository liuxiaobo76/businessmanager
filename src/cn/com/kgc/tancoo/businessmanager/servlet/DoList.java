package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
<<<<<<< HEAD
import javax.servlet.http.HttpSession;

import cn.com.kgc.tancoo.businessmanager.entity.Product;
import cn.com.kgc.tancoo.businessmanager.entity.ShoppingTrolley;
import cn.com.kgc.tancoo.businessmanager.entity.User;
import cn.com.kgc.tancoo.businessmanager.server.impl.ProductServerImpl;
import cn.com.kgc.tancoo.businessmanager.server.impl.ShoppingTrolleyServerImpl;
=======

import cn.com.kgc.tancoo.businessmanager.entity.Product;
import cn.com.kgc.tancoo.businessmanager.server.impl.ProductServerImpl;
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808

/**
 * Servlet implementation class DoList
 */
@WebServlet("/DoList")
public class DoList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String index = request.getParameter("pageindex");
		int pageindex = 1;
		if(index!=null) {
			pageindex=Integer.parseInt(index);
		}
<<<<<<< HEAD
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");//用户的登陆账号
=======
		
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
		String name = request.getParameter("search");
		ProductServerImpl psi = new ProductServerImpl();
		int count = psi.getCount(name);
		
		int pagecount = 15;
<<<<<<< HEAD
		ShoppingTrolleyServerImpl stsi = new ShoppingTrolleyServerImpl();
=======
	
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
		int totalpage = count%pagecount==0?count/pagecount:count/pagecount+1;
		List<Product> list = psi.getAll(name,pageindex, pagecount);
		request.setAttribute("pageindex", pageindex);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("search", name);
		request.setAttribute("list", list);
<<<<<<< HEAD
		if(user == null) {
			request.getRequestDispatcher("list.jsp").forward(request, response);
		}else {
			List<ShoppingTrolley> shoplist = stsi.getAlById(user.getUserId());//获取当前用户的购物车列表
			request.setAttribute("size", shoplist.size());
			
			request.getRequestDispatcher("list.jsp").forward(request, response);
		}
		
=======
		request.getRequestDispatcher("list.jsp").forward(request, response);
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
