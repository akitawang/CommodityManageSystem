package com.nms.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.nms.dao.Se_catDAO;
import com.nms.pojo.Se_cat;
@Repository("se_catDAO")
public class Se_catDAOImpl  extends HibernateTemplate implements Se_catDAO {
	@Resource(name="sf")
	public void setSessionFactory(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    };
    
	@Override
	public boolean add(Se_cat se_cat) {
		try {
			save(se_cat);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(Se_cat se_cat) {
		try {
			super.delete(se_cat);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(Se_cat se_cat) {
		try {
			super.update(se_cat);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Se_cat> list() {
		return find("from Se_cat");
	}

}
