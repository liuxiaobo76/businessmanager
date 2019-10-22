package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import cn.com.kgc.tancoo.businessmanager.entity.Admin;
import cn.com.kgc.tancoo.businessmanager.server.impl.AdminServerImpl;


/**
 * Servlet implementation class AdminUpdate
 */
@WebServlet("/AdminUpdate")
public class AdminUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		String opr=request.getParameter("opr");
		AdminServerImpl asi=new AdminServerImpl();
		if(opr!=null&&opr.equals("queryAdmin")) {
			int aId=Integer.parseInt(request.getParameter("uAdminId"));
			Admin a=asi.queryAdminById(aId);
			String ajson=JSON.toJSONString(a);
			out.print(ajson);
		}else if(opr!=null&&opr.equals("aUpdate")){
			int id=Integer.parseInt(request.getParameter("uAid"));
			String adminName=request.getParameter("uAname");
			String adminPwd=request.getParameter("uApwd");
			int adminAuth=Integer.parseInt(request.getParameter("uAauth"));
			Admin a=new Admin(id, adminName, adminPwd, adminAuth, null);
			if(asi.updateAdmin(a)>0) {
				out.print("true");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
