package com.Login.Model;

public class Login {
	
	private String lUsername;
	private String lPassword;
	
	
	public Login(String lUsername, String lPassword) {
		super();
		this.lUsername = lUsername;
		this.lPassword = lPassword;
	}


	public String getlUsername() {
		return lUsername;
	}


	public void setlUsername(String lUsername) {
		this.lUsername = lUsername;
	}


	public String getlPassword() {
		return lPassword;
	}


	public void setlPassword(String lPassword) {
		this.lPassword = lPassword;
	}
	
	
}
