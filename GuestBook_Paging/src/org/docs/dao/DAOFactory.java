package org.docs.dao;

public class DAOFactory {
	public static String db_type;
	
	public static void initDB(String db_type) {
		DAOFactory.db_type = db_type;
	}
	
	public static IDAO getDao() {
		if(db_type.equals("mysql")) {
			return MySQLDocsDAO.getInstance();
		}
		return null;
	}
}
