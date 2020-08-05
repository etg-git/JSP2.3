package kr.ac.green.dao;

public class Student {
	private int std_id;
	private String std_name;
	private String std_tel;
	private int std_grade;
	private int std_class;
	
	public Student() {
		
	}
	public Student(int std_id, String std_name, String std_tel, int std_grade, int std_class) {
		this.std_id = std_id;
		this.std_name = std_name;
		this.std_tel = std_tel;
		this.std_grade = std_grade;
		this.std_class = std_class;
	}
	public int getStd_id() {
		return std_id;
	}
	public void setStd_id(int std_id) {
		this.std_id = std_id;
	}
	public String getStd_name() {
		return std_name;
	}
	public void setStd_name(String std_name) {
		this.std_name = std_name;
	}
	public String getStd_tel() {
		return std_tel;
	}
	public void setStd_tel(String std_tel) {
		this.std_tel = std_tel;
	}
	public int getStd_grade() {
		return std_grade;
	}
	public void setStd_grade(int std_grade) {
		this.std_grade = std_grade;
	}
	public int getStd_class() {
		return std_class;
	}
	public void setStd_class(int std_class) {
		this.std_class = std_class;
	}
	
}
