<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ձ��ϱ�</title>
</head>
<body>
	<%
		int sum = 0;
		for (int i = 1; i <= 10; i++) {
			sum = sum + i;
		}
	%>
	1���� 10������ ����
	<%=sum%>
	�Դϴ�.

	<%
		int sum2 = 0;
		for (int i = 11; i < 20; i++) {
			sum2 = sum2 + i;
		}
	%>
	11���� 20������ ����
	<%=sum2%>
	�Դϴ�.

	<table border="1">
		<%
			for (int i = 1; i < 100; i++) {
				if (i % 2 == 0) {
		%>
		<tr>
			<th><%=i%></th>
		</tr>
		<%
			} else {
		%>
		<tr>
			<td><%=i%></td>
		</tr>
		<%
			}
			}
		%>
		</table>
</body>
</html>