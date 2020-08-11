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
		
		// ��ü �۰��� ���ϱ�
		int totalDocsCount = dao.getTotalCount(con);
		request.setAttribute("totalDocsCount", totalDocsCount);
		
		//��û���� ������ ��ȣ
		String temp = request.getParameter("pageNum");
		int pageNum = 1;
		if(temp != null) {
			pageNum = Integer.parseInt(temp);
		}
		request.setAttribute("pageNum", pageNum);
		
		//�������� 3��
		Doc[] list = dao.getList(con, pageNum, 3);
		dao.disconnect(con);
		
		request.setAttribute("list", list);
		
		PageInfo info = (PageInfo)request.getSession().getAttribute("pageInfo");
		
		info.setRedirect(false);
		info.setBottom("list.jsp");
	}
}
