package com.Patient.Model;

public class Patient {
	
	private int id;
	private String name;
	private String age;
	private String address;
	private String phone;
	private String allergies;
	private String username;
	private String password;
	
	
	public Patient(int id, String name, String age, String address, String phone, String allergies, String username,
			String password) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.address = address;
		this.phone = phone;
		this.allergies = allergies;
		this.username = username;
		this.password = password;
	}


	public Patient() {
		
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


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAllergies() {
		return allergies;
	}


	public void setAllergies(String allergies) {
		this.allergies = allergies;
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
