package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.JoinInfoDao;
import kr.ac.green.dto.JoinInfo;

public class GetAllCmd implements ICmd{

	@Override
	public void action(HttpServletRequest request) {
		JoinInfoDao dao = JoinInfoDao.getInstance();
		Connection con = dao.connect();
		
		JoinInfo[] list = dao.getAll(con);
		dao.disconnect(con);
		
		request.setAttribute("list", list);
		request.setAttribute("nextPage", "mainForm.jsp");
	}
}
