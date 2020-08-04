<%@page import="java.io.UnsupportedEncodingException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.ac.green.Car" %>
<%@ page import = "java.sql.*" %>

<jsp:useBean id = "car" scope = "request" class = "kr.ac.green.Car" />
<jsp:setProperty property = "*" name = "car" />

<%
	/*
		JDBC 프로그래밍 절차
		1. 드라이버 로드
		2. 연결 -> java.sql.Connection
		3. 질의 -> java.sql.Statement(CRUD)
		4. 연결해제
	*/
	
	// 1. 드라이버 로드 -> DriverManager에 등록 (1회만 실행하면 된다.)
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2. 연결
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/test", 	// DBURL
			"root",	// UID
			"1234"	// UPW
	);
	
	//질의 담당 객체
	Statement stmt = con.createStatement();
	String sql = "INSERT INTO car (car_model, car_price, car_desc)" +
			// "VALUES (' " +  car.getCar_model() + "', " + car.getCar_price() +", '" + car.getCar_desc() + "');";
			"VALUES ('%s', '%d', '%s');";
	sql = String.format(
			sql, car.getCar_model(), car.getCar_price(), car.getCar_desc());
	
	/*
		executeUpdate : INSERT, UPDATE, DELETE -> 적용된 레코드 수가 리턴
		executeQuery : SELECT -> 적용된 데이터 테이블을 리턴
	*/
	int result = stmt.executeUpdate(sql);
		
	
	//4. 연결 끊기.
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