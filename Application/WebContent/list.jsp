<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("euc_kr");
	String data = request.getParameter("inputData");
	String path = application.getRealPath(application.getInitParameter("dataPath"));
	FileReader fr = null;
	BufferedReader br = null;

	Vector<String> list = new Vector<String>();
	try {
		fr = new FileReader(path);
		br = new BufferedReader(fr);
		String line = null;

		while ((line = br.readLine()) != null) {
			list.add(line);
		}
	} catch (IOException e) {
		e.printStackTrace();
	} finally {
		try {
			br.close();
		} catch (Exception e) {
		}
		try {
			fr.close();
		} catch (Exception e) {
		}
	}

	int size = list.size();
%>

<body>
	<a href="write.jsp">�۵��</a>
	<hr>
	<table>
		<caption>�۸��</caption>
		<thead>
			<tr>
				<th>��ȣ</th>
				<th>����</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th colspan="2"><%=size%> ��</th>
			</tr>
		</tfoot>
		<tbody>
			<%
				for (int i = size - 1; i >= 0; i--) {
			%>
			<tr>
				<td><%=i + 1%></td>
				<td><%=list.get(i)%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>	
</body>


</html>