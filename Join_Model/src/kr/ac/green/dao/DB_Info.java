package kr.ac.green.dao;

public interface DB_Info {
	String DRIVER = "com.mysql.jdbc.Driver";
	String DB_URL = "jdbc:mysql://localhost:3306/test";
	String DB_UID = "root";
	String DB_UPW = "1234";
	
	String[] SQLS = {
		"SELECT * FROM join_info WHERE id = ? ORDER BY id DESC;",
		"DELETE FROM join_info WHERE id = ? AND name = ? AND password = ? AND nickName = ? AND tel = ?;",
		"INSERT INTO join_info (name, password, nickName, tel) VALUES (?,?,?,?);",
		"UPDATE join_info SET name = ?, password = ?, nickName = ?, tel = ? WHERE id = ?;",
		"SELECT * FROM join_info ORDER BY id DESC;"
	};
	
	int SEARCH = 0;
	int DELETE = 1;
	int INSERT = 2;
	int UPDATE = 3;
	int ALLSEARCH = 4;
}
