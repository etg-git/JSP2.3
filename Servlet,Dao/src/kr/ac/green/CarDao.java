package kr.ac.green;

import java.io.Closeable;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

// Database에 CRUD업무를 정의
// 내부적으로 통신이 일어나는 클래스, 특별한 방법으로만들어야한다.
// Singleton Pattern : 유일한 단 하나의 객체를 보장하는 기법
public class CarDao {
	// 1. 생성자를 private하게 정의한다.
	private CarDao() {
		// 드라이버 로드
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
	// 2. static한 instance를 정의한다.
	private final static CarDao instance = new CarDao();
	
	// 3. getter 구현한다.
	public static CarDao getInstance() {
		return instance;
	}
	
	// 데이터베이스 연결
	public Connection connect() {
		Connection con = null;
		
		try {
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test",
					"root",
					"1234");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	// 연결끊기
	public void disconnect(Connection con) {
		try {
				con.close();
		} catch(Exception e) {}
	}
	
	// insert
	public int insertCar(Connection con, Car car) {
		int result = 0;
		
		Statement stmt = null;
		String sql = "INSERT INTO car (car_model, car_price, car_desc)" +
						"VALUES ('%s', '%d', '%s')"; //문자열이라서 ''
		sql = sql.format(sql, toEn(car.getCar_model()), car.getCar_price(), toEn(car.getCar_desc()));
		
		try {
			stmt = con.createStatement();
			
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		return result;
	}
	
	
	// read
	public Car[] getAll(Connection con) {
		Car[] list = null;
		
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM car ORDER BY car_id DESC";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			Vector<Car> vec = new Vector<Car>();
			while(rs.next()) {
				int id = rs.getInt("car_id");
				String model = toKor(rs.getString("car_model"));
				String desc = toKor(rs.getString("car_desc"));
				int price = rs.getInt("car_price");
				
				vec.add(new Car(id, model, price, desc));
			}
			list = vec.toArray(new Car[0]);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return list;
	}
	
	private void close(Statement stmt) {
		try {
			stmt.close();
		} catch(Exception e) {}
	}
	
	private void close(ResultSet rs) {
		try {
			rs.close();
		} catch(Exception e) {}
	}
	private String toKor(String en) {
		String kor = null;
		
		try {
			kor = new String(en.getBytes("8859_1"), "euc_kr");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return kor;
	}
	
	private String toEn(String kor) {
		String en = null;
		
		try {
			en = new String(kor.getBytes("euc_kr"), "8859_1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return en;
	}
}
