package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.kgc.tancoo.businessmanager.entity.Order;
import cn.com.kgc.tancoo.businessmanager.entity.Product;
import cn.com.kgc.tancoo.businessmanager.entity.ShoppingTrolley;
import cn.com.kgc.tancoo.businessmanager.entity.User;
import cn.com.kgc.tancoo.businessmanager.server.impl.OrderServerImpl;
import cn.com.kgc.tancoo.businessmanager.server.impl.ProductServerImpl;
import cn.com.kgc.tancoo.businessmanager.server.impl.ShoppingTrolleyServerImpl;
import cn.com.kgc.tancoo.businessmanager.util.Util;

/**
 * Servlet implementation class DoPlace_order
 */
@WebServlet("/DoPlace_order")
public class DoPlace_order extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");//用户的登陆账号
		ProductServerImpl pri = new ProductServerImpl();
		String sid = request.getParameter("id");//（商品）订单编号
		String listId = request.getParameter("listId");//商品编号
		PrintWriter out = response.getWriter();
		
		if(sid==null) {
			System.out.println(listId);
			out.print("<script>alert('请您至少选择一件商品');location.href='DoIndex'</script>");
			
		}
		String listNum = request.getParameter("listNum");//商品数量
		ShoppingTrolleyServerImpl stsi = new ShoppingTrolleyServerImpl();
		List<ShoppingTrolley> shoplist = stsi.getAlById(user.getUserId());//获取当前用户的购物车列表
		request.setAttribute("size", shoplist.size());
		/*
		 * if(listId!=null && listNum !=null ) {//判断是从购物车跳转 还是直接跳转 String list1[] =
		 * listId.trim().split(",");//商品编号 String[] list2 =
		 * listNum.trim().split(",");//商品数量 List<Product> list = new
		 * ArrayList<Product>(); for (int i = 0; i < list1.length; i++) { Product
		 * product = pri.getById(Integer.parseInt(list1[i]));//获得对应编号的商品
		 * product.setProNum(Integer.parseInt(list2[i]));//将商品的数量存入商品中
		 * list.add(product);//将商品加入集合中 }
		 * 
		 * 
		 * request.setAttribute("list", list);//购物车过来的商品列表
		 * request.setAttribute("numbers", list2);
		 * 
		 * request.setAttribute("size", list.size());
		 * request.getRequestDispatcher("place_order.jsp").forward(request, response); }
		 */
		//从商品细节上跳转过来
		if(sid!=null) {
			int id = Integer.parseInt(sid);
			Product product = pri.getById(id);
			request.setAttribute("product", product);
			String number= request.getParameter("number");
			int num = Integer.parseInt(number);
			request.setAttribute("number", number);
			Order order = new Order(1, id, num, user.getUserId(),num*product.getProPrice() , "北京市丰台区", user.getUserAddr(), new Date(), null, 1, null, Util.getRandom());
			OrderServerImpl osi = new OrderServerImpl();
			int s = osi.add(order);
		}
		//从购物车跳转过来
		if(listId!=null) {
			int id = Integer.parseInt(listId);
			Product product = pri.getById(id);
			request.setAttribute("product", product);
			request.setAttribute("number", listNum);
			int num = Integer.parseInt(listNum);
			Order order = new Order(1, id, num, user.getUserId(),num*product.getProPrice() , "北京市丰台区", user.getUserAddr(), new Date(), null, 1, null, Util.getRandom());
			OrderServerImpl osi = new OrderServerImpl();
			osi.add(order);
		}
		
		request.getRequestDispatcher("place_order.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
