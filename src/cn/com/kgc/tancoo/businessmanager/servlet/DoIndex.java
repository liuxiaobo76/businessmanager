package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
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
 * Servlet implementation class DoIndex
 */
@WebServlet("/DoIndex")
public class DoIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		ProductServerImpl pri = new ProductServerImpl();
		List<Product> list = pri.getAll("", 1, 1005);
		request.setAttribute("list", list);
		List<Product> list1 = new ArrayList<Product>();// 第一类新鲜水果类
		List<Product> list2 = new ArrayList<Product>();// 第二类海鲜水产类
		List<Product> list3 = new ArrayList<Product>();// 第三类猪牛羊肉类
		List<Product> list4 = new ArrayList<Product>();// 第四类禽类蛋品类
		List<Product> list5 = new ArrayList<Product>();// 第五类新鲜蔬菜类
		List<Product> list6 = new ArrayList<Product>();// 第六类速冻食品类

		for (int i = 0; i < list.size()&list1.size()<4; i++) {
			if (list.get(i).getProType() == 1) {
				list1.add(list.get(i));
			}
		}

		for (int i = 0; i < list.size()&list2.size()<4; i++) {
			if (list.get(i).getProType() == 2) {
				list2.add(list.get(i));
			}
		}

		for (int i = 0; i < list.size()&list3.size()<4; i++) {
			if (list.get(i).getProType() == 3) {
				list3.add(list.get(i));
			}
		}

		for (int i = 0; i < list.size()&list4.size()<4; i++) {
			if (list.get(i).getProType() == 4) {
				list4.add(list.get(i));
			}
		}

		for (int i = 0; i < list.size()&list5.size()<4; i++) {
			if (list.get(i).getProType() == 5) {
				list5.add(list.get(i));
			}
		}

		for (int i = 0; i < list.size()&list6.size()<4; i++) {
			if (list.get(i).getProType() == 6) {
				list6.add(list.get(i));
			}
		}
		request.setAttribute("list", list);
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("list4", list4);
		request.setAttribute("list5", list5);
		request.setAttribute("list6", list6);
		
		User user = (User) session.getAttribute("user");
		if (user == null) {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else{
			ShoppingTrolleyServerImpl stsi = new ShoppingTrolleyServerImpl();
			List<ShoppingTrolley> shoplist = stsi.getAlById(user.getUserId());//获取当前用户的购物车列表
			request.setAttribute("size", shoplist.size());
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
