<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*" %>
<%@ page import = "kr.ac.green.Article" %>
<%-- addArticle.jsp --%>
<%
	request.setCharacterEncoding("euc_kr");
	
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String contents = request.getParameter("contents");
	String pw = request.getParameter("pw");
	
	Article article = new Article(title, writer, contents, pw);
	
	Vector<Article> list = (Vector<Article>) application.getAttribute("list");
	
	if(list == null) {
		list = new Vector<Article>();
		application.setAttribute("list", list);
	}
	list.add(article);
	
	response.sendRedirect("list.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>