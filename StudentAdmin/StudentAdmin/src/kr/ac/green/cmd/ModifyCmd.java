package kr.ac.green.cmd;

import javax.servlet.http.HttpServletRequest;

public class ModifyCmd implements ICmd{
	@Override
	public void action(HttpServletRequest request) {
		request.setAttribute("nextPage", "updateDeleteSearch.jsp");
	}
	
}
