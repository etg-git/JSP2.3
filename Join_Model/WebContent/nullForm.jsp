<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>찾는 무언가 없음</title>
</head>
<body>
<ul class="nav nav-tabs">
  <li role="presentation" class="active"><a href="MainServlet">Home</a></li>
  <li role="presentation"><a href="MainServlet?cmd=join">회원가입</a></li>
  <li role="presentation"><a href="MainServlet?cmd=goSearch&cmd2=update">회원수정</a></li>
  <li role="presentation"><a href="MainServlet?cmd=goSearch&cmd2=delete">회원삭제</a></li>
</ul>
</body>
</html>