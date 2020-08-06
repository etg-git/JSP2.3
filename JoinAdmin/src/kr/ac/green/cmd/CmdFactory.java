package kr.ac.green.cmd;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;

public class CmdFactory {
	private static Hashtable<String, ICmd> tables;
	
	public static void init() {
		tables = new Hashtable<String, ICmd>();
		
		tables.put("getAll", new GetAllCmd());
		tables.put("insert", new InsertCmd());
		tables.put("goSearch", new GoSearchCmd());
		tables.put("join", new GoJoinCmd());
		tables.put("update", new UpdateCmd());
		tables.put("delete", new DeleteCmd());
		tables.put("search", new SearchCmd());
		tables.put("allSearch", new AllSearchCmd());
	}
	
	public static void doAction(HttpServletRequest request, String cmd) {
		tables.get(cmd).action(request);
	}
}
