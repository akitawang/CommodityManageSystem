package com.nms.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "admin")
public class Admin {
	private int id;
	private String useraccount;
	private String userpass;
	private String userphone;
	private String username;
	private String usertype;
	private String useremail;
	private Timestamp outdate;
	private String signature;
	private String per_certification;
	private Set<Article> article = new HashSet<Article>();  
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id") 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name = "useraccount")
	public String getUseraccount() {
		return useraccount;
	}
	public void setUseraccount(String useraccount) {
		this.useraccount = useraccount;
	}
	@Column(name = "userpass")
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	@Column(name = "userphone")
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	@Column(name = "username")
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Column(name = "usertype")
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	@Column(name = "useremail")
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	@Column(name = "outdate")
	public Timestamp getOutdate() {
		return outdate;
	}
	public void setOutdate(Timestamp ts) {
		this.outdate = ts;
	}
	@Column(name = "signature")
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	@Column(name = "per_certification")
	public String getPer_certification() {
		return per_certification;
	}
	public void setPer_certification(String per_certification) {
		this.per_certification = per_certification;
	}
	/*
	@OneToMany(mappedBy="admin",cascade=(CascadeType.ALL))//以“多”一方为主导管理，级联用ALL  
	public Set<Article> getArticle()
	{
		return article;
	}
	public void setArticle(Set<Article> article) {
		this.article = article;
	} */
	
}
