package kr.ac.green.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class StudentDao implements DBInfo{
	private StudentDao() {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	private final static StudentDao instance = new StudentDao();
	
	public static StudentDao getInstance() {
		return instance;
	}
	
	public Connection connect() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(DB_URL, DB_UID, DB_UPW);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	public int insert(Connection con, Student std) {
		int result = 0;
		
		PreparedStatement pStmt = null;
		try {
			pStmt = con.prepareStatement(SQLS[INSERT]);
			pStmt.setString(1, std.getStd_name());
			pStmt.setString(2, std.getStd_tel());
			pStmt.setInt(3, std.getStd_grade());
			pStmt.setInt(4, std.getStd_class());
			
			result = pStmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public int delete(Connection con, String who, int what) {
		int result = 0;
		
		PreparedStatement pStmt = null;
		try {
			pStmt = con.prepareStatement(SQLS[DELETE]);
			pStmt.setInt(1, what);
			
			result = pStmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pStmt.clearParameters();
				pStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public Student getSearch(Connection con, int i) {
		Student std = null;
		
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		
		try {
			pStmt = con.prepareStatement(SQLS[SEARCH]);
			pStmt.setInt(1, i);
			rs = pStmt.executeQuery();
			
			if(rs.next()) {
				int id = rs.getInt("std_id");
				String name = rs.getString("std_name");
				String tel = rs.getString("std_tel");
				int grade = rs.getInt("std_grade");
				int std_class =	rs.getInt("std_class");
				
				std = new Student(id, name, tel, grade, std_class);
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				pStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return std;
	}
	public Student[] getAll(Connection con) {
		Student[] list = null;
		
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		
		try {
			pStmt = con.prepareStatement(SQLS[ALLSEARCH]);
			rs = pStmt.executeQuery();
			Vector<Student> vec = new Vector<Student>();
			while(rs.next()) {
				int id = rs.getInt("std_id");
				String name = rs.getString("std_name");
				String tel = rs.getString("std_tel");
				int grade = rs.getInt("std_grade");
				int std_class =	rs.getInt("std_class");
				
				vec.add(new Student(id, name, tel, grade, std_class));
			}
			list = vec.toArray(new Student[0]);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public void disconnect(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
