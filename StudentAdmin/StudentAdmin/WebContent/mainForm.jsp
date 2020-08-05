<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.ac.green.dao.Student" %>
<%
	Student[] list = (Student[]) request.getAttribute("list");
%>
<html>
<link rel = "stylesheet" href = "style.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>studentManageForm</title>
</head>
<body>
		<jsp:include page = "menuForm.jsp" />
		<div class = "box2" style = text-align:center;>
			<jsp:include page = "search.jsp" />
		<br>
		<table>
		<caption> Student List </caption>
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Tel</th>
					<th>Grade</th>
					<th>Class</th>
				</tr>
			</thead>
			
			<tfoot>
				<tr>
					<th colspan = "5"> <%= list.length %> rows(s) </th>
 				</tr>
			</tfoot>
			
			<tbody>
				<%
					if(list.length == 0) {
				%>
					<tr>
						<td colspan="5"> NO DATA </td>
					</tr>				
				<%
					} else {
						for(Student std : list) {	
				%>
					<tr>
						<td><%= std.getStd_id() %></td>
						<td><%= std.getStd_name() %></td>
						<td><%= std.getStd_tel() %></td>
						<td><%= std.getStd_grade() %></td>
						<td><%= std.getStd_class() %></td>
					</tr>
				<%
						}
					}
				%>
			</tbody>
		</table>
		</div>
</body>
</html>