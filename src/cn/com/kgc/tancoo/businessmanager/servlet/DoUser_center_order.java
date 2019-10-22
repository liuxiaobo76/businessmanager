package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.kgc.tancoo.businessmanager.entity.Order;
import cn.com.kgc.tancoo.businessmanager.entity.Orders;
import cn.com.kgc.tancoo.businessmanager.entity.Product;
import cn.com.kgc.tancoo.businessmanager.entity.ShoppingTrolley;
import cn.com.kgc.tancoo.businessmanager.entity.User;
import cn.com.kgc.tancoo.businessmanager.server.impl.OrderServerImpl;
import cn.com.kgc.tancoo.businessmanager.server.impl.ProductServerImpl;
import cn.com.kgc.tancoo.businessmanager.server.impl.ShoppingTrolleyServerImpl;

/**
 * Servlet implementation class DoUser_center_order
 */
@WebServlet("/DoUser_center_order")
public class DoUser_center_order extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		User user = (User) session.getAttribute("user");
		if(user==null) {
			out.print("<script>alert('请先登录');location.href='login.jsp'</script>");
		}else {
			ShoppingTrolleyServerImpl stsi = new ShoppingTrolleyServerImpl();
			List<ShoppingTrolley> shoplist = stsi.getAlById(user.getUserId());//获取当前用户的购物车列表
			OrderServerImpl osi = new OrderServerImpl();
			String index = request.getParameter("pageindex");//从页面获取第几页
			int count = osi.getCount(user.getUserId());
			int pageindex= 1;
			if(index != null) {
				pageindex = Integer.parseInt(index);
			}
			int pagecount=5;
			int totalpage = count%pagecount==0?count/pagecount:count/pagecount+1;
			List<Order> list = osi.getAllById(user.getUserId(), pageindex, pagecount);
			List<Orders> newlist = new ArrayList<Orders>();
			ProductServerImpl psi = new ProductServerImpl();
			if(list!=null) {
				for (int i = 0; i < list.size(); i++) {
					if(list.get(i).getUserId()==user.getUserId()) {
						Product product =  psi.getById(list.get(i).getProId());
						Orders orders = new Orders(list.get(i).getOrderId(), list.get(i).getProId(),list.get(i).getOrderNum(), list.get(i).getUserId(),list.get(i).getOrderPrice(), list.get(i).getDelAddr(), list.get(i).getUserAddr(), list.get(i).getOrderTime(), list.get(i).getOrderBz(), list.get(i).getOrderStatu(), list.get(i).getOrderStatus(), list.get(i).getOrderRandom(), product);
						newlist.add(orders);
					}
				}
			}
			request.setAttribute("pageindex", pageindex);
			request.setAttribute("totalpage", totalpage);
			request.setAttribute("list", newlist);//该用户的订单
			request.setAttribute("size", shoplist.size());//显示购物车的数量
			request.getRequestDispatcher("user_center_order.jsp").forward(request, response);
		}
		
	
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}