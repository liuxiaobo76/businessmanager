package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class GetAll
 */
@WebServlet("/GetAll")
public class DoIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		ProductServerImpl pri = new ProductServerImpl();
		List<Product> list = pri.getAll("", 1, 1005);
		request.setAttribute("list", list);
		User user = (User) session.getAttribute("user");
		if(user!=null) {
			request.setAttribute("username", user.getUserName());
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
