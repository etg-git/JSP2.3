<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.ac.green.*" %>
<%@ page import = "java.util.*" %>

<%
	request.setCharacterEncoding("euc_kr");
%>
<jsp:useBean id = "member" class = "kr.ac.green.Member" />
<jsp:setProperty property = "*" name = "member" />

<%
	String msg = "회원가입 성공";
	String nextPage = "loginForm.jsp";
	if(!MemberManager.addMember(application, member)) {
		msg = "이미 존재하는 아이디 입니다.";
		session.setAttribute("tempMember", member);
		nextPage = "join.jsp";
	}
	session.setAttribute("msg", msg);
	response.sendRedirect(nextPage);
%>