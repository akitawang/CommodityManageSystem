package com.nms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nms.dao.SaleDAO;
import com.nms.pojo.Sale;
import com.nms.service.SaleService;
@Service
public class SaleServiceImpl implements SaleService {
	@Autowired
	SaleDAO saledao;
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackForClassName="Exception")
	
	public SaleDAO getSaledao() {
		return saledao;
	}

	public void setSaledao(SaleDAO saledao) {
		this.saledao = saledao;
	}
	
	
	@Override
	public boolean add(Sale sale) {
		return saledao.add(sale);
	}

	

	@Override
	public boolean delete(Sale sale) {
		return saledao.delete(sale);
	}

	@Override
	public boolean update(Sale sale) {
		return saledao.update(sale);
	}

	@Override
	public List<Sale> list() {
		List<Sale> sales= saledao.list();
		return sales;
	}

}
