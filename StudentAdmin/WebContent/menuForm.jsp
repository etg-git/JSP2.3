<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel = "stylesheet" href = "style.css">
<body>	
	<h1 style = text-align:center;> Student Management System</h1>
		
		<div class ="box" style = text-align:center;>
			<ul>
			<li style = text-align:center;> 메뉴 </li>
			<li> <a href = "MainServlet"> 학생리스트 </a></li>
			<li> <a href = "MainServlet?cmd=add"> 학생정보 입력 </a></li>
			<li> <a href = "MainServlet?cmd=goSearch&cmd2=update"> 학생정보 수정 </a></li>
			<li> <a href = "MainServlet?cmd=goSearch&cmd2=delete"> 학생정보 삭제 </a></li>
			</ul>
		</div>
</body>
</html>