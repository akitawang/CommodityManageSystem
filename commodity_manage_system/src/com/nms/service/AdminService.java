package com.nms.service;


import java.util.List;

import com.nms.pojo.Admin;

public interface AdminService {
	public List<Admin> list();
	public boolean add(Admin admin);
	public Admin get(int id);
	public boolean update(Admin admin);
	public boolean delete(Admin admin);
	public Admin login(Admin admin);
	public Admin validate_pass(Admin admin);
	public int isChangePass(int id,String validkey);
}
