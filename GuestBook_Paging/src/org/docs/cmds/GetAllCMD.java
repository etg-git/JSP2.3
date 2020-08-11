package org.docs.cmds;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.docs.beans.Doc;
import org.docs.controller.PageInfo;
import org.docs.dao.DAOFactory;
import org.docs.dao.IDAO;

public class GetAllCMD implements ICMD{
	@Override
	public void action(HttpServletRequest request, HttpServletResponse response) {
		IDAO dao = DAOFactory.getDao();
		Connection con = dao.connect();
		
		// 전체 글갯수 구하기
		int totalDocsCount = dao.getTotalCount(con);
		request.setAttribute("totalDocsCount", totalDocsCount);
		
		//요청받은 페이지 번호
		String temp = request.getParameter("pageNum");
		int pageNum = 1;
		if(temp != null) {
			pageNum = Integer.parseInt(temp);
		}
		request.setAttribute("pageNum", pageNum);
		
		//페이지당 3개
		int perPage = 3;
		Doc[] list = dao.getList(con, pageNum, perPage);
		dao.disconnect(con);
		
		
		int pageCount = totalDocsCount / perPage;
		if(totalDocsCount % 3 > 0) {
			pageCount++;
		}
		
		request.setAttribute("pageCount", pageCount);
		
		request.setAttribute("list", list);
		PageInfo info = (PageInfo)request.getSession().getAttribute("pageInfo");
		
		info.setRedirect(false);
		info.setBottom("list.jsp");
	}
}
