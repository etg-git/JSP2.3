<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<fieldset>
	<legend>�۾���</legend>
	<form action = "doWrite.jsp" method ="post">
		<input type = "text" name = "writer" placeholder="�ۼ���" />
		<br><br>
		<textarea name = "contents" rows = "5" placeholder = "����"> </textarea>
		<br>
		<input type = "submit" value = "�Ϸ�" />
	</form>
</fieldset>