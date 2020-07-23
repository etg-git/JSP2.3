<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>å ���ø����̼�</title>
</head>
<%
	request.setCharacterEncoding("euc_kr");
	Enumeration<String> names = request.getParameterNames();
	String path = application.getRealPath(application.getInitParameter("dataPath"));

	Vector<String> valueList = new Vector<String>();
	while (names.hasMoreElements()) {
		String value = request.getParameter(names.nextElement());
		valueList.add(value);
	}
	if (valueList.size() != 0) {
		response.sendRedirect("http://localhost:8080/07_22/BookRegister.jsp");
		FileWriter fw = null;
		try {
			fw = new FileWriter(path, true);
			int count = 0;
			for (String values : valueList) {
				fw.write(values + " ");
				count ++;
				if(count % 6 == 0) {
					fw.write("\n");
				}
			}
			fw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fw.close();
			} catch (Exception e) {
			}
		}
	}

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
	<form action="BookRegister.jsp" method="POST">
		���� : <input type="text" name="title" /> <br> ���� : <input
			type="text" name="author" /> <br> ���� : <input type="text"
			name="price" /> <br> ������ <br> <input type="text"
			name="year" width=10px />�� <input type="text" name="month" />�� <input
			type="text" name="day" />�� <br>

			<input type="submit" value="����" />
	</form>

	<br>
	<br>
	<br>
	<br>
	<br>

	<table border="1" width= "80%">
		<thead>
			<tr>
				<th>����</th>
				<th>����</th>
				<th>����</th>
				<th>������</th>
			</tr>
		</thead>

		<tfoot>

		</tfoot>

		<tbody>
				<%
				if(size != 0) {
					for (int i = size - 1; i >= 0; i--) {
						StringTokenizer st = new StringTokenizer(list.get(i));
						String title = st.nextToken();
						String author = st.nextToken();
						String price = st.nextToken() + "��";
						String date = st.nextToken() + "�� " + st.nextToken() + "�� " + st.nextToken() + "��";
				%>
				<tr>
					<td><%=title%></td>
					<td><%=author%></td>
					<td><%=price%></td>
					<td><%=date%></td>

				</tr>
				<%
					}
				}
				%>

		</tbody>
		
	</table>

</body>
</html>
