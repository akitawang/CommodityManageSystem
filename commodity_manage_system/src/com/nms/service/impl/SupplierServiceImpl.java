package com.nms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nms.dao.SupplierDAO;
import com.nms.pojo.Supplier;
import com.nms.service.SupplierService;
@Service
public class SupplierServiceImpl implements SupplierService {
	@Autowired
	SupplierDAO supplierdao;
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackForClassName="Exception")
	
	public SupplierDAO getSupplierdao() {
		return supplierdao;
	}

	public void setSupplierdao(SupplierDAO supplierdao) {
		this.supplierdao = supplierdao;
	}
	
	
	@Override
	public boolean add(Supplier supplier) {
		return supplierdao.add(supplier);
	}

	@Override
	public boolean delete(Supplier supplier) {
		// TODO Auto-generated method stub
		return supplierdao.delete(supplier);
	}

	@Override
	public boolean update(Supplier supplier) {
		// TODO Auto-generated method stub
		return supplierdao.update(supplier);
	}

	@Override
	public List<Supplier> list() {
		List<Supplier> suppliers= supplierdao.list();
		return suppliers;
	}

}
