<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String cmd2 = request.getParameter("cmd2");
%>
<html>
<head>
<link rel = "stylesheet" href = "style.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<body>	
		<jsp:include page = "menuForm.jsp" />
		
		<div class = "box2">	
			<form action = "MainServlet" method = "post">
				검색 : <select name = "search">
						<option value = "std_id"> ID </option>
					  </select>
				내용 : <input type = "text" name = "desc"/> 
			
			<input type = "submit" value = "go" />
			<input type = "hidden" name = "cmd" value = "search" />
			<input type = "hidden" name = "cmd2" value = "<%= cmd2 %>" />
			</form>
			<br>
		</div>
</body>
</body>
</html>