package com.nms.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "commodity")
public class Commodity {
	private int id;
	private String cname;
	private int number;
	private String cat;
	private String se_cat;
	private String model;
	private String born_date;
	private String invalid_date;
	private String standards;
	private String province;
	private String city;
	private String supplier;
	private double weight;
	private String remarks;
	private String photo;
	private double in_price;
	private double out_price;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id") 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name = "cname")
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	@Column(name = "number")
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	@Column(name = "cat")
	public String getCat() {
		return cat;
	}
	public void setCat(String cat) {
		this.cat = cat;
	}
	@Column(name = "se_cat")
	public String getSe_cat() {
		return se_cat;
	}
	public void setSe_cat(String se_cat) {
		this.se_cat = se_cat;
	}
	@Column(name = "model")
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	@Column(name = "born_date")
	public String getBorn_date() {
		return born_date;
	}
	public void setBorn_date(String born_date) {
		this.born_date = born_date;
	}
	@Column(name = "invalid_date")
	public String getInvalid_date() {
		return invalid_date;
	}
	public void setInvalid_date(String invalid_date) {
		this.invalid_date = invalid_date;
	}
	@Column(name = "standards")
	public String getStandards() {
		return standards;
	}
	public void setStandards(String standards) {
		this.standards = standards;
	}
	@Column(name = "province")
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	@Column(name = "city")
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	@Column(name = "supplier")
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	@Column(name = "weight")
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	@Column(name = "remarks")
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	@Column(name = "photo")
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Column(name = "in_price")
	public double getIn_price() {
		return in_price;
	}
	public void setIn_price(double in_price) {
		this.in_price = in_price;
	}
	@Column(name = "out_price")
	public double getOut_price() {
		return out_price;
	}
	public void setOut_price(double out_price) {
		this.out_price = out_price;
	}
	
	
	

}
