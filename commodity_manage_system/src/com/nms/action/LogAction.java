package com.nms.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.nms.pojo.Log;
import com.nms.service.LogService;

@Namespace("/")
@ParentPackage("struts-default")
@Results({@Result(name = "log_manage",location = "/nms_back/log_manage.jsp"),
})
public class LogAction {
	@Autowired
	LogService logservice;
	
	Log log;
	List<Log> logs;
	
	@Action("listLog")
	public String listLog() { 
		logs = logservice.list();
		return "log_manage";
		
	}
	
	@Action("recLog")
	public void recLog() throws IOException { 
		boolean judge = logservice.update(log);
		int judgen = -1;
		if(judge == true) {
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
		
	}
	
	@Action("delLog")
	public void Log() throws IOException {
		boolean judge = logservice.delete(log);
		int judgen = -1;
		if(judge == true) {
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
		
	}
	
	public LogService getLogservice() {
		return logservice;
	}
	public void setLogservice(LogService logservice) {
		this.logservice = logservice;
	}
	public Log getLog() {
		return log;
	}
	public void setLog(Log log) {
		this.log = log;
	}
	public List<Log> getLogs() {
		return logs;
	}
	public void setLogs(List<Log> logs) {
		this.logs = logs;
	}
	

}
