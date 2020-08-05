package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.Student;
import kr.ac.green.dao.StudentDao;

public class SearchCmd implements ICmd{
	@Override
	public void action(HttpServletRequest request) {
		
		String id = request.getParameter("desc");
		String cmd2 = request.getParameter("cmd2");
		StudentDao dao = StudentDao.getInstance();
		Connection con = dao.connect();
		
		Student scStudent = dao.getSearch(con, Integer.parseInt(id));
		
		
		boolean flag = true;
		
		if(scStudent == null) {
			request.setAttribute("nextPage", "nullForm.jsp");
			flag = false;
		}
		if(flag) {
			if(cmd2.equals("update")) {
				request.setAttribute("nextPage", "updateForm.jsp");
			} else if(cmd2.equals("delete")) {
				request.setAttribute("nextPage", "deleteForm.jsp");
			}
			request.setAttribute("id", Integer.parseInt(id));
		}
	}
	
}
