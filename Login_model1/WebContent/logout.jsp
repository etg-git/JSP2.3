<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	session.invalidate();

	session = request.getSession();
	session.setAttribute("msg", "�α׾ƿ� �Ǿ����ϴ�.");
%>
<jsp:forward page = "loginForm.jsp" />