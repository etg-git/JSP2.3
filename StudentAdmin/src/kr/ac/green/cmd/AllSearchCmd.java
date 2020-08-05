package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.StudentDao;

public class AllSearchCmd implements ICmd{

	@Override
	public void action(HttpServletRequest request) {
		StudentDao dao = StudentDao.getInstance();
		
		Connection con = dao.connect();
		
		String[] search = request.getParameterValues("search");
		
		String sql = null;
		
		boolean isString = false;
		for(String param : search) {
			if(param.equals("std_id")) {
				sql = "SELECT * FROM student WHERE std_id = ? ORDER BY std_id DESC;";
			} else if(param.equals("std_name")) {
				sql = "SELECT * FROM student WHERE std_name = ? ORDER BY std_id DESC;";
				isString = true;
			} else if(param.equals("std_class")) {
				sql = "SELECT * FROM student WHERE std_class = ? ORDER BY std_id DESC;";
			}
		}
		request.setAttribute("nextPage", "mainForm.jsp");
		request.setAttribute("list", dao.getSearch(con, sql, request.getParameter("desc"), isString));
		dao.disconnect(con);
	}
	
}
