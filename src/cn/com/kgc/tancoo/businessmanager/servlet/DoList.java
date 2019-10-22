package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.kgc.tancoo.businessmanager.entity.Product;
import cn.com.kgc.tancoo.businessmanager.server.impl.ProductServerImpl;

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
		
		String name = request.getParameter("search");
		ProductServerImpl psi = new ProductServerImpl();
		int count = psi.getCount(name);
		
		int pagecount = 15;
	
		int totalpage = count%pagecount==0?count/pagecount:count/pagecount+1;
		List<Product> list = psi.getAll(name,pageindex, pagecount);
		request.setAttribute("pageindex", pageindex);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("search", name);
		request.setAttribute("list", list);
		request.getRequestDispatcher("list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
