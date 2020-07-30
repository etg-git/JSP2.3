package kr.ac.green;

import java.util.Vector;

import javax.servlet.ServletContext;

public class MemberManager {
	public static Member getBlankMember() {
		Member member = new Member();
		member.setU_id("");
		member.setU_name("");
		member.setU_nick("");
		member.setU_pw("");
		
		return member;
	}
	
	public static Vector<Member> getMemberList(ServletContext application) {
		Vector<Member> memberList = (Vector<Member>) application.getAttribute("memberList");
		
		if(memberList == null) {
			memberList = new Vector<Member>();
			application.setAttribute("memberList", memberList);
		}
		return memberList;
	}
	
	public static Member findMember(ServletContext application, String u_id) {
		Vector<Member> memberList = getMemberList(application);
		Member member = null;
		int idx = memberList.lastIndexOf(new Member(u_id));
		if(idx != -1) {
			member = memberList.get(idx);
		}
		return member;
	}
	public static boolean addMember(ServletContext application, Member member) {
		Vector<Member> memberList = getMemberList(application);
		boolean flag = false;
		if(findMember(application, member.getU_id()) == null) {
			memberList.add(member);
			flag = true;
		}
		return flag;
	}
	public static boolean deleteMember(ServletContext application, String u_id) {
		Vector<Member> memberList = getMemberList(application);
		return memberList.remove(findMember(application, u_id));
	}
	
	public static boolean updateMember(ServletContext application, Member member) {
		Vector<Member> memberList = getMemberList(application);
		int idx = memberList.indexOf(member);
		boolean flag = false;
		if(idx != -1) {
			memberList.set(idx, member);
			flag = true;
		}
		return flag;
	}
}
