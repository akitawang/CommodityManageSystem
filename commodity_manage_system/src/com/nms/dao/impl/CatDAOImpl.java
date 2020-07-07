package com.nms.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.nms.dao.CatDAO;
import com.nms.pojo.Cat;

@Repository("catDAO")
public class CatDAOImpl extends HibernateTemplate implements CatDAO {
	@Resource(name="sf")
	public void setSessionFactory(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    };
    
	@Override
	public boolean add(Cat cat) {
		try {
			save(cat);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(Cat cat) {
		try {
			super.delete(cat);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(Cat cat) {
		try {
			super.update(cat);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Cat> list() {
		return find("from Cat");
	}

}
