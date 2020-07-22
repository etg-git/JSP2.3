<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.*" %>
<%@ page import = "java.net.URL" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>application 기본 객체 사용하여 자원읽기 2</title>
</head>
<body>
	<%
		String resourcePath = "/message/notice.txt";
		char[] buff = new char[128];
		int len = -1;
		URL url = application.getResource(resourcePath);
		InputStreamReader isr = null;
		try {
			isr = new InputStreamReader(url.openStream(), "euc_kr");
			while((len = isr.read(buff)) != -1) {
				out.print(new String(buff, 0, len));
			}
		} catch(Exception e) {
			out.println("익셉션 발생 : " + e.getMessage());
		}
	%>
</body>
</html>