package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import cn.com.kgc.tancoo.businessmanager.entity.User;
import cn.com.kgc.tancoo.businessmanager.server.impl.UserServerImpl;


/**
 * Servlet implementation class UserUpdate
 */
@WebServlet("/UserUpdate")
public class UserUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		String opr=request.getParameter("opr");
		UserServerImpl usi=new UserServerImpl();
		if(opr!=null&&opr.equals("queryUser")) {
			int uId=Integer.parseInt(request.getParameter("uUid"));
			User u=usi.queryUserById(uId);
			String ujson=JSON.toJSONString(u);
			out.print(ujson);
		}else if(opr!=null&&opr.equals("uUpdate")) {
			int id=Integer.parseInt(request.getParameter("uUid"));
			String userName=request.getParameter("uUname");
			String userPwd=request.getParameter("uUpwd");
			String userAddr=request.getParameter("uUadd");
			String userPhone=request.getParameter("uUphone");
			String userTruename=request.getParameter("uUtruename");
			String userSex=request.getParameter("uUsex");
			String userBirthday=request.getParameter("uUbirthday");
			int userType=Integer.parseInt(request.getParameter("uUtype"));
			int userStatus=Integer.parseInt(request.getParameter("uUstatus"));
//			System.out.println(userName);
//			System.out.println(userPwd);
//			System.out.println(userAddr);
//			System.out.println(userPhone);
//			System.out.println(userTruename);
//			System.out.println(userSex);
//			System.out.println(userBirthday);
//			System.out.println(userType);
//			System.out.println(userStatus);
			User u=new User(id, userName, userPwd, userAddr, userPhone, userTruename, userSex, userBirthday, null, userType, userStatus, null);
			if(usi.updateUser(u)>0) {
				out.print("true");
			}
			
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
