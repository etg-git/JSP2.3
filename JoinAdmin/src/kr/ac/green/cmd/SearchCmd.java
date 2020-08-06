package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.JoinInfoDao;
import kr.ac.green.dto.JoinInfo;

public class SearchCmd implements ICmd{

	@Override
	public void action(HttpServletRequest request) {
		String cmd2 = request.getParameter("cmd2");
		int id = Integer.parseInt(request.getParameter("search_desc"));
		
		JoinInfoDao dao = JoinInfoDao.getInstance();
		Connection con = dao.connect();
		dao.connect();
		
		JoinInfo info = dao.search(con, id);
		
		boolean flag = true;
		if(info == null) {
			request.setAttribute("nextPage", "nullForm.jsp");
			flag = false;
		} 
		if(flag) {
			if(cmd2.equals("update")) {
				request.setAttribute("nextPage", "updateForm.jsp");
			} else if(cmd2.equals("delete")) {
				request.setAttribute("nextPage", "deleteForm.jsp");
			}
		}
	}
	
}
