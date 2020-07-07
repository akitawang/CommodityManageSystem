package com.nms.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "se_cat")
public class Se_cat {
	private int id;
	private String se_class_name;
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
	@Column(name = "se_class_name") 
	public String getSe_class_name() {
		return se_class_name;
	}
	public void setSe_class_name(String se_class_name) {
		this.se_class_name = se_class_name;
	}
	@Column(name = "remarks") 
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
}
