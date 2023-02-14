package com.bean;
    public class RegisterBean {
	private int id;
	private String user_name;
	private String user_email;
	private String mobile;
	private String user_password;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getUserName(){
		return user_name;
	}
	
	public void setUserName(String user_name) {
		this.user_name = user_name;
	}
	
	public String getUserEmail() {
		return user_email;
	}
	
	public void setUserEmail(String user_email) {
		this.user_email = user_email;
	}
	
	public String getMobile() {
		return mobile;
	}
	
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getPassword() {
		return user_password;
	}
	
	public void setPassword(String user_password) {
		this.user_password = user_password;
		
	}
	
	
}

