package com.nms.service;

import java.util.List;

import com.nms.pojo.Log;

public interface LogService {
	public boolean add(Log log);
	public boolean delete(Log log);
	public boolean update(Log log);
	public List<Log> list();
}
