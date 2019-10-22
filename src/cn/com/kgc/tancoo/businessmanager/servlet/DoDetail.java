package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import cn.com.kgc.tancoo.businessmanager.entity.Product;
import cn.com.kgc.tancoo.businessmanager.server.impl.ProductServerImpl;

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
		String Id = request.getParameter("id");
		if(Id!=null) {
			int id = Integer.parseInt(Id);
			Product pd = pri.getById(id);
			request.setAttribute("product", pd);	
		}	
		
		request.getRequestDispatcher("detail.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}