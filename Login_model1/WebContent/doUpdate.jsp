<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "checkSession.jspf" %>

<%@ page import = "kr.ac.green.*" %>

<%
	request.setCharacterEncoding("euc_kr");
	member.setU_pw(request.getParameter("u_pw"));
	member.setU_nick(request.getParameter("u_nick"));
	
	MemberManager.updateMember(application, member);
	session.setAttribute("msg", "ȸ�������� �����Ǿ����ϴ�.");
	
	response.sendRedirect("loginSuccess.jsp");
%>