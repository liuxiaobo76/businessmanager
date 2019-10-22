package cn.kgc.tangcco.tcbd1015.rsh.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.kgc.tangcco.tcbd1015.rsh.entity.Order;
import cn.kgc.tangcco.tcbd1015.rsh.service.impl.OrderServiceImpl;

/**
 * Servlet implementation class OrderGetAll
 */
@WebServlet("/OrderGetAll")
public class OrderGetAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderGetAll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		OrderServiceImpl osi = new OrderServiceImpl();
		int cutpage = 1;
		String orderRandom = request.getParameter("bianhao");
		String cp = request.getParameter("cutpage");
		if(cp!=null) {
			cutpage = Integer.parseInt(cp);
		}
		int pagecount = 4;
		if(orderRandom=="") {
			orderRandom=null;
		}
		List<Order>list = osi.getAll(orderRandom, cutpage, pagecount);
		int count = osi.getCount(orderRandom);
		int totalpage = count%pagecount==0?count/pagecount:count/pagecount+1;
		request.setAttribute("list", list);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("cutpage", cutpage);
		request.setAttribute("bianhao", orderRandom);
		request.getRequestDispatcher("OrderManagement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
