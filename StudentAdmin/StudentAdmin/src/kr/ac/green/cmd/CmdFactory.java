package kr.ac.green.cmd;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;

public class CmdFactory {
	private static Hashtable<String, ICmd> cmds;
	
	public static void init() {
		cmds = new Hashtable<String, ICmd>();
		cmds.put("getAll", new GetAllCmd());
		cmds.put("add", new InputCmd());
		cmds.put("update", new ModifyCmd());
		cmds.put("delete", new DeleteCmd());
		cmds.put("search", new SearchCmd());
		cmds.put("goSearch", new GoSearchCmd());
		cmds.put("register", new AddCmd());
	}
	
	public static void doAction(HttpServletRequest request, String cmd) {
		cmds.get(cmd).action(request);
	}
}
