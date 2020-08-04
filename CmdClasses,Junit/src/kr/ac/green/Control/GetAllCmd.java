package kr.ac.green.Control;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.AdvancedCarDao;
import kr.ac.green.Car;
import kr.ac.green.cmd.ICmd;

public class GetAllCmd implements ICmd{
	@Override
	public void action(HttpServletRequest request) {
		AdvancedCarDao dao = AdvancedCarDao.getDao();
		
		Connection con = dao.connect();
		
		Car[] list = dao.getAll(con);
		dao.disconnect(con);
		request.setAttribute("list", list);
		request.setAttribute("nextPage", "list.jsp");
	}
}
