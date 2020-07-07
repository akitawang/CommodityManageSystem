package com.nms.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nms.pojo.Admin;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter extends HttpServlet implements Filter {

    /**
     * Default constructor. 
     */ 
	private static final long serialVersionUID = 1L;  
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest sRequest, ServletResponse sResponse, FilterChain filterChain) throws IOException, ServletException {
		 HttpServletRequest request = (HttpServletRequest) sRequest;      
	        HttpServletResponse response = (HttpServletResponse) sResponse;      
	        HttpSession session = request.getSession();      
	        String url=request.getServletPath();  
	        String contextPath=request.getContextPath();  
	        if(url.equals(""))url+="/nms_back/";  
	        if((url.startsWith("/nms_back/"))){//若访问后台资源 过滤到login  
	             Admin user=(Admin)session.getAttribute("user");  
	             if(user==null){//转入管理员登陆页面  
	                  response.sendRedirect(contextPath+"/login.jsp");  
	                  return;  
	             }  
	        }  
	          filterChain.doFilter(sRequest, sResponse);    
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
