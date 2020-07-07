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
import com.nms.pojo.Cat;
import com.nms.pojo.Log;
import com.nms.service.CatService;
import com.nms.service.LogService;

@Namespace("/")
@ParentPackage("struts-default")
@Results({@Result(name = "cat_manage",location = "/nms_back/cat_manage.jsp"),
		  @Result(name = "gologin",location = "/login.jsp")
})
public class CatAction {
	@Autowired
	CatService catservice;
	@Autowired
	LogService logservice;
	
	Cat cat;
	
	List<Cat> cats;
	
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

	@Action("addClassification")
	public void addClassification() throws IOException { 
		
		boolean judge = catservice.add(cat);
		int judgen = -1;
		if(judge == true) {
			setlog("添加了分类:"+cat.getClass_name());
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
		

	}
	
	@Action("SelectClassification")
	public void SelectClassification() throws IOException { 
		List<Cat> list = new ArrayList<Cat>();
		list = catservice.list();
		
		ObjectMapper mapper = new ObjectMapper(); //提供java-json相互转换功能的类
		String json = mapper.writeValueAsString(list); //将list中的对象转换为Json格式的数组
		//System.out.println(json);
		//将json数据返回给客户端
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().write(json);
		
	}
	
	@Action("listClassification")
	public String listClassification() { 
		cats = catservice.list();
		return "cat_manage";
		
	}
	
	@Action("recClassification")
	public void recClassification() throws IOException { 
		boolean judge = catservice.update(cat);
		int judgen = -1;
		if(judge == true) {
			setlog("更新了分类:"+cat.getClass_name());
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
		
	}
	
	@Action("delClassification")
	public void delClassification() throws IOException {
		boolean judge = catservice.delete(cat);
		int judgen = -1;
		if(judge == true) {
			setlog("删除了分类:"+cat.getClass_name());
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
		
	}
	public CatService getCatservice() {
		return catservice;
	}

	public void setCatservice(CatService catservice) {
		this.catservice = catservice;
	}

	public Cat getCat() {
		return cat;
	}

	public void setCat(Cat cat) {
		this.cat = cat;
	}

	public List<Cat> getCats() {
		return cats;
	}

	public void setCats(List<Cat> cats) {
		this.cats = cats;
	}

	
	
	
}
