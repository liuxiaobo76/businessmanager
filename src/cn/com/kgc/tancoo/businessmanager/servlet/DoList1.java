package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import cn.com.kgc.tancoo.businessmanager.entity.Product;
import cn.com.kgc.tancoo.businessmanager.server.impl.ProductServerImpl;

/**
 * Servlet implementation class DoList1
 */
@WebServlet("/DoList1")
public class DoList1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String index = request.getParameter("pageindex");
		PrintWriter out = response.getWriter();
		String opr = request.getParameter("opr");
		int pageindex = 1;
		if(index!=null) {
			pageindex=Integer.parseInt(index);
		}
		String name = request.getParameter("search");
		ProductServerImpl psi = new ProductServerImpl();
		int count = psi.getCount(name);
		System.out.println();
		int pagecount = 2;
		int totalpage = count%pagecount==0?count/pagecount:count/pagecount+1;
		List<Product> list = psi.getAllByType(name,pageindex, pagecount);
		request.setAttribute("pageindex", pageindex);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("search", name);
		request.setAttribute("list", list);
		/*
		 * if(opr!=null&&opr.equals("getlist")) { List<Product> list1 =
		 * psi.getAllByType(name, pageindex, pagecount); String
		 * newJson=JSON.toJSONStringWithDateFormat(list1, "yyyy-MM-dd");
		 * out.print(newJson); System.out.println("sss"); }
		 */
		request.getRequestDispatcher("list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
