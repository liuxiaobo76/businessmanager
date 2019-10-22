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

import cn.kgc.tangcco.tcbd1015.rsh.entity.Product;
import cn.kgc.tangcco.tcbd1015.rsh.service.impl.ProductServiceImpl;

/**
 * Servlet implementation class AjaxProduct
 */
@WebServlet("/AjaxProduct")
public class AjaxProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String opr = request.getParameter("opr");
		ProductServiceImpl psi = new ProductServiceImpl();
		HttpSession session = request.getSession();
		if(opr!=null&&opr.equals("add")) {
			String proName = request.getParameter("proName");
			int proType = Integer.parseInt(request.getParameter("proType"));
			String proDescription = request.getParameter("proDescription");
			String proSimg = request.getParameter("proSimg");
			String proBimg = request.getParameter("proSimg");
			double proPrice = Double.parseDouble(request.getParameter("proPrice"));
			Product p = new Product(proName, proType, proDescription, proSimg, proBimg, proPrice);
			String flag = "false";
			if(psi.add(p)>0) {
				flag = "true";
			}
			out.print(flag);
		}else if(opr!=null&&opr.equals("delete")) {
			int proId = Integer.parseInt(request.getParameter("proId"));
			String flag = "false";
			if(psi.delete(proId)>0) {
				flag = "true";
			}
			out.print(flag);
		}else if(opr!=null&&opr.equals("update")) {
			int proId = Integer.parseInt(request.getParameter("proId"));
			Product p = psi.getOne(proId);
			String newJson = JSON.toJSONString(p);
			out.print(newJson);
			session.setAttribute("proId", proId);
		}else if(opr!=null&&opr.equals("updateinfo")) {
			int proId = (int)session.getAttribute("proId");
			String proName = request.getParameter("proName");
			int proType = Integer.parseInt(request.getParameter("proType"));
			String proDescription = request.getParameter("proDescription");
			String proSimg = request.getParameter("proSimg");
			String proBimg = request.getParameter("proSimg");
			double proPrice = Double.parseDouble(request.getParameter("proPrice"));
			Product p = new Product(proId, proName, proType, proDescription, proSimg, proBimg, proPrice);
			String flag = "false";
			if(psi.update(p)>0) {
				flag = "true";
				
			}
			out.print(flag);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
