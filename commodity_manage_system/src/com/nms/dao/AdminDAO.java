package com.nms.dao;

 

import java.util.List;

import com.nms.pojo.Admin;

 

public interface AdminDAO {
	public List<Admin> list();
	public boolean add(Admin admin);
	public Admin get(int id);
	public Admin getname(Admin admin);
	public boolean update(Admin admin);
	public boolean delete(Admin admin);	
	public Admin validate_email(Admin admin);
	 
}
