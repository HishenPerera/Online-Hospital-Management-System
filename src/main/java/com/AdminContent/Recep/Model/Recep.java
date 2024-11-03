package com.AdminContent.Recep.Model;

public class Recep {
	private int id;
    private String name;
    private String phone;
    private String username;
    private String password;
    
	public Recep(int id, String name, String phone, String username, String password) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.username = username;
		this.password = password;
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
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
    
    
}
