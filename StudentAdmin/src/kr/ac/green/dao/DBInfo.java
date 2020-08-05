package kr.ac.green.dao;

public interface DBInfo {
	String DRIVER = "com.mysql.jdbc.Driver";
	String DB_URL = "jdbc:mysql://localhost:3306/test";
	String DB_UID = "root";
	String DB_UPW = "1234";
	
	String[] SQLS = {
		"SELECT * FROM student WHERE std_id = ? ORDER BY std_id DESC;",
		"DELETE FROM student WHERE std_id = ? AND std_name = ? AND std_tel = ? AND std_grade = ? AND std_class = ?;",
		"INSERT INTO student(std_name, std_tel, std_grade, std_class) VALUES (?,?,?,?);",
		"UPDATE student SET std_name = ?, std_tel = ?, std_grade = ?, std_class = ? WHERE std_id = ?;",
		"SELECT * FROM student ORDER BY std_id DESC;",
	};
	
	int SEARCH = 0;
	int DELETE = 1;
	int INSERT = 2;
	int UPDATE = 3;
	int ALLSEARCH = 4;
}
