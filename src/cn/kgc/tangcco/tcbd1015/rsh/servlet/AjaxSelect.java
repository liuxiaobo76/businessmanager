package cn.kgc.tangcco.tcbd1015.rsh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

import cn.kgc.tangcco.tcbd1015.rsh.entity.Order;
import cn.kgc.tangcco.tcbd1015.rsh.service.impl.OrderServiceImpl;

/**
 * Servlet implementation class AjaxSelect
 */
@WebServlet("/AjaxSelect")
public class AjaxSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AjaxSelect() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String opr = request.getParameter("opr");
		OrderServiceImpl osi = new OrderServiceImpl();
		//
		HttpSession session = request.getSession();
		if (opr != null && opr.equals("update")) {
			int userId = Integer.parseInt(request.getParameter("userId"));
			Order o = osi.select(userId);
			String newJson = JSON.toJSONString(o);
			out.print(newJson);
			session.setAttribute("userId", userId);
		} else if (opr != null && opr.equals("updateinfo")) {
			String userphone = request.getParameter("userphone");
			String userAddr = request.getParameter("userAddr");
			String flag = "false";
			int userId = (int) session.getAttribute("userId");
			if (osi.update(userphone, userAddr, userId) > 0) {
				flag = "true";
			}
			out.print(flag);
		}else if(opr != null && opr.equals("delete")) {
			String orderRandom = request.getParameter("orderRandom");
			String flag = "false";
			if(osi.delete(orderRandom)>0) {
				flag="true";
			}
			out.print(flag);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
