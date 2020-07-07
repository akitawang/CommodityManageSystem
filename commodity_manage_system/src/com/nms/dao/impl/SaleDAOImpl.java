package com.nms.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.nms.dao.SaleDAO;
import com.nms.pojo.Sale;
@Repository("saleDAO")
public class SaleDAOImpl extends HibernateTemplate implements SaleDAO {
	@Resource(name="sf")
	public void setSessionFactory(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    };
    
	@Override
	public boolean add(Sale sale) {
		try {
			save(sale);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(Sale sale) {
		try {
			super.delete(sale);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(Sale sale) {
		try {
			super.update(sale);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Sale> list() {
		return find("from Sale");
	}

}
