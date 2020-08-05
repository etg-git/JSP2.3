package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.Student;
import kr.ac.green.dao.StudentDao;

public class DeleteCmd implements ICmd{
	@Override
	public void action(HttpServletRequest request) {
		StudentDao dao = StudentDao.getInstance();
		
		Connection con = dao.connect();
		
		Student std = new Student();
		std.setStd_id(Integer.parseInt(request.getParameter("id")));
		std.setStd_name(request.getParameter("name"));
		std.setStd_tel(request.getParameter("tel"));
		std.setStd_grade(Integer.parseInt(request.getParameter("grade")));
		std.setStd_class(Integer.parseInt(request.getParameter("class")));
		
		dao.delete(con, std);
		
		dao.disconnect(con);
		
		request.setAttribute("isRedirect", true);
		request.setAttribute("nextPage", request.getContextPath());
	}
}
