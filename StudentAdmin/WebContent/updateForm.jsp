<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel = "stylesheet" href = "style.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1 style = text-align:center;> Student Management System</h1>
	<div class ="box" style = text-align:center;>
			<ul>
			<li style = text-align:center;> 메뉴 </li>
			<li> <a href = "MainServlet?cmd=list"> 학생리스트 </a></li>
			<li> <a href = "MainServlet?cmd=add"> 학생정보 입력 </a></li>
			<li> <a href = "MainServlet?cmd=update"> 학생정보 수정 </a></li>
			<li> <a href = "MainServlet?cmd=delete"> 학생정보 삭제 </a></li>
			</ul>
		</div>
	
	<div class = "box2" style = "text-align : center;">
	<form action = "MainServlet" method = "post">
		<input type = "hidden" name = "cmd" value = "update" />
		<table style = background-color:gray;>
			<thead>
			</thead>
			<tfoot>
				<tr>
				<td colspan = "2"> <input type = "submit" value = "Modify" /></td>
				</tr>  
			</tfoot>
			
			<tbody>
				<tr>
					<th>ID</th>
					<td><input type ="text" name = "id" placeholder= "아이디를입력하세요"> </td>
				</tr>
				<tr>
					<th>NAME</th>
					<td><input type ="text" name = "name" placeholder= "이름을입력하세요"> </td>
				</tr>
				<tr>
					<th>Tel</th>
					<td><input type = "text" name = "tel" placeholder = "전화번호를 입력하세요"> </td>
				</tr>
				<tr>
					<th>Grade</th>
					<td><input type = "text" name = "grade" placeholder = "학년을 입력하세요"> </td>
				</tr>
				<tr>
					<th>Class</th>
					<td><input type = "text" name = "class" placeholder = "반을 입력하세요"> </td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
</body>
</html>