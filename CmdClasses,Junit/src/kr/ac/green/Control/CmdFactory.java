package kr.ac.green.Control;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.cmd.ICmd;

public class CmdFactory {
	private static Hashtable<String, ICmd> cmds;
	
	public static void init() {
		cmds = new Hashtable<String, ICmd>();
		cmds.put("getAll", new GetAllCmd());
		cmds.put("goInsert", new NullCmd());
		cmds.put("insertCar", new InsertCarCmd());
		cmds.put("clear", new ClearCmd());
	}
	
	public static void doAction(HttpServletRequest request, String cmd) {
		cmds.get(cmd).action(request);
	}
}
