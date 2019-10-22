package cn.kgc.tangcco.tcbd1015.rsh.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.kgc.tangcco.tcbd1015.rsh.entity.Ptype;
import cn.kgc.tangcco.tcbd1015.rsh.service.impl.PtypeServiceImpl;

/**
 * Servlet implementation class PtypeGetAll
 */
@WebServlet("/PtypeGetAll")
public class PtypeGetAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PtypeGetAll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		PtypeServiceImpl psi = new PtypeServiceImpl();
		List<Ptype>list = psi.getAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("ClassificationManagement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
