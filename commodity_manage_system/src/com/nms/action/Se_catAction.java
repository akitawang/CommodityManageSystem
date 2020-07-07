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
import com.nms.pojo.Se_cat;
import com.nms.service.LogService;
import com.nms.service.Se_catService;

@Namespace("/")
@ParentPackage("struts-default")
@Results({@Result(name = "se_cat_manage",location = "/nms_back/se_cat_manage.jsp"),
		  @Result(name = "gologin",location = "/login.jsp")
})
public class Se_catAction {
	@Autowired
	Se_catService se_catservice;
	@Autowired
	LogService logservice;
	
	Se_cat se_cat;
	
	List<Se_cat> se_cats;
	
	
	
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
	

	@Action("addSe_Classification")
	public void addSe_Classification() throws IOException { 
		boolean judge = se_catservice.add(se_cat);
		int judgen = -1;
		if(judge == true) {
			setlog("添加了子分类:"+se_cat.getSe_class_name());
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
	}
	
	@Action("SelectSe_Classification")
	public void SelectSe_Classification() throws IOException { 
		List<Se_cat> list = new ArrayList<Se_cat>();
		list = se_catservice.list();
		
		ObjectMapper mapper = new ObjectMapper(); //提供java-json相互转换功能的类
		String json = mapper.writeValueAsString(list); //将list中的对象转换为Json格式的数组
		//System.out.println(json);
		//将json数据返回给客户端
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().write(json);
		
	}
	
	@Action("listSe_Classification")
	public String listSe_Classification() { 
		se_cats = se_catservice.list();
		return "se_cat_manage";
		
	}
	
	@Action("recSe_Classification")
	public void recSe_Classification() throws IOException { 
		boolean judge = se_catservice.update(se_cat);
		int judgen = -1;
		if(judge == true) {
			setlog("更新了子分类:"+se_cat.getSe_class_name());
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
		
	}
	
	@Action("delSe_Classification")
	public void delSe_Classification() throws IOException { 
		boolean judge = se_catservice.delete(se_cat);
		int judgen = -1;
		if(judge == true) {
			setlog("删除了子分类:"+se_cat.getSe_class_name());
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
		
	}
	public Se_catService getSe_catservice() {
		return se_catservice;
	}

	public void setSe_catservice(Se_catService se_catservice) {
		this.se_catservice = se_catservice;
	}

	public Se_cat getSe_cat() {
		return se_cat;
	}

	public void setSe_cat(Se_cat se_cat) {
		this.se_cat = se_cat;
	}

	public List<Se_cat> getSe_cats() {
		return se_cats;
	}

	public void setSe_cats(List<Se_cat> se_cats) {
		this.se_cats = se_cats;
	}
	
	
	
}
