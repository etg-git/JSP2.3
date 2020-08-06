package kr.ac.green.cmd;

import javax.servlet.http.HttpServletRequest;

public class GoJoinCmd implements ICmd{

	@Override
	public void action(HttpServletRequest request) {
		request.setAttribute("nextPage", "joinForm.jsp");
	}
	
}
