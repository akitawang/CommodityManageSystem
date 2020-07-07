package com.nms.dao;

import java.util.List;


import com.nms.pojo.Supplier;

public interface SupplierDAO {
	public boolean add(Supplier supplier);
	public boolean delete(Supplier supplier);
	public boolean update(Supplier supplier);
	public List<Supplier> list();
}
