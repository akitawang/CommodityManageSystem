package com.nms.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.nms.dao.SupplierDAO;
import com.nms.pojo.Supplier;

@Repository("supplierDAO")
public class SupplierDAOImpl extends HibernateTemplate implements SupplierDAO {
	
	@Resource(name="sf")
	public void setSessionFactory(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    };
    
	@Override
	public boolean add(Supplier supplier) {
		try {
			save(supplier);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(Supplier supplier) {
		try {
			super.delete(supplier);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(Supplier supplier) {
		try {
			super.update(supplier);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Supplier> list() {
		return find("from Supplier");
	}

}
