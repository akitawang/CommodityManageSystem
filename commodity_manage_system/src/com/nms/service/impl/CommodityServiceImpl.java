package com.nms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nms.dao.CommodityDAO;
import com.nms.pojo.Commodity;
import com.nms.service.CommodityService;

@Service
public class CommodityServiceImpl implements CommodityService {

	@Autowired
	CommodityDAO commoditydao;
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackForClassName="Exception")
	
	public CommodityDAO getCommoditydao() {
		return commoditydao;
	}

	public void setCommoditydao(CommodityDAO commoditydao) {
		this.commoditydao = commoditydao;
	}
	
	
	
	@Override
	public boolean add(Commodity commodity) {
		return commoditydao.add(commodity);
	}

	
	@Override
	public boolean delete(Commodity commodity) {
		// TODO Auto-generated method stub
		return commoditydao.delete(commodity);
	}

	@Override
	public boolean update(Commodity commodity) {
		return commoditydao.update(commodity);
	}

	@Override
	public List<Commodity> list() {
		List<Commodity> commoditys= commoditydao.list();
		return commoditys;
	}
	
	@Override
	public List<Commodity> list_alert(int number) {
		List<Commodity> commoditys= commoditydao.list_alert(number);
		return commoditys;
	}

}
