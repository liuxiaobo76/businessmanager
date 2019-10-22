package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.kgc.tancoo.businessmanager.entity.User;

/**
 * Servlet implementation class DoUser_center_site
 */
@WebServlet("/DoUser_center_site")
public class DoUser_center_site extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		User user = (User) session.getAttribute("user");
		if(user!=null) {
			request.setAttribute("username", user.getUserName());
		}
		request.getRequestDispatcher("user_center_site.jsp").forward(request, response);
	
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}