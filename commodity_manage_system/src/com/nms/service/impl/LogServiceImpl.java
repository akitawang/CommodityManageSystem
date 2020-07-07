package com.nms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nms.dao.LogDAO;
import com.nms.pojo.Log;
import com.nms.service.LogService;
@Service
public class LogServiceImpl implements LogService {

	@Autowired
	LogDAO logdao;
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackForClassName="Exception")
	
	public LogDAO getLogdao() {
		return logdao;
	}

	public void setLogdao(LogDAO logdao) {
		this.logdao = logdao;
	}
	
	@Override
	public boolean add(Log log) {
		return logdao.add(log);
	}

	@Override
	public boolean delete(Log log) {
		return logdao.delete(log);
	}

	@Override
	public boolean update(Log log) {
		return logdao.update(log);
	}

	@Override
	public List<Log> list() {
		List<Log> logs= logdao.list();
		return logs;
	}

}
