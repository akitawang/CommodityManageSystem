package com.nms.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nms.pojo.Admin;
import com.nms.pojo.Log;
import com.nms.pojo.Supplier;
import com.nms.service.LogService;
import com.nms.service.SupplierService;


@Namespace("/")
@ParentPackage("struts-default")
@Results({@Result(name = "Supplier_list_manage",location = "/nms_back/supplier_list_manage.jsp"),
		  @Result(name = "gologin",location = "/login.jsp")
})
public class SupplierAction {
	@Autowired
	SupplierService supplierservice;
	@Autowired
	LogService logservice;
	Supplier supplier;
	
	List<Supplier> suppliers;

	public String getdate() {
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  //获取当前时间
		String datetime=sdf.format(new Date());
		return datetime;
	}
	
	public void setlog(String operate) {
		HttpServletRequest request= ServletActionContext.getRequest();
		//获取session  
		HttpSession   session   =   request.getSession();    
		// 获取session中所有的键值  
		Enumeration<String> attrs = session.getAttributeNames(); 
		Admin admins = new Admin();
		 
		// 遍历attrs中的
		while(attrs.hasMoreElements()){
			// 获取session键值  
			 String name = attrs.nextElement().toString();
			 // 根据键值取session中的值  
			 Object vakue = session.getAttribute(name);
			 admins = (Admin) vakue; 
		 }
		Log log = new Log();
		log.setOperator_account(admins.getUseraccount());
		log.setContent(operate);
		log.setOp_date(getdate());
		logservice.add(log);

	}
	
	@Action("addSupplier")
	public void addSupplier() throws IOException { 
		boolean judge = supplierservice.add(supplier);
		int judgen = -1;
		if(judge == true) {
			setlog("添加了供应商:"+supplier.getSname());
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
	}
	
	@Action("SelectSupplier")
	public void SelectSupplier() throws IOException { 
		List<Supplier> list = new ArrayList<Supplier>();
		list = supplierservice.list();
		
		ObjectMapper mapper = new ObjectMapper(); //提供java-json相互转换功能的类
		String json = mapper.writeValueAsString(list); //将list中的对象转换为Json格式的数组
		//System.out.println(json);
		//将json数据返回给客户端
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().write(json);
		
	}
	
	@Action("listSupplier")
	public String listSupplier() { 
		suppliers = supplierservice.list();
		return "Supplier_list_manage";
		
	}

	@Action("recSupplier")
	public void recSupplier() throws IOException { 
		boolean judge = supplierservice.update(supplier);
		int judgen = -1;
		if(judge == true) {
			setlog("更新了供应商:"+supplier.getSname());
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
		
	}
	
	@Action("delSupplier")
	public void delSupplier() throws IOException { 
		boolean judge = supplierservice.delete(supplier);
		int judgen = -1;
		if(judge == true) {
			setlog("删除了供应商:"+supplier.getSname());
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
		
	}
	
	public SupplierService getSupplierservice() {
		return supplierservice;
	}

	public void setSupplierservice(SupplierService supplierservice) {
		this.supplierservice = supplierservice;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public List<Supplier> getSuppliers() {
		return suppliers;
	}

	public void setSuppliers(List<Supplier> suppliers) {
		this.suppliers = suppliers;
	}
	
	
	
	

}
