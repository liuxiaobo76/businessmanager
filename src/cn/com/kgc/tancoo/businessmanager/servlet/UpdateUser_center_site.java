package cn.com.kgc.tancoo.businessmanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.kgc.tancoo.businessmanager.entity.User;
import cn.com.kgc.tancoo.businessmanager.server.impl.UserServerImpl;

/**
 * Servlet implementation class DoUser_center_site
 */
@WebServlet("/DoUser_center_site")
public class UpdateUser_center_site extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		User user = (User) session.getAttribute("user");
		if(user!=null) {
			request.setAttribute("username", user.getUserName());
		}
		String userName = request.getParameter("username");
		String userAddr = request.getParameter("useraddress");
		String userPhone = request.getParameter("userphone");
		UserServerImpl usi = new UserServerImpl();
		User newuser = new User(user.getUserId(), userName, user.getUserPwd(), userAddr, userPhone, user.getUserTruename(), user.getUserSex(), user.getUserBirthday(), user.getUserRegtime(), user.getUserType(), user.getUserStatus(), user.getUserStatu());
		if(usi.update(newuser)==0) {
			out.println("<script>alert('添加失败');location.href='DoUser_center_site'</script>");	
		}else {
			out.println("<script>alert('添加成功');location.href='DoUser_center_site'</script>");	
		}
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}