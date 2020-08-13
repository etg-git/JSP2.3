package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.JoinInfoDao;
import kr.ac.green.dto.JoinInfo;

public class AllSearchCmd implements ICmd{

	@Override
	public void action(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("search_desc"));
		
		JoinInfoDao dao = JoinInfoDao.getInstance();
		Connection con = dao.connect();
		dao.connect();
		
		request.setAttribute("nextPage", "mainForm.jsp");
		request.setAttribute("list", dao.search(con, id));
		
		dao.disconnect(con);
	}
}
