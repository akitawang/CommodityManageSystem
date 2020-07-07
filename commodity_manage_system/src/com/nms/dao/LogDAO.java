package com.nms.dao;

import java.util.List;

import com.nms.pojo.Log;



public interface LogDAO {
	public boolean add(Log log);
	public boolean delete(Log log);
	public boolean update(Log log);
	public List<Log> list();
}
