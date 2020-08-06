package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.JoinInfoDao;
import kr.ac.green.dto.JoinInfo;

public class UpdateCmd implements ICmd{

	@Override
	public void action(HttpServletRequest request) {
		JoinInfoDao dao = JoinInfoDao.getInstance();
		
		Connection con = dao.connect();
		
		JoinInfo info = new JoinInfo();
		info.setId(Integer.parseInt(request.getParameter("id")));
		info.setName(request.getParameter("name"));
		info.setNickName(request.getParameter("nickName"));
		info.setPassword(request.getParameter("password"));
		info.setTel(request.getParameter("tel"));
		
		dao.update(con, info);
		dao.disconnect(con);
		
		request.setAttribute("nextPage", request.getContextPath());
		request.setAttribute("isRedirect", true);
	}
	
}
