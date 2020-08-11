package org.docs.cmds;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CMDFactory {
	private static HashMap<String, ICMD> map;
	
	public static void init() {
		map = new HashMap<String, ICMD>();
		map.put("getAll", new GetAllCMD());
		map.put("write", new WriteCMD());
		map.put("delete", new DeleteCMD());
	}
	
	public static void doAction(String cmd, HttpServletRequest request, HttpServletResponse response) {
		map.get(cmd).action(request, response);
	}
}
