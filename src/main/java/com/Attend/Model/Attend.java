package com.Attend.Model;

public class Attend {
	private int id;
	private String attendDetails;
	private String date;
	private String morning;
	private String night;
	
	public Attend(int id, String attendDetails, String date, String morning, String night) {
		super();
		this.id = id;
		this.attendDetails = attendDetails;
		this.date = date;
		this.morning = morning;
		this.night = night;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAttendDetails() {
		return attendDetails;
	}

	public void setAttendDetails(String attendDetails) {
		this.attendDetails = attendDetails;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getMorning() {
		return morning;
	}

	public void setMorning(String morning) {
		this.morning = morning;
	}

	public String getNight() {
		return night;
	}

	public void setNight(String night) {
		this.night = night;
	}
	
	
}
