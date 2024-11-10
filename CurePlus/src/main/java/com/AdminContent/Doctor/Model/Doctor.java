// IT23163218 M.H.S.Perera 

package com.AdminContent.Doctor.Model;

public class Doctor {
	
	private int docId;
    private String name;
    private String speciality;
    private String phone;
    private String username;
    private String password;
    
	public Doctor(int docId, String name, String speciality, String phone, String username, String password) {
		this.docId = docId;
		this.name = name;
		this.speciality = speciality;
		this.phone = phone;
		this.username = username;
		this.password = password;
	}

	public int getDocId() {
		return docId;
	}

	public void setDocId(int docId) {
		this.docId = docId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
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
