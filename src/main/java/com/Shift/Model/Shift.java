package com.Shift.Model;

public class Shift {
	private int id;
	private String details;
	private String date;
	private String shift;
	
	public Shift(int id, String details, String date, String shift) {
		super();
		this.id = id;
		this.details = details;
		this.date = date;
		this.shift = shift;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getShift() {
		return shift;
	}

	public void setShift(String shift) {
		this.shift = shift;
	}
	
	
}
