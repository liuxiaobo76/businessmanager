package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.kgc.tancoo.businessmanager.server.impl.AdminServerImpl;


/**
 * Servlet implementation class AdminDelete
 */
@WebServlet("/AdminDelete")
public class AdminDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminDelete() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		AdminServerImpl asi = new AdminServerImpl();
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		if (asi.deleteAdmin(id) > 0) {
			out.print("true");
		} else {
			out.print("false");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
