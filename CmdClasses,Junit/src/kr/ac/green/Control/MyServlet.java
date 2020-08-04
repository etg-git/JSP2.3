package kr.ac.green.Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.green.cmd.ICmd;

public class MyServlet extends HttpServlet {
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		CmdFactory.init();
	}
	private static final long serialVersionUID = 1L;

	public MyServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doit(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc_kr");
		doit(request, response);
	}

	private void doit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cmd = request.getParameter("cmd");
		
		if(cmd == null) {
			cmd = "getAll"; //cmd 가 머떄문에 서블릿에 요청을 하는건지
		}
		
		CmdFactory.doAction(request, cmd);
		
		String nextPage = request.getAttribute("nextPage").toString();
		
		if(request.getAttribute("isRedirect") != null) {
			response.sendRedirect(request.getContextPath());
		} else{
			RequestDispatcher rd = request.getRequestDispatcher(nextPage); //forward를 코드로
			rd.forward(request, response);
		}
	}
}
