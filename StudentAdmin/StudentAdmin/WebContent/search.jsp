<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel = "stylesheet" href = "style.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>studentManageForm</title>
</head>
<body>		
			<form action = "MainSevlet" method = "post">
				검색 : <select name = "search">
						<option value = "std_id"> ID </option>
						<option value = "std_name"> name </option>
						<option value = "std_class"> class </option>
					  </select>
				내용 : <input type = "text" name = "desc"/> 
			
			<input type = "submit" value = "go" />
			<input type = "hidden" name = "cmd" value = "allSearch" />
			</form>
		<br>
</body>
</html>