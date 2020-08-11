<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id ="writeBox">
	<fieldset>
		<legend>Write</legend>
		<form action = "MainServlet" method = "post">
			<label for = "d_title">title : </label><input id = "title_input" type = "text" name = "d_title" />
			<br>
			<label for = "d_author">author : </label><input id = "author_input" type = "text" name = "d_author" />
			<br>
			<label for = "d_content">content : </label><input id = "content_input" type = "text" name = "d_content" />
			<br>
			<div id = "btnArea">
			<input type = "submit" value = "write" />
			</div>
			<input type = "hidden" name = "cmd" value = "write" />
		</form>
	</fieldset>
	
</div>