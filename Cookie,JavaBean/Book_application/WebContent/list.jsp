<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.util.*" %>
<%@ page import = "kr.ac.green.*" %>
<%
	Vector<Doc> docList = (Vector<Doc>)application.getAttribute("docList");
	if(docList == null) {
		docList = new Vector<Doc>();
	}
	
	Collections.sort(docList);
	
	int pageNum = 1;
	String paramPageNum = request.getParameter("pageNum");
	if(paramPageNum != null) {
		pageNum = Integer.parseInt(paramPageNum);
	}
	
	int size = docList.size();
	int perPage = 3;
	int pageCount = size/perPage;
	if((size % perPage) != 0) {
		pageCount ++;
	}
	int start = (pageNum - 1) * perPage;
	int end = start + perPage;
	if(end > size) {
		end = size;
	}
	List<Doc> list = docList.subList(start, end);
%>
<table id = "docList">
	<caption> - �� �� �� - </caption>
	<thead>
		<tr id = "docListHeader">
			<th id = "docNum">��ȣ</th>
			<th id = "docContents">����</th>
			<th id = "docWriter">�ۼ���</th>
			<th id = "docDate">�ۼ���</th>
		</tr>
	</thead>
	<% 
		if(size!=0) {
	%>
	<tfoot>
		<tr>
			<td colspan = "4">
			<%
				for(int i=1; i<=pageCount; i++) {
					if(i == pageNum) {
			%>
				[<b><%= i %></b>]
			<%
					}else {
			%>
				[<a href = "template.jsp?contentsPage=list&pageNum=<%= i %>"><%=i %></a>]
			<%
					}
				}
			%>
			</td>
		</tr>
	</tfoot>
	<%
		}
	%>
	<tbody>
	<%
		if(size == 0) {
	%>
		<tr>
			<td colspan="4">no data</td>
		</tr>
	<%
		} else {
			for(int num=0; num <list.size(); num++) {
				Doc doc = list.get(num);
	%>
		<tr>
		 	<td><%= doc.getNum()  %></td>
		 	<td><%= doc.getContents() %></td>
		 	<td><%= doc.getWriter()  %></td>
		 	<td><%= doc.getDate() %></td>
		 </tr>
	<%
			}
		}
	%>
	</tbody>
</table>
