<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String msg = (String) session.getAttribute("msg");

	if(msg == null) {
		msg = "�������";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>LoginForm</title>
<link rel = "stylesheet" type = "text/css" href = "css/main.css">
<script>
	function goJoin() {
		location.href = "join.jsp";
	}
	function checkLogin() {
		var obj = document.loginForm;
		obj.action = "checkLogin.jsp";
		obj.method = "post";
		obj.submit();
	}
</script>
</head>
<body>
	<p class ="titleStr">
		Login
	</p>
	
	<form name = "loginForm">
		<div class = "centerBox">
			<label for = "u_id"> ID : </label><input type = "text" name = "u_id" /> <br>
			<label for = "u_pw"> PW : </label><input type = "password" name = "u_pw" /> <br>
			<div class = "btns">
				<input type = "button" value = "�α���" onclick = "checkLogin()" />
				<input type = "button" value = "ȸ������" onclick = "goJoin()" />
			</div>
			<div class = "msgBox">
				<%= msg %>
			</div>
		
		</div>	
	</form>
</body>
</html>
<%@ include file = "removeMessage.jspf" %>