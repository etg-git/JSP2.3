package kr.ac.green.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.ac.green.dto.JoinInfo;

public class JoinInfoDao implements DB_Info{
	private JoinInfoDao() {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	private final static JoinInfoDao dao = new JoinInfoDao();
	
	public static JoinInfoDao getInstance() {
		return dao;
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
	
	public void disconnect(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public JoinInfo search(Connection con, int id) {
		JoinInfo info = null;
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		try {
			pStmt = con.prepareStatement(SQLS[SEARCH]);
			pStmt.setInt(1, id);
			rs = pStmt.executeQuery();
			
			if(rs.next()) {
				int my_id = rs.getInt("id");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String nickName = rs.getString("nickName");
				String tel = rs.getString("tel");
				
				info = new JoinInfo(my_id, name, password, nickName, tel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				pStmt.close();
			} catch(Exception e) {
				
			}
		}
		
		return info;
	}
	public int update(Connection con, JoinInfo join) {
		int result = 0;
		PreparedStatement pStmt = null;
		try {
			pStmt = con.prepareStatement(SQLS[UPDATE]);
			pStmt.setString(1, join.getName());
			pStmt.setString(2, join.getPassword());
			pStmt.setString(3, join.getNickName());
			pStmt.setString(4, join.getTel());
			pStmt.setInt(5, join.getId());
			
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
	public int delete(Connection con, JoinInfo join) {
		int result = 0;
		PreparedStatement pStmt = null;
		try {
			pStmt = con.prepareStatement(SQLS[DELETE]);
			pStmt.setInt(1, join.getId());
			pStmt.setString(2, join.getName());
			pStmt.setString(3, join.getPassword());
			pStmt.setString(4, join.getNickName());
			pStmt.setString(5, join.getTel());
			
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
	public int insert(Connection con, JoinInfo join) {
		int result = 0;
		
		PreparedStatement pStmt = null;
		
		try {
			pStmt = con.prepareStatement(SQLS[INSERT]);
			pStmt.setString(1, join.getName());
			pStmt.setString(2, join.getPassword());
			pStmt.setString(3, join.getNickName());
			pStmt.setString(4, join.getTel());
			
			result = pStmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public JoinInfo[] getAll(Connection con) {
		JoinInfo[] list = null;
		
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		
		try {
			pStmt = con.prepareStatement(SQLS[ALLSEARCH]);
			rs = pStmt.executeQuery();
			
			rs.last();
			int count = rs.getRow();
			rs.beforeFirst();
			
			list = new JoinInfo[count];
			int idx = 0;
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String nickName = rs.getString("nickName");
				String tel = rs.getString("tel");
				
				list[idx] = new JoinInfo(id, name, password, nickName, tel);
				idx++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			}catch(Exception e) {}
			try {
				pStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
