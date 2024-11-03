package com.Medicine.Model;

public class Medicine {
	private int id;
	private String name;
	private String description;
	private String qty;
	private String price;
	
	public Medicine(int id, String name, String description, String qty, String price) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.qty = qty;
		this.price = price;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	
	
}
