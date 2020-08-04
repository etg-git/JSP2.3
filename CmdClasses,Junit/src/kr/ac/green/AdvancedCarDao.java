package kr.ac.green;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class AdvancedCarDao {
	
	public static final String DRIVER = "com.mysql.jdbc.Driver";
	public static final String DB_URL = "jdbc:mysql://localhost:3306/test";
	public static final String UID = "root";
	public static final String UPW = "1234";
	
	public static final String[] SQLS = {
		"INSERT INTO car (car_model, car_price, car_desc) VALUES (?, ?, ?)",
		"SELECT * FROM car ORDER BY car_id DESC",
		"DELETE FROM car"
	};
	
	public static final int INSERT = 0;
	public static final int READ = 1;
	public static final int CLEAR = 2;

	private AdvancedCarDao() {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	private static final AdvancedCarDao dao = new AdvancedCarDao();
	
	public static AdvancedCarDao getDao() {
		return dao;
	}
	
	public Connection connect() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(DB_URL, UID, UPW);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	public void disconnect(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int insertCar(Connection con, Car car) {
		int result = 0;
		PreparedStatement pStmt = null; //statement를 상속받았다. 좀더 나은효과를 준다.
		
		try {
			//이미 insert를 할것을 알고있고, ?에 어떤값이 들어가는지만 알면된다.
			//일을 전부 한다는지, 아예 안한다던지 : 트랜잭션(transaction)
			pStmt = con.prepareStatement(SQLS[INSERT]);
			pStmt.setString(1, car.getCar_model());
			pStmt.setInt(2, car.getCar_price());
			pStmt.setString(3, car.getCar_desc());
			result= pStmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pStmt.clearParameters(); //파라미터의 정보를 다 날린다.
				pStmt.close();
			} catch(Exception e) {}
		}
		return result;
	}
	public int clear(Connection con) {
		int result = 0;
		PreparedStatement pStmt = null;
		
		try {
			pStmt = con.prepareStatement(SQLS[CLEAR]);
			result = pStmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pStmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return result;
	}
	public Car[] getAll(Connection con) {
		Car[] list = null;
		
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		
		try {
			pStmt = con.prepareStatement(SQLS[READ]);
			rs = pStmt.executeQuery();
			
			rs.last();
			int count = rs.getRow();
			rs.beforeFirst();
			list = new Car[count];
			int idx = 0;
			
			while(rs.next()) {
				rs.getString("car_model");
				int id = rs.getInt("car_id");
				String desc = rs.getString("car_desc");
				int price = rs.getInt("car_price");
				String model = rs.getString("car_model");
				
				list[idx] = new Car(id, model, price, desc);
				idx++;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch(Exception e) {}
			try {
				pStmt.close();
			} catch(Exception e) {}
		}
		return list;
	}
}
