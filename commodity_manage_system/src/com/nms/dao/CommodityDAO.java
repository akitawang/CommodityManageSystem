package com.nms.dao;

import java.util.List;

import com.nms.pojo.Commodity;

public interface CommodityDAO {
	public boolean add(Commodity commodity);
	public boolean delete(Commodity commodity);
	public boolean update(Commodity commodity);
	public List<Commodity> list();
	public List<Commodity> list_alert(int number);
}
