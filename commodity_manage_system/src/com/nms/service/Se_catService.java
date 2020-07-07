package com.nms.service;

import java.util.List;

import com.nms.pojo.Se_cat;

public interface Se_catService {
	public boolean add(Se_cat se_cat);
	public boolean delete(Se_cat se_cat);
	public boolean update(Se_cat se_cat);
	public List<Se_cat> list();
}
