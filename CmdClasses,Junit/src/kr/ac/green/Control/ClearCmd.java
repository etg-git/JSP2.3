package kr.ac.green.Control;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.AdvancedCarDao;
import kr.ac.green.cmd.ICmd;

public class ClearCmd implements ICmd{

	@Override
	public void action(HttpServletRequest request) {
		AdvancedCarDao dao = AdvancedCarDao.getDao();
		Connection con = dao.connect();
		
		dao.clear(con);
		dao.disconnect(con);
		
		request.setAttribute("isRedirect", true);
		request.setAttribute("nextPage", request.getContextPath());
	}
}
