package cn.com.kgc.tancoo.businessmanager.servlet;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.kgc.tancoo.businessmanager.entity.Admin;



/**
 * Servlet implementation class AdminDoLogin
 */
@WebServlet("/AdminDoLogin")
public class AdminDoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminDoLogin() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Admin a=(Admin)session.getAttribute("a");
		if(a.getAdminName()==null) {
			response.sendRedirect("HOUTAI/login.jsp");
		}else {
			response.sendRedirect("GetAll");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
