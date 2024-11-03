package com.Appointment.Model;

public class Appointment {
	
	private int appointmentId;
	private String patientName;
	private String patientAge;
	private String patientPhone;
	private String patientAllergies;
	private String selectDoctor;
	private String date;
	private String time;
	
	public Appointment(int appointmentId, String patientName, String patientAge, String patientPhone ,String patientAllergies,
			String selectDoctor, String date, String time) {
		super();
		this.appointmentId = appointmentId;
		this.patientName = patientName;
		this.patientAge = patientAge;
		this.patientPhone = patientPhone;
		this.patientAllergies = patientAllergies;
		this.selectDoctor = selectDoctor;
		this.date = date;
		this.time = time;
	}

	public int getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getPatientAge() {
		return patientAge;
	}

	public void setPatientAge(String patientAge) {
		this.patientAge = patientAge;
	}
	

	public String getPatientPhone() {
		return patientPhone;
	}

	public void setPatientPhone(String patientPhone) {
		this.patientPhone = patientPhone;
	}

	public String getPatientAllergies() {
		return patientAllergies;
	}

	public void setPatientAllergies(String patientAllergies) {
		this.patientAllergies = patientAllergies;
	}

	public String getSelectDoctor() {
		return selectDoctor;
	}

	public void setSelectDoctor(String selectDoctor) {
		this.selectDoctor = selectDoctor;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	
	
}
