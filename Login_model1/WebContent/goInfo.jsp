<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	session.setAttribute("msg", "비밀번호와 닉네임이 변경 가능합니다.");
%>
<jsp:forward page = "info.jsp" />