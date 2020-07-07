package com.nms.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sale")
public class Sale {
	private int id;
	private int commodity_id;
	private double sale_price;
	private int sale_number;
	private String sale_date;
	private String sale_name;
	private String sale_order;
	private String sale_status;
	private String remarks;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id") 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name = "commodity_id") 
	public int getCommodity_id() {
		return commodity_id;
	}
	public void setCommodity_id(int commodity_id) {
		this.commodity_id = commodity_id;
	}
	@Column(name = "sale_price") 
	public double getSale_price() {
		return sale_price;
	}
	public void setSale_price(double sale_price) {
		this.sale_price = sale_price;
	}
	@Column(name = "sale_number") 
	public int getSale_number() {
		return sale_number;
	}
	public void setSale_number(int sale_number) {
		this.sale_number = sale_number;
	}
	@Column(name = "sale_date") 
	public String getSale_date() {
		return sale_date;
	}
	public void setSale_date(String sale_date) {
		this.sale_date = sale_date;
	}
	@Column(name = "sale_name") 
	public String getSale_name() {
		return sale_name;
	}
	public void setSale_name(String sale_name) {
		this.sale_name = sale_name;
	}
	@Column(name = "sale_order") 
	public String getSale_order() {
		return sale_order;
	}
	public void setSale_order(String sale_order) {
		this.sale_order = sale_order;
	}
	public String getSale_status() {
		return sale_status;
	}
	public void setSale_status(String sale_status) {
		this.sale_status = sale_status;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	

}
