package com.nms.dao;

import java.util.List;

import com.nms.pojo.Se_cat;

public interface Se_catDAO {
	public boolean add(Se_cat se_cat);
	public boolean delete(Se_cat se_cat);
	public boolean update(Se_cat se_cat);
	public List<Se_cat> list();
}
