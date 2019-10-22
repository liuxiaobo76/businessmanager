package cn.kgc.tangcco.tcbd1015.rsh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

import cn.kgc.tangcco.tcbd1015.rsh.entity.Ptype;
import cn.kgc.tangcco.tcbd1015.rsh.service.impl.PtypeServiceImpl;

/**
 * Servlet implementation class AjaxPtype
 */
@WebServlet("/AjaxPtype")
public class AjaxPtype extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxPtype() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String opr = request.getParameter("opr");
		PtypeServiceImpl psi = new PtypeServiceImpl();
		HttpSession session = request.getSession();
		
		if(opr!=null&&opr.equals("update")) {
			int ptypeId = Integer.parseInt(request.getParameter("ptypeId"));
			Ptype p = psi.query(ptypeId);
			String newJson = JSON.toJSONString(p);
			out.print(newJson);
			session.setAttribute("ptypeId", ptypeId);
		}else if(opr!=null&&opr.equals("updateinfo")) {
			String ptypeName = request.getParameter("ptypeName");
			int ptypeId = (int)session.getAttribute("ptypeId");
			String flag = "false";
			if(psi.update(ptypeId, ptypeName)>0) {
				flag="true";
			}
			out.print(flag);
		}else if(opr!=null&&opr.equals("add")) {
			String ptypeName = request.getParameter("ptypeName");
			String flag = "false";
			if(psi.add(ptypeName)>0) {
				flag="true";
			}
			out.print(flag);
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
