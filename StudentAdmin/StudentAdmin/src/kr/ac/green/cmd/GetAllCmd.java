package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.Student;
import kr.ac.green.dao.StudentDao;

public class GetAllCmd implements ICmd{
	@Override
	public void action(HttpServletRequest request) {
		StudentDao dao = StudentDao.getInstance();
		Connection con = dao.connect();
		
		Student[] list = dao.getAll(con);
		dao.disconnect(con);
		
		request.setAttribute("list", list);
		request.setAttribute("nextPage", "mainForm.jsp");
	}
	
}
