package kr.ac.green.dto;

public class JoinInfo {
	private int id;
	private String name;
	private String password;
	private String nickName;
	private String tel;
	
	public JoinInfo() {
		
	}
	
	public JoinInfo(int id, String name, String password, String nickName, String tel) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.nickName = nickName;
		this.tel = tel;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
