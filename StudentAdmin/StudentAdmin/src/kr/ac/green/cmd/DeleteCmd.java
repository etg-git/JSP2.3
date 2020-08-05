package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.StudentDao;

public class DeleteCmd implements ICmd{
	@Override
	public void action(HttpServletRequest request) {
		request.setAttribute("nextPage", "updateDeleteSearch.jsp");
	}
}
