<%@ page import = "kr.ac.green.dto.JoinInfo" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	JoinInfo[] list = (JoinInfo[])request.getAttribute("list");
	
%>
<html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ��������</title>
</head>
<body>
<jsp:include page = "searchForm.jsp" />
<hr/>
<table class="table">
  <thead>
    <tr>
      <th scope="col">���̵�</th>
      <th scope="col">�̸�</th>
      <th scope="col">�г���</th>
      <th scope="col">��ȭ��ȣ</th>
    </tr>
  </thead>
  <tfoot>
  	<%
  		if(list == null) {
  			
  	%>
  		<th scope ="row" colspan = "4"> [0]��rows </th>
  	<%
  		}else{
  	%>
  		<th scope ="row" colspan = "4"> [<%= list.length %>]��rows </th>
  		
  	<%
  		}
  	%>
  </tfoot>
  <tbody>
   
    	<%
    		if(list == null || list.length == 0) {
    	%>	
    		 <tr>
    			<th scope="row">��ϵ� ������ �����ϴ�.</th>
    		</tr>
    	<%
    		}else{
    			for(JoinInfo info : list) {
    	%>
    		<tr>
				<td scope = "row"><%= info.getId() %></td>
				<td scope = "row"><%= info.getName() %></td>
				<td scope = "row"><%= info.getNickName() %></td>
				<td scope = "row"><%= info.getTel() %></td>
			</tr>	 	
	 	<%
    			}
    		}
	 	%>     
    
  </tbody>
</table>
</body>
</html>