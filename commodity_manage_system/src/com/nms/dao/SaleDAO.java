package com.nms.dao;

import java.util.List;

import com.nms.pojo.Sale;

public interface SaleDAO {
	public boolean add(Sale sale);
	public boolean delete(Sale sale);
	public boolean update(Sale sale);
	public List<Sale> list();
}
