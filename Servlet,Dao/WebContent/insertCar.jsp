<%@page import="java.io.UnsupportedEncodingException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.ac.green.Car" %>
<%@ page import = "java.sql.*" %>

<jsp:useBean id = "car" scope = "request" class = "kr.ac.green.Car" />
<jsp:setProperty property = "*" name = "car" />

<%
	/*
		JDBC ���α׷��� ����
		1. ����̹� �ε�
		2. ���� -> java.sql.Connection
		3. ���� -> java.sql.Statement(CRUD)
		4. ��������
	*/
	
	// 1. ����̹� �ε� -> DriverManager�� ��� (1ȸ�� �����ϸ� �ȴ�.)
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2. ����
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/test", 	// DBURL
			"root",	// UID
			"1234"	// UPW
	);
	
	//���� ��� ��ü
	Statement stmt = con.createStatement();
	String sql = "INSERT INTO car (car_model, car_price, car_desc)" +
			// "VALUES (' " +  car.getCar_model() + "', " + car.getCar_price() +", '" + car.getCar_desc() + "');";
			"VALUES ('%s', '%d', '%s');";
	sql = String.format(
			sql, car.getCar_model(), car.getCar_price(), car.getCar_desc());
	
	/*
		executeUpdate : INSERT, UPDATE, DELETE -> ����� ���ڵ� ���� ����
		executeQuery : SELECT -> ����� ������ ���̺��� ����
	*/
	int result = stmt.executeUpdate(sql);
		
	
	//4. ���� ����.
	stmt.close();
	con.close();
%>
<%!
	//euc_kr -> 8859_1
	public String toEn(String kor) {
		String en = null;
		
		try {
			en = new String(kor.getBytes("euc_kr"), "8859_1");
		} catch(UnsupportedEncodingException e) {}
		
		return en;
}
%>
<jsp:forward page = "list.jsp" />