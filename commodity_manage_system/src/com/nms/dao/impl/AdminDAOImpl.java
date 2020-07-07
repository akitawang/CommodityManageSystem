package com.nms.dao.impl;

 
import java.util.List;

import javax.annotation.Resource;


import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.nms.dao.AdminDAO;
import com.nms.pojo.Admin;

@Repository("adminDAO")
public class AdminDAOImpl extends HibernateTemplate implements AdminDAO {
	 
	@Resource(name="sf")
	public void setSessionFactory(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    };
    
	@Override
	public List<Admin> list() {
		return find("from Admin");
	}

	@Override
	public boolean add(Admin admin) {
		try {
			save(admin);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Admin get(int id) {
		return (Admin)get(Admin.class,id);
	}

	@Override
	public boolean update(Admin admin) {
		try {
			super.update(admin);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
		
	}

	@Override
	public boolean delete(Admin admin) {
		try {
			super.delete(admin);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
		
	}

	@Override
	public Admin getname(Admin admin1) {
		List<Admin> adminlist = list();
		Admin real = new Admin();
		real.setId(-1);
		for(int i=0;i<adminlist.size();i++) {
			if(adminlist.get(i).getUseraccount().equals(admin1.getUseraccount()) && 
					adminlist.get(i).getUserpass().equals(admin1.getUserpass())) {
				real = adminlist.get(i);
			}
		}
        if(real.getId() != -1) {
        	 return real;
        }
       return null;
	}

	@Override
	public Admin validate_email(Admin admin) {
		List<Admin> adminlist = list();
		Admin real = new Admin();
		real.setId(-1);
		for(int i=0;i<adminlist.size();i++) {
			if(adminlist.get(i).getUseraccount().equals(admin.getUseraccount()) && 
					adminlist.get(i).getUseremail().equals(admin.getUseremail())) {
				real = adminlist.get(i);
			}
		}
        if(real.getId() != -1) { 
        	 return real;
        }
       return null;
	}

	 

}
