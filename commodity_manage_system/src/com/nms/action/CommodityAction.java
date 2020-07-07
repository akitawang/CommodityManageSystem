package com.nms.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
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

import com.nms.pojo.Admin;
import com.nms.pojo.Commodity;
import com.nms.pojo.Log;
import com.nms.service.CommodityService;
import com.nms.service.LogService;


@Namespace("/")
@ParentPackage("struts-default")
@Results({@Result(name = "commodity_list_manage",location = "/nms_back/commodity_list_manage.jsp"),
		  @Result(name = "commodity_alert_list",location = "/nms_back/inventory_alert_list.jsp"),
		  @Result(name = "sale_list_manage",location = "/nms_back/sale_list_manage.jsp")
})
public class CommodityAction {
	@Autowired
	CommodityService commodityservice;
	@Autowired
	LogService logservice;
	
	Commodity commodity;
	
	List<Commodity> commoditys;
	
	
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
	
	
	@Action("addCommodity")
	public void addCommodity() throws IOException { 
		boolean judge = commodityservice.add(commodity);
		int judgen = -1;
		if(judge == true) {
			setlog("添加了商品:"+commodity.getCname());
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
	}
	
	@Action("listCommodity")
	public String listCommodity() { 
		commoditys = commodityservice.list();
		return "commodity_list_manage";
		
	}
	
	@Action("listSale")
	public String listSale() { 
		commoditys = commodityservice.list();
		return "sale_list_manage";
		
	}
	
	@Action("listCommodity_alert")
	public String listCommodity_alert() { 
		HttpServletRequest request= ServletActionContext.getRequest();
		int number = 0;
		String num = request.getParameter("number");
		if(num == null) {
			number = 5;
		}else {
			number = Integer.parseInt(num);
		}
		
		System.out.print(number);
		if(number >= 0) {
			commoditys = commodityservice.list_alert(number);
		}
		else {
			commoditys = commodityservice.list_alert(5);
		}
		
		return "commodity_alert_list";
		
	}

	
	@Action("recCommodity")
	public void recCommodity() throws IOException { 
		boolean judge = commodityservice.update(commodity);
		int judgen = -1;
		if(judge == true) {
			setlog("更新了商品:"+commodity.getCname());
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
		
	}
	
	@Action("delCommodity")
	public void delCommodity() throws IOException { 
		boolean judge = commodityservice.delete(commodity);
		int judgen = -1;
		if(judge == true) {
			setlog("删除了商品:"+commodity.getCname());
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
		
	}
	
	public CommodityService getCommodityservice() {
		return commodityservice;
	}

	public void setCommodityservice(CommodityService commodityservice) {
		this.commodityservice = commodityservice;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public List<Commodity> getCommoditys() {
		return commoditys;
	}

	public void setCommoditys(List<Commodity> commoditys) {
		this.commoditys = commoditys;
	}
	
	
	
	
	
}
