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
	
	<jsp:include page = "menuForm.jsp" />
	
	<div class = "box2" style = "text-align : center;">
	<form action = "MainServlet" method = "post">
		<input type = "hidden" name = "cmd" value = "register" />
		<table style = background-color:gray;>
			<thead>
			</thead>
				<tfoot>
					<tr>
					<td colspan = "2"> <input type = "submit" value = "insert" /></td>
					</tr>  
				</tfoot>
				
				<tbody>
					<tr>
						<th>NAME</th>
						<td><input type ="text" name = "name" placeholder= "�̸����Է��ϼ���"> </td>
					</tr>
					<tr>
						<th>Tel</th>
						<td><input type = "text" name = "tel" placeholder = "��ȭ��ȣ�� �Է��ϼ���"> </td>
					</tr>
					<tr>
						<th>Grade</th>
						<td><input type = "text" name= "grade" placeholder = "�г��� �Է��ϼ���"> </td>
					</tr>
					<tr>
						<th>Class</th>
						<td><input type = "text" name= "class" placeholder = "���� �Է��ϼ���"> </td>
					</tr>
				</tbody>
		</table>
	</form>
	</div>
</body>
</html>