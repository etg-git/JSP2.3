package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.JoinInfoDao;
import kr.ac.green.dto.JoinInfo;

public class DeleteCmd implements ICmd{

	@Override
	public void action(HttpServletRequest request) {
		JoinInfoDao dao = JoinInfoDao.getInstance();
		
		Connection con = dao.connect();
		
		JoinInfo info = new JoinInfo();
		System.out.println(info.getId());
		System.out.println(info.getName());
		System.out.println(info.getNickName());
		System.out.println(info.getPassword());
		System.out.println(info.getTel());
		info.setId(Integer.parseInt(request.getParameter("id")));
		info.setName(request.getParameter("name"));
		info.setNickName(request.getParameter("nickName"));
		info.setPassword(request.getParameter("password"));
		info.setTel(request.getParameter("tel"));
		
		dao.delete(con, info);
		dao.disconnect(con);
		
		request.setAttribute("nextPage", request.getContextPath());
		request.setAttribute("isRedirect", true);		
	}
	
}
