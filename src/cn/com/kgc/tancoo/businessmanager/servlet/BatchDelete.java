package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.kgc.tancoo.businessmanager.server.impl.AdminServerImpl;


/**
 * Servlet implementation class BatchDelete
 */
@WebServlet("/BatchDelete")
public class BatchDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BatchDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String checkId=request.getParameter("ids");
		String[] str=checkId.split(",");
		AdminServerImpl asi=new AdminServerImpl();
		int[] ids=new int[str.length];
		if(str.length>0) {
			for (int i = 0; i < str.length; i++) {
				ids[i]=Integer.parseInt(str[i]);
			}
		}
		for (int i : ids) {
			asi.deleteAdmin(i);
		}
		response.sendRedirect("GetAll");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
