package com.nms.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.nms.dao.LogDAO;
import com.nms.pojo.Log;

@Repository("logDAO")
public class LogDAOImpl extends HibernateTemplate implements LogDAO {
	@Resource(name="sf")
	public void setSessionFactory(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    };
    
	@Override
	public boolean add(Log log) {
		try {
			save(log);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(Log log) {
		try {
			super.delete(log);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(Log log) {
		try {
			super.update(log);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Log> list() {
		return find("from Log");
	}

}
