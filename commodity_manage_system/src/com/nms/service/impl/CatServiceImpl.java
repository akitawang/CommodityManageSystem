package com.nms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nms.dao.CatDAO;
import com.nms.pojo.Cat;
import com.nms.service.CatService;
@Service
public class CatServiceImpl implements CatService {
	@Autowired
	CatDAO catdao;
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackForClassName="Exception")
	
	public CatDAO getCatdao() {
		return catdao;
	}

	public void setCatdao(CatDAO catdao) {
		this.catdao = catdao;
	}
	
	@Override
	public boolean add(Cat cat) {
		// TODO Auto-generated method stub
		return catdao.add(cat);
	}

	@Override
	public boolean delete(Cat cat) {
		// TODO Auto-generated method stub
		return catdao.delete(cat);
	}

	@Override
	public boolean update(Cat cat) {
		return catdao.update(cat);
	}

	@Override
	public List<Cat> list() {
		List<Cat> cats= catdao.list();
		return cats;
	}

}
