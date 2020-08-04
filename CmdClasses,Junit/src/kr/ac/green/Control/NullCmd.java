package kr.ac.green.Control;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.cmd.ICmd;

public class NullCmd implements ICmd{
	@Override
	public void action(HttpServletRequest request) {
		request.setAttribute("nextPage", "insert.jsp");
	}
}
