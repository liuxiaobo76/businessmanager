package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.kgc.tancoo.businessmanager.entity.Product;
import cn.com.kgc.tancoo.businessmanager.entity.User;
import cn.com.kgc.tancoo.businessmanager.server.impl.ProductServerImpl;

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
		if(sid!=null) {
			int id = Integer.parseInt(sid);
			Product product = pri.getById(id);
			request.setAttribute("product", product);
		}
		String number= request.getParameter("number");
		request.setAttribute("number", number);
		request.getRequestDispatcher("place_order.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
