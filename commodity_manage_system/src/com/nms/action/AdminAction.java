package com.nms.action;



import com.nms.pojo.Admin;
import com.nms.pojo.Log;
import com.nms.service.AdminService;
import com.nms.service.LogService;
import com.nms.util.MD5Util;
import com.nms.util.SendMail;
import com.opensymphony.xwork2.ActionContext;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;


@Namespace("/")
@ParentPackage("struts-default")
@Results({@Result(name = "goindex",location = "/nms_back/index.jsp"),
		  @Result(name = "gologin",location = "/login.jsp"),
		  @Result(name = "reset_systemfault",location = "/reset_systemfault.jsp"),
		  @Result(name = "reset_timeout",location = "/reset_timeout.jsp"),
		  @Result(name = "reset_success",location = "/resetpass.jsp"),
		  @Result(name = "admin_manage",location = "/nms_back/account_manage.jsp")	
})
public class AdminAction {
	@Autowired
	AdminService adminservice;
	@Autowired
	LogService logservice;
	 
	Admin admin;
	
	List<Admin> admins;
	
	public String getdate() {
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  //获取当前时间
		String datetime=sdf.format(new Date());
		return datetime;
	}
	
	public void setlog(Admin admin,String operate) {
		Log log = new Log();
		log.setOperator_account(admin.getUseraccount());
		log.setContent(operate);
		log.setOp_date(getdate());
		logservice.add(log);

	}
	
	 
	@Action("logAdmin")
	public void log() throws IOException { 
		//System.out.print(admin.getId()+admin.getUseraccount()+"----"+admin.getUserpass()+"----"+admin);
		Admin account = adminservice.login(admin);
		int judgen = -1;
		if(account != null) {
			setlog(admin,"登录系统");
			judgen = 1;
		}
		ActionContext.getContext().getSession().put("user",account);
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
	}
	
	@Action("regAdmin")
	public void register() throws IOException { 
		//System.out.print(admin.getId()+admin.getUseraccount()+"----"+admin.getUserpass()+"----"+admin); 
		int flag = 1;
		admins = adminservice.list();
		for(int i=0;i<admins.size();i++) {
			if(admins.get(i).getUseraccount().equals(admin.getUseraccount())) {
				flag = -1;
			}
		}
		if(flag == -1) {
			HttpServletResponse response=ServletActionContext.getResponse();   
			response.setContentType("text/javascript");
			response.getWriter().print(-1);
		}
		else {
			boolean judge = adminservice.add(admin);
			int judgen = -1;
			if(judge) {
				setlog(admin,"注册新用户");
				judgen = 1;
			}
			
			HttpServletResponse response=ServletActionContext.getResponse();   
			response.setContentType("text/javascript");
			response.getWriter().print(judgen);
		}
		
	}
	
	@Action("outAdmin")
	public String logout() throws IOException { 
		ActionContext.getContext().getSession().clear();
		 
		return "gologin";
	}
	
	@Action("findpassAdmin")
	public void findpass() throws IOException, AddressException, MessagingException { 
		Admin realaccount = adminservice.validate_pass(admin);
		int j = -1;
		//若账号邮箱不匹配。则返回-1，ajax判断，显示失败
		if(realaccount == null) {
			
			HttpServletResponse response=ServletActionContext.getResponse();   
			response.setContentType("text/javascript");
			response.getWriter().print(j);
		}
		//若账号邮箱匹配，则发送邮件
		else {
			long currentTime = System.currentTimeMillis() + 900000;
			Date time = new Date(currentTime);
			Timestamp ts = new Timestamp(time.getTime());
			Random random = new Random();
			String key = realaccount.getId() + "|" + ts + "|" + random.nextInt();
			String signature = MD5Util.MD5(key);
			realaccount.setOutdate(ts);
			realaccount.setSignature(signature);
			boolean judge_update = adminservice.update(realaccount);
			if(judge_update)
			{
				setlog(admin,"使用了找回密码");
				j = 1;
				SendMail sendmail = new SendMail();
				String url = "http://localhost:8080/commodity_manage_system/isChangeAdmin.action"+"?uid=" + realaccount.getId() + "&validkey=" + signature;
				sendmail.send(realaccount.getUseremail(), url, realaccount);
				HttpServletResponse response=ServletActionContext.getResponse();   
				response.setContentType("text/javascript");
				response.getWriter().print(j);
			}
			else {
				HttpServletResponse response=ServletActionContext.getResponse();   
				response.setContentType("text/javascript");
				response.getWriter().print(j);
			}
		}
		
		
	}
	@Action("resetpassAdmin")
	public void resetpass() throws IOException { 
		HttpServletRequest request= ServletActionContext.getRequest();
		request.setCharacterEncoding("utf-8");
		int id = admin.getId();
		String pass = admin.getUserpass();
		Admin real = adminservice.get(id);
		real.setUserpass(pass);
		boolean judge = adminservice.update(real);
		int judgen = -1;
		if(judge) {
			setlog(admin,"重置了密码");
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
	}
	
	@Action("isChangeAdmin")
	public String isChangePass() throws IOException { 
		HttpServletRequest request= ServletActionContext.getRequest();
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("uid"));
		String validkey = request.getParameter("validkey");
		int judge = adminservice.isChangePass(id,validkey);
		if(judge == 1 ) {
			return "reset_systemfault";
		}
		else if(judge == 3 || judge == 2)  {
			return "reset_timeout";
		}
		else {
	        request.setAttribute("id", id);
			return "reset_success";
		}
		
	}
	
	
	@Action("listAccount")
	public String listAccount() { 
		admins = adminservice.list();
		return "admin_manage";
		
	}

	
	@Action("recAccount")
	public void recAccount() throws IOException { 
		boolean judge = adminservice.update(admin);
		int judgen = -1;
		if(judge == true) {
			setlog(admin,"修改了其他账户信息");
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
		
	}
	
	@Action("delAccount")
	public void delAccount() throws IOException { 
		boolean judge = adminservice.delete(admin);
		int judgen = -1;
		if(judge == true) {
			setlog(admin,"删除了其他账户信息");
			judgen = 1;
		}
		HttpServletResponse response=ServletActionContext.getResponse();   
		response.setContentType("text/javascript");
		response.getWriter().print(judgen);
		
	}
	
	public AdminService getAdminservice() {
		return adminservice;
	}

	public void setAdminservice(AdminService adminservice) {
		this.adminservice = adminservice;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public List<Admin> getAdmins() {
		return admins;
	}

	public void setAdmins(List<Admin> admins) {
		this.admins = admins;
	}
	
	
}
