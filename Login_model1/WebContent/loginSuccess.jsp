<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "checkSession.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login Success</title>
<link rel = "stylesheet" type = "text/css" href = "css/main.css">
<script>
	function goLogout() {
		location.href = "logout.jsp";
	}
	function goInfo() {
		var obj = document.successForm;
		obj.action = "goInfo.jsp";
		obj.method = "post";
		obj.submit();
	}
</script>
</head>
<body>
	<p class = "titleStr">
		Success!!
	</p>
	<form name = "successForm">
		<div class = "centerBox">
			<div class = "btns">
				<input type = "button" value = "��������" onclick = "goInfo()" />
				<input type = "button" value = "�α׾ƿ�" onclick = "goLogout()" />
			</div>
		</div>
		<div class = "msgBox">
			<%= session.getAttribute("msg") %>
		</div>
	</form>
</body>
</html>
<%@ include file = "removeMessage.jspf" %>