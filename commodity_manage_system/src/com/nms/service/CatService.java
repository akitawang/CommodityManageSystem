package com.nms.service;

import java.util.List;

import com.nms.pojo.Cat;

public interface CatService {
	public boolean add(Cat cat);
	public boolean delete(Cat cat);
	public boolean update(Cat cat);
	public List<Cat> list();
}
