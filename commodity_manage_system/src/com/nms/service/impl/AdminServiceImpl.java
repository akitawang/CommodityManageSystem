package com.nms.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nms.dao.AdminDAO;
import com.nms.pojo.Admin;
import com.nms.pojo.Supplier;
import com.nms.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDAO admindao;
	
	 @Transactional(propagation=Propagation.REQUIRED,rollbackForClassName="Exception")
	
	public AdminDAO getAdmindao() {
		return admindao;
	}

	public void setAdmindao(AdminDAO admindao) {
		this.admindao = admindao;
	}

	@Override
	public List<Admin> list() {
		List<Admin> admins= admindao.list();
		return admins;
	}

	@Override
	public boolean add(Admin admin) {
		return admindao.add(admin);

	}

	@Override
	public Admin get(int id) {
		return admindao.get(id);
	}

	@Override
	public boolean update(Admin admin) {
		return admindao.update(admin);
	}

	@Override
	public boolean delete(Admin admin) {
		return admindao.delete(admin);
	}

	@Override
	public Admin login(Admin admin) { 
		Admin account = admindao.getname(admin);
		return account;
	}

	@Override
	public Admin validate_pass(Admin admin) {
		Admin account = admindao.validate_email(admin);
		return account;
	}

	@Override
	public int isChangePass(int id, String validkey) {
		int judge = -1;
		Admin result = admindao.get(id);
		if(result == null) {
			judge = 1;
			return judge;
		}
		else if(!validkey.equals(result.getSignature())){
			judge = 2;
			return judge;
		}
		else {
			long current = System.currentTimeMillis();
			long time = result.getOutdate().getTime();
			if(current> time){
				judge = 3;
				return judge;
			}
			else{
				judge = 4;
				return judge;
			}
		}
		
	}

	

}
