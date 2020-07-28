<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "kr.ac.green.*" %>
<%
	request.setCharacterEncoding("euc_kr");
	String writer = request.getParameter("writer");
	String contents = request.getParameter("contents");
	String date = new SimpleDateFormat("yyyy.MM.dd").format(new Date());
	
	Doc doc = new Doc(writer, contents, date);
	
	Vector<Doc> docList = (Vector<Doc>)application.getAttribute("docList");
	if(docList == null) {
		docList = new Vector<Doc>();
		application.setAttribute("docList", docList);
	}
	docList.add(doc);
	response.sendRedirect("template.jsp");
%>