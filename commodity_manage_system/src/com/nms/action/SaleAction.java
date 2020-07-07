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
import com.nms.pojo.Sale;
import com.nms.service.CommodityService;
import com.nms.service.LogService;
import com.nms.service.SaleService;

@Namespace("/")
@ParentPackage("struts-default")
@Results({@Result(name = "sale_list_manage",location = "/nms_back/sale_list.jsp"),
		  
})
public class SaleAction {

	@Autowired
	SaleService saleservice;
	@Autowired
	CommodityService commodityservice;
	@Autowired
	LogService logservice;
	
	Sale sale;
	Commodity commodity;
	List<Sale> sales;

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
	
	@Action("saleCommodity")
	public void saleCommodity() throws IOException { 
		sale.setSale_date(getdate());
		
		SimpleDateFormat sdf =new SimpleDateFormat("yyyyMMddHHmmss");  //获取当前时间
		String datetime=sdf.format(new Date());
		
		String order= "SP"+sale.getSale_number()+datetime;
		sale.setSale_order(order);
		sale.setSale_status("售出");
		boolean judge = commodityservice.update(commodity);
		boolean judge2 = saleservice.add(sale);
		
		int judgen = -1;
		if(judge == true && judge2 == true) {
			setlog("售出了商品:"+commodity.getCname()+"，数量为："+sale.getSale_number()+"件");
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
		
	}
	
	@Action("backCommodity")
	public void backCommodity() throws IOException { 
		sale.setSale_date(getdate());
		

		boolean judge2 = saleservice.update(sale);
		
		int judgen = -1;
		if(judge2 == true) {
			setlog("退回了商品:"+sale.getSale_name()+"，数量为："+sale.getSale_number()+"件");
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
		
	}
	
	@Action("listback")
	public String listback() { 
		sales = saleservice.list();
		return "sale_list_manage";
		
	}
	
	public SaleService getSaleservice() {
		return saleservice;
	}

	public void setSaleservice(SaleService saleservice) {
		this.saleservice = saleservice;
	}

	public Sale getSale() {
		return sale;
	}

	public void setSale(Sale sale) {
		this.sale = sale;
	}

	public LogService getLogservice() {
		return logservice;
	}

	public void setLogservice(LogService logservice) {
		this.logservice = logservice;
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

	public List<Sale> getSales() {
		return sales;
	}

	public void setSales(List<Sale> sales) {
		this.sales = sales;
	}

	
	
	
}
