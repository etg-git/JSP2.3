<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "kr.ac.green.Car" %>
<%@ page import = "java.util.*" %>
<%	
	request.setCharacterEncoding("euc_kr");
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/test",
			"root",
			"1234"
	);
	
	String sql = "SELECT * FROM car ORDER BY car_id DESC";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	Vector<Car> list = new Vector<Car>();
	while(rs.next()) {
		int car_id = rs.getInt("car_id");
		String car_model = rs.getString("car_model");
		String car_desc = rs.getString("car_desc");
		int car_price = rs.getInt("car_price");
		
		Car car = new Car(car_id, car_model, car_price, car_desc);
		list.add(car);
	}
	
	rs.close();
	stmt.close();
	con.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list.jsp</title>
</head>
<body>
	<a href = "insert.jsp"> insert car </a>
	<br>
	
	<table>
		<tr>
			<th>ID</th>
			<th>Model</th>
			<th>Price</th>
			<th>Description</th>
		</tr>
		<%
			if(list.size() == 0) {
		%>
		<tr>
			<td colspan = "4"> empty </td>
		</tr>
		<% 	
			} else {
			for(Car temp : list) {
		%>
		<tr>
			<td><%= temp.getCar_id() %> </td>
			<td><%= temp.getCar_model() %> </td>
			<td><%= temp.getCar_price() %> </td>
			<td><%= temp.getCar_desc() %> </td>
		</tr>
		<%
			}
		}
		%>
	</table>
</body>
</html>