<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
%>
<html>
<body>

<jsp:include page = "startMenu.jsp" />
<form class="navbar-form navbar-left" action = "MainServlet">
	<input type = "hidden" name = "cmd" value = "allSearch" />
	  <div class="form-group" style=margin-left:100px>
	    <input type="text" class="form-control" placeholder="아이디로 검색하세요." name = "search_desc">
	  </div>
	  <button type="submit" class="btn btn-default">검색</button>
</form>
</body>
</html>