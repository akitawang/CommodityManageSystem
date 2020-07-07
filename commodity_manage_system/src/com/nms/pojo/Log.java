package com.nms.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "log")
public class Log {
	
	private int id;
	private String op_date;
	private String content;
	private String operator_account;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id") 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "op_date") 
	public String getOp_date() {
		return op_date;
	}
	public void setOp_date(String op_date) {
		this.op_date = op_date;
	}
	@Column(name = "content") 
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Column(name = "operator_account") 
	public String getOperator_account() {
		return operator_account;
	}
	public void setOperator_account(String operator_account) {
		this.operator_account = operator_account;
	}
	
	

}
