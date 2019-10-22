package cn.kgc.tangcco.tcbd1015.rsh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.kgc.tangcco.tcbd1015.rsh.entity.User;
import cn.kgc.tangcco.tcbd1015.rsh.service.impl.LoginServiceImpl;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		LoginServiceImpl lsi = new LoginServiceImpl();
		User user = lsi.login(userName, userPwd);
		session.setAttribute("user", user);
		//request.setAttribute("user", user);
		PrintWriter out = response.getWriter();
		if(user!=null && user.getUserType()==4 && user.getUserStatus()==0) {
			request.getRequestDispatcher("UserManagement.jsp").forward(request, response);
		}else if(user==null){
			out.print("<script>alert('用户名或者密码错误');location.href='index1.jsp'</script>");
		}else if(user.getUserStatus()!=0) {
			out.print("<script>alert('账户已被冻结');location.href='index1.jsp'</script>");
		}else {
			out.print("<script>alert('身份不合法');location.href='index1.jsp'</script>");
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
