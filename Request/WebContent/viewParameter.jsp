<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Enumeration" %>
<%@ page import = "java.util.Map" %>
<%
	request.setCharacterEncoding("EUC-KR"); //UTF-8�� ������ �ؾ���(POST����϶���). GET���� �������� ǥ��ȭ�� ����� ���������ʴ´�(�����ü�����).
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��û �Ķ���� ���</title>
</head>
<body>
<b> request.getParamter() �޼��� ���</b> <br>
name �Ķ���� = <%= request.getParameter("name") %> <br>
address �Ķ���� = <%= request.getParameter("address") %> <br>
<p>
<b> request.getParameterValues() �޼��� ��� </b><br>

<%

	String[] values = request.getParameterValues("pet");
	if(values!=null) {
		for(int i=0; i<values.length; i++) {
			%>
			<%= values[i] %>
<% 
		}
	}
%>
</p>
<p>
<b> request.getParameterNames() �޼��� ��� </b><br>
<% 
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()) {
		String name =(String)paramEnum.nextElement();
%>
	<%= name %>
	<% 
	}
%>
</p>
<p>
<b>request.getParameterMap() �޼��� ���</b> <br>
<% 
	Map parameterMap = request.getParameterMap(); //Ű : string �� : string�迭
	String[] nameParam = (String[])parameterMap.get("name");
	if(nameParam != null) {
%>
	name = <%= nameParam[0] %>
<%
	}
%>
</p>
</body>
</html>