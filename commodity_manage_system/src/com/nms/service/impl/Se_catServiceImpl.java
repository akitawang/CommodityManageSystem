package com.nms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nms.dao.Se_catDAO;
import com.nms.pojo.Se_cat;
import com.nms.service.Se_catService;
@Service
public class Se_catServiceImpl implements Se_catService {
	@Autowired
	Se_catDAO se_catdao;
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackForClassName="Exception")
	

	public Se_catDAO getSe_catdao() {
		return se_catdao;
	}


	public void setSe_catdao(Se_catDAO se_catdao) {
		this.se_catdao = se_catdao;
	}

	
	@Override
	public boolean add(Se_cat se_cat) {
		// TODO Auto-generated method stub
				return se_catdao.add(se_cat);
	}


	@Override
	public boolean delete(Se_cat se_cat) {
		// TODO Auto-generated method stub
		return se_catdao.delete(se_cat);
	}

	@Override
	public boolean update(Se_cat se_cat) {
		// TODO Auto-generated method stub
		return se_catdao.update(se_cat);
	}

	@Override
	public List<Se_cat> list() {
		List<Se_cat> se_cats= se_catdao.list();
		return se_cats;
	}

}
