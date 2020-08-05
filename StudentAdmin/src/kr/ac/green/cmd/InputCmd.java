package kr.ac.green.cmd;

import javax.servlet.http.HttpServletRequest;

public class InputCmd implements ICmd {

	@Override
	public void action(HttpServletRequest request) {
		request.setAttribute("nextPage", "inputForm.jsp");
	}
	
}
