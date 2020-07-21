<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>requestTest.jsp</title>
</head>
<body>
	<%
		request.getContextPath();
	
	%>
	<%= request.getContextPath()
	
	%>
	<%!
	//선언부엔 request객체 쓸수없다
	%>

</body>
</html>