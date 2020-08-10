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
<title>회원정보들</title>
</head>
<body>
<jsp:include page = "searchForm.jsp" />
<hr/>
<table class="table">
  <thead>
    <tr>
      <th scope="col">아이디</th>
      <th scope="col">이름</th>
      <th scope="col">닉네임</th>
      <th scope="col">전화번호</th>
    </tr>
  </thead>
  <tfoot>
  	<%
  		if(list == null) {
  			
  	%>
  		<th scope ="row" colspan = "4"> [0]행rows </th>
  	<%
  		}else{
  	%>
  		<th scope ="row" colspan = "4"> [<%= list.length %>]행rows </th>
  		
  	<%
  		}
  	%>
  </tfoot>
  <tbody>
   
    	<%
    		if(list == null || list.length == 0) {
    	%>	
    		 <tr>
    			<th scope="row">등록된 정보가 없습니다.</th>
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