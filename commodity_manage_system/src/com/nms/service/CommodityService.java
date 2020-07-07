package com.nms.service;

import java.util.List;
 
import com.nms.pojo.Commodity;

public interface CommodityService {
	public boolean add(Commodity commodity);
	public boolean delete(Commodity commodity);
	public boolean update(Commodity commodity);
	public List<Commodity> list();
	public List<Commodity> list_alert(int number);
}
