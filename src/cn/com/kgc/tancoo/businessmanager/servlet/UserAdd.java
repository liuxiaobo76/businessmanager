package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.kgc.tancoo.businessmanager.entity.User;
import cn.com.kgc.tancoo.businessmanager.server.impl.UserServerImpl;


/**
 * Servlet implementation class UserAdd
 */
@WebServlet("/UserAdd")
public class UserAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserServerImpl usi=new UserServerImpl();
		String userName=request.getParameter("Uname");
		String userPwd=request.getParameter("Upwd");
		String userAdd=request.getParameter("Uadd");
		String userPhone=request.getParameter("Uphone");
		String userTruename=request.getParameter("Utruename");
		String userSex=request.getParameter("Usex");
		String userBirthday=request.getParameter("Ubirthday");
		int userType=Integer.parseInt(request.getParameter("Utype"));
		int userStatus=Integer.parseInt(request.getParameter("Ustatus"));
		User u=new User(0, userName, userPwd, userAdd, userPhone, userTruename, userSex, userBirthday, null, userType, userStatus, null);
		if(usi.addUser(u)>0) {
			response.sendRedirect("UserGetAll");
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
