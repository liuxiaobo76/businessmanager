package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.kgc.tancoo.businessmanager.entity.Admin;
import cn.com.kgc.tancoo.businessmanager.server.AdminServer;
import cn.com.kgc.tancoo.businessmanager.server.impl.AdminServerImpl;


/**
 * Servlet implementation class AdminAdd
 */
@WebServlet("/AdminAdd")
public class AdminAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		AdminServer asi=new AdminServerImpl();
		String adminName=request.getParameter("Aname");
		String adminPwd=request.getParameter("Apwd");
		int adminAuth=Integer.parseInt(request.getParameter("AAuth"));
		Admin a=new Admin(adminName, adminPwd, adminAuth);
		if(asi.addAdmin(a)>0) {
			response.sendRedirect("GetAll");
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
