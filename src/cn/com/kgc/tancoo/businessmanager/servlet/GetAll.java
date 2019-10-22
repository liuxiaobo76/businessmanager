package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.kgc.tancoo.businessmanager.entity.Admin;
import cn.com.kgc.tancoo.businessmanager.server.impl.AdminServerImpl;


/**
 * Servlet implementation class GetAll
 */
@WebServlet("/GetAll")
public class GetAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GetAll() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
			String adminName=request.getParameter("adminName");
			String cp=request.getParameter("currentPage");
			int currentPage=1;
			if(cp!=null) {
				currentPage=Integer.parseInt(cp);
			}
			int pageCount=5;
			AdminServerImpl asi=new AdminServerImpl();
			int count=asi.getCount(adminName);
			int totalPage=1;
			List<Admin> list;
			if(count==0) {
				list=null;
			}else {
				totalPage=count%pageCount==0?count/pageCount:count/pageCount+1;
				list=asi.getAll(adminName, currentPage, pageCount);
			}
			HttpSession session=request.getSession();
			session.setAttribute("list", list);
			session.setAttribute("currentPage",currentPage);
			session.setAttribute("totalPage",totalPage);
			session.setAttribute("adminName",adminName);
			response.sendRedirect("HOUTAI/UserManagement.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
