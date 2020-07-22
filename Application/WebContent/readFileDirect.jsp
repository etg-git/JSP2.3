<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>readFileDirectory.jsp</title>
</head>
<body>
	<%
		char[] buff = new char[128];
		int len = -1;
		String filepath = "c:\\test\\notice.txt";
		
		FileReader fr = null;		
		try {
			fr = new FileReader(filepath);
			while((len = fr.read(buff)) != -1) {
				out.println(new String(buff, 0, len));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fr.close();
			} catch(Exception e) {}
		}
	%>
</body>
</html>