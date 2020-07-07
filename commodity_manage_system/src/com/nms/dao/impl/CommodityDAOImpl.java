package com.nms.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.nms.dao.CommodityDAO;
import com.nms.pojo.Commodity;

@Repository("commodityDAO")
public class CommodityDAOImpl extends HibernateTemplate implements CommodityDAO {
	
	@Resource(name="sf")
	public void setSessionFactory(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    };
    
	@Override
	public boolean add(Commodity commodity) {
		try {
			save(commodity);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(Commodity commodity) {
		try {
			super.delete(commodity);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(Commodity commodity) {
		try {
			super.update(commodity);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Commodity> list() {
		return find("from Commodity");
	}


	@Override
	public List<Commodity> list_alert(int number) {
		return find("from Commodity p where p.number<"+number);
	}

}
