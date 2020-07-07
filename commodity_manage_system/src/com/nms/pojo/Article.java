package com.nms.pojo;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "article")
public class Article {
	private int id;
	private String title;
	private String cat;
	private String se_cat;
	private String tag;
	private String type;
	private String favorites;
	private String like;
	private int watch;
	private String art_abstract;
	private Admin admin;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id") 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name = "title") 
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	@Column(name = "tag") 
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	@Column(name = "type") 
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Column(name = "favorites")
	public String getFavorites() {
		return favorites;
	}
	public void setFavorites(String favorites) {
		this.favorites = favorites;
	}
	@Column(name = "like")
	public String getLike() {
		return like;
	}
	public void setLike(String like) {
		this.like = like;
	}
	@Column(name = "watch")
	public int getWatch() {
		return watch;
	}
	public void setWatch(int watch) {
		this.watch = watch;
	}
	 
	@Column(name = "art_abstract") 
	public String getArt_abstract() {
		return art_abstract;
	}
	public void setArt_abstract(String art_abstract) {
		this.art_abstract = art_abstract;
	}
	
	/*
	@ManyToOne(fetch=FetchType.LAZY,cascade=(CascadeType.ALL))//解决1+N,级联用ALL  
    @JoinColumn(name="admin_id")//指定外键名称，不指定的默认值是group_Id  
	public Admin getAdmin()
	{
		return admin;
	} 
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}*/
	/*
	@OneToMany(mappedBy="article_id",cascade=(CascadeType.ALL))//以“多”一方为主导管理，级联用ALL  
	public List<Content> getContent()
	{
		return content;
	} */
	
}
