package cn.kgc.tangcco.tcbd1015.rsh.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.kgc.tangcco.tcbd1015.rsh.entity.Product;
import cn.kgc.tangcco.tcbd1015.rsh.entity.Ptype;
import cn.kgc.tangcco.tcbd1015.rsh.service.impl.ProductServiceImpl;

/**
 * Servlet implementation class ProductGetAll
 */
@WebServlet("/ProductGetAll")
public class ProductGetAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductGetAll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ProductServiceImpl psi = new ProductServiceImpl();
		List<Ptype>typelist = psi.getAll();
		
		int cutpage = 1;
		int pagecount = 3;
		String proName = request.getParameter("proName");
		String fenlei = request.getParameter("proType");
		String page=request.getParameter("cutpage");
		if(page!=null) {
			cutpage=Integer.parseInt(page);
		}
		int proType = 0;
		if(fenlei!=null) {
			proType = Integer.parseInt(fenlei);
		}
		List<Product>list = psi.getAll(proName, proType, cutpage, pagecount);
		int count = psi.getCount(proName,proType);
		int totalpage = count%pagecount==0?count/pagecount:count/pagecount+1;
		request.setAttribute("typelist", typelist);
		request.setAttribute("list", list);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("cutpage", cutpage);
		request.setAttribute("proName", proName);
		request.setAttribute("fenlei", proType);
		request.getRequestDispatcher("ProductManagement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
