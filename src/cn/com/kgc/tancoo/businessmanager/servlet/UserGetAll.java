package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.kgc.tancoo.businessmanager.entity.User;
import cn.com.kgc.tancoo.businessmanager.server.impl.UserServerImpl;


/**
 * Servlet implementation class UserGetAll
 */
@WebServlet("/UserGetAll")
public class UserGetAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserGetAll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userName=request.getParameter("userName");
		String cp=request.getParameter("currentPage");
		int currentPage=1;
		if(cp!=null) {
			currentPage=Integer.parseInt(cp);
		}
		int pageCount=5;
		UserServerImpl usi=new UserServerImpl();
		int count=usi.getCount(userName);
		int totalPage=1;
		List<User> list;
		if(count==0) {
			list=null;
		}else {
			totalPage=count%pageCount==0?count/pageCount:count/pageCount+1;
			list=usi.getAll(userName, currentPage, pageCount);
		}
		HttpSession session=request.getSession();
		session.setAttribute("UserList", list);
		session.setAttribute("dqy", currentPage);
		session.setAttribute("zy",totalPage);
		session.setAttribute("userName", userName);
		response.sendRedirect("HOUTAI/UserManagement2.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
