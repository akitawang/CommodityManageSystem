<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.nms.pojo.*"%>  
<%@page import="java.net.*"%>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
			<%
				Admin user = (Admin) session.getAttribute("user");  //获取登录的账户
				Date date =new Date();
				SimpleDateFormat sdf =new SimpleDateFormat("HH");  //获取当前时间
				String datetime=sdf.format(date);
				SimpleDateFormat sdf2 =new SimpleDateFormat("yyyy-MM-dd");  //获取当前时间
				String datetime2=sdf2.format(date);
				String time="未获取到";
				if(Integer.parseInt(datetime) < 11){
					time="上午好";
				}
				else if(Integer.parseInt(datetime) >=11 && Integer.parseInt(datetime) < 13){
					time = "中午好";
				}
				else if(Integer.parseInt(datetime) >=13 && Integer.parseInt(datetime) < 18){
					time = "下午好";
				}
				else{
					time = "晚上好";
				}
				
				if(user.getUsertype().equals("root")){
				
			%>
			
            <!-- Page Sidebar -->
            <div class="page-sidebar">
                <a class="logo-box" href="index.html">
                    <span>商品库存管理系统 V1.0 预览版</span>
                     
                </a>
				<div class="page-sidebar-inner">
                    <div class="page-sidebar-menu">
                        <ul class="accordion-menu">
                            <li >
                                <a href="index.jsp">
                                    <i class="menu-icon icon-home4"></i><span>我的控制台</span>
                                </a>
                            </li>
                            
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon icon-flash_on"></i><span>货品</span><i class="accordion-icon fa fa-angle-left"></i>
                                </a>
                                <ul class="sub-menu">
                                    <li><a href="/commodity_manage_system/nms_back/commodity_manage.jsp">货品入库</a></li>
                                    <li><a href="/commodity_manage_system/listCommodity">货品管理</a></li>
                                    <li><a href="/commodity_manage_system/listClassification">分类管理</a></li>
                                    <li><a href="/commodity_manage_system/listSe_Classification">子分类管理</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon icon-layers"></i><span>库存</span><i class="accordion-icon fa fa-angle-left"></i>
                                </a>
                                <ul class="sub-menu">
                                    <li><a href="/commodity_manage_system/listCommodity_alert">库存预警</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon icon-layers"></i><span>售卖</span><i class="accordion-icon fa fa-angle-left"></i>
                                </a>
                                <ul class="sub-menu">
                                    <li><a href="/commodity_manage_system/listSale">货品出售</a></li>
                                    <li><a href="/commodity_manage_system/listback">货品退回</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="menu-icon icon-layers"></i><span>供应商</span><i class="accordion-icon fa fa-angle-left"></i>
                                </a>
                                <ul class="sub-menu">
                                    <li><a href="/commodity_manage_system/nms_back/supplier_manage.jsp">供应商添加</a></li>
                                    <li><a href="/commodity_manage_system/listSupplier">供应商管理</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="menu-icon icon-layers"></i><span>账户管理</span><i class="accordion-icon fa fa-angle-left"></i>
                                </a>
                                <ul class="sub-menu">
                                    <li><a href="/commodity_manage_system/listAccount">账户管理</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="/commodity_manage_system/listLog">
                                    <i class="menu-icon icon-layers"></i><span>系统日志</span><i class="accordion-icon fa fa-angle-left"></i>
                                </a>
                            </li>
                            <li class="menu-divider"></li>
                            <li>
                                <a href="/commodity_manage_system/nms_back/help.jsp">
                                    <i class="menu-icon icon-help_outline"></i><span>使用帮助</span>
                                </a>
                            </li>
                            <li>
                                <a href="/commodity_manage_system/nms_back/repair.jsp">
                                    <i class="menu-icon icon-public"></i><span>故障报修</span><span class="label label-danger">V 1.0</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div><!-- /Page Sidebar -->
            <!-- Page Content -->
            <div class="page-content">
                <!-- Page Header -->
                <div class="page-header">
                    <div class="search-form">
                        <form action="#" method="GET">
                            <div class="input-group">
                                <input type="text" name="search" class="form-control search-input" placeholder="Type something...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" id="close-search" type="button"><i class="icon-close"></i></button>
                                </span>
                            </div>
                        </form>
                    </div>
                    <nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <div class="logo-sm">
                                    <a href="javascript:void(0)" id="sidebar-toggle-button"><i class="fa fa-bars"></i></a>
                                    <a class="logo-box" href="/commodity_manage_system/nms_back/index.html"><span>商品库存管理系统 V1.0 预览版</span></a>
                                </div>
                                
                            </div>
                        
                            <!-- Collect the nav links, forms, and other content for toggling -->
                        
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav">
                                    <li><a href="javascript:void(0)" id="collapsed-sidebar-toggle-button"><i class="fa fa-bars"></i></a></li>
                                    <li><a href="javascript:void(0)" id="toggle-fullscreen"><i class="fa fa-expand"></i></a></li>
                                    <li><a href="javascript:void(0)" id="search-button"><i class="fa fa-search"></i></a></li>
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    
                                    <li class="dropdown user-dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-align-justify" aria-hidden="true"></i><span>  设置</span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">Profile</a></li>
                                            <li><a href="#">Calendar</a></li>
                                            <li><a href="#"><span class="badge pull-right badge-danger">42</span>Messages</a></li>
                                            <li role="separator" class="divider"></li>
                                            <li><a href="#">Account Settings</a></li>
                                            <li><a href="/commodity_manage_system/outAdmin.action">登出系统</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </div><!-- /.container-fluid -->
                    </nav>
                </div><!-- /Page Header -->
          
           <%}
				else if(user.getUsertype().equals("manageman")){%>
				
				<!-- Page Sidebar -->
            <div class="page-sidebar">
                <a class="logo-box" href="index.html">
                    <span>商品库存管理系统 V1.0 预览版</span>
                     
                </a>
				<div class="page-sidebar-inner">
                    <div class="page-sidebar-menu">
                        <ul class="accordion-menu">
                            <li >
                                <a href="index.jsp">
                                    <i class="menu-icon icon-home4"></i><span>我的控制台</span>
                                </a>
                            </li>
                            
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon icon-flash_on"></i><span>货品</span><i class="accordion-icon fa fa-angle-left"></i>
                                </a>
                                <ul class="sub-menu">
                                    <li><a href="/commodity_manage_system/nms_back/commodity_manage.jsp">货品入库</a></li>
                                    <li><a href="/commodity_manage_system/listCommodity">货品管理</a></li>
                                    <li><a href="/commodity_manage_system/listClassification">分类管理</a></li>
                                    <li><a href="/commodity_manage_system/listSe_Classification">子分类管理</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon icon-layers"></i><span>库存</span><i class="accordion-icon fa fa-angle-left"></i>
                                </a>
                                <ul class="sub-menu">
                                    <li><a href="/commodity_manage_system/listCommodity_alert">库存预警</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon icon-layers"></i><span>售卖</span><i class="accordion-icon fa fa-angle-left"></i>
                                </a>
                                <ul class="sub-menu">
                                    <li><a href="/commodity_manage_system/listSale">货品出售</a></li>
                                    <li><a href="/commodity_manage_system/listback">货品退回</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="menu-icon icon-layers"></i><span>供应商</span><i class="accordion-icon fa fa-angle-left"></i>
                                </a>
                                <ul class="sub-menu">
                                    <li><a href="/commodity_manage_system/nms_back/supplier_manage.jsp">供应商添加</a></li>
                                    <li><a href="/commodity_manage_system/listSupplier">供应商管理</a></li>
                                </ul>
                            </li> 
                             
                            <li class="menu-divider"></li>
                            <li>
                                <a href="/commodity_manage_system/nms_back/help.jsp">
                                    <i class="menu-icon icon-help_outline"></i><span>使用帮助</span>
                                </a>
                            </li>
                            <li>
                                <a href="/commodity_manage_system/nms_back/repair.jsp">
                                    <i class="menu-icon icon-public"></i><span>故障报修</span><span class="label label-danger">V 1.0</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div><!-- /Page Sidebar -->
            <!-- Page Content -->
            <div class="page-content">
                <!-- Page Header -->
                <div class="page-header">
                    <div class="search-form">
                        <form action="#" method="GET">
                            <div class="input-group">
                                <input type="text" name="search" class="form-control search-input" placeholder="Type something...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" id="close-search" type="button"><i class="icon-close"></i></button>
                                </span>
                            </div>
                        </form>
                    </div>
                    <nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <div class="logo-sm">
                                    <a href="javascript:void(0)" id="sidebar-toggle-button"><i class="fa fa-bars"></i></a>
                                    <a class="logo-box" href="/commodity_manage_system/nms_back/index.html"><span>商品库存管理系统 V1.0 预览版</span></a>
                                </div>
                                
                            </div>
                        
                            <!-- Collect the nav links, forms, and other content for toggling -->
                        
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav">
                                    <li><a href="javascript:void(0)" id="collapsed-sidebar-toggle-button"><i class="fa fa-bars"></i></a></li>
                                    <li><a href="javascript:void(0)" id="toggle-fullscreen"><i class="fa fa-expand"></i></a></li>
                                    <li><a href="javascript:void(0)" id="search-button"><i class="fa fa-search"></i></a></li>
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    
                                    <li class="dropdown user-dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-align-justify" aria-hidden="true"></i><span>  设置</span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">Profile</a></li>
                                            <li><a href="#">Calendar</a></li>
                                            <li><a href="#"><span class="badge pull-right badge-danger">42</span>Messages</a></li>
                                            <li role="separator" class="divider"></li>
                                            <li><a href="#">Account Settings</a></li>
                                            <li><a href="/commodity_manage_system/outAdmin.action">登出系统</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </div><!-- /.container-fluid -->
                    </nav>
                </div><!-- /Page Header -->
               
				
				<%} 
					else if(user.getUsertype().equals("salesman")){%>
					<!-- Page Sidebar -->
            <div class="page-sidebar">
                <a class="logo-box" href="index.html">
                    <span>商品库存管理系统 V1.0 预览版</span>
                     
                </a>
				<div class="page-sidebar-inner">
                    <div class="page-sidebar-menu">
                        <ul class="accordion-menu">
                            <li >
                                <a href="index.jsp">
                                    <i class="menu-icon icon-home4"></i><span>我的控制台</span>
                                </a>
                            </li>
                            
                            
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon icon-layers"></i><span>库存</span><i class="accordion-icon fa fa-angle-left"></i>
                                </a>
                                <ul class="sub-menu">
                                    <li><a href="/commodity_manage_system/listCommodity_alert">库存预警</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon icon-layers"></i><span>售卖</span><i class="accordion-icon fa fa-angle-left"></i>
                                </a>
                                <ul class="sub-menu">
                                    <li><a href="/commodity_manage_system/listSale">货品出售</a></li>
                                    <li><a href="/commodity_manage_system/listback">货品退回</a></li>
                                </ul>
                            </li>
                            
                             
                            <li class="menu-divider"></li>
                            <li>
                                <a href="/commodity_manage_system/nms_back/help.jsp">
                                    <i class="menu-icon icon-help_outline"></i><span>使用帮助</span>
                                </a>
                            </li>
                            <li>
                                <a href="/commodity_manage_system/nms_back/repair.jsp">
                                    <i class="menu-icon icon-public"></i><span>故障报修</span><span class="label label-danger">V 1.0</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div><!-- /Page Sidebar -->
            <!-- Page Content -->
            <div class="page-content">
                <!-- Page Header -->
                <div class="page-header">
                    <div class="search-form">
                        <form action="#" method="GET">
                            <div class="input-group">
                                <input type="text" name="search" class="form-control search-input" placeholder="Type something...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" id="close-search" type="button"><i class="icon-close"></i></button>
                                </span>
                            </div>
                        </form>
                    </div>
                    <nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <div class="logo-sm">
                                    <a href="javascript:void(0)" id="sidebar-toggle-button"><i class="fa fa-bars"></i></a>
                                    <a class="logo-box" href="/commodity_manage_system/nms_back/index.html"><span>商品库存管理系统 V1.0 预览版</span></a>
                                </div>
                                
                            </div>
                        
                            <!-- Collect the nav links, forms, and other content for toggling -->
                        
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav">
                                    <li><a href="javascript:void(0)" id="collapsed-sidebar-toggle-button"><i class="fa fa-bars"></i></a></li>
                                    <li><a href="javascript:void(0)" id="toggle-fullscreen"><i class="fa fa-expand"></i></a></li>
                                    <li><a href="javascript:void(0)" id="search-button"><i class="fa fa-search"></i></a></li>
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    
                                    <li class="dropdown user-dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-align-justify" aria-hidden="true"></i><span>  设置</span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">Profile</a></li>
                                            <li><a href="#">Calendar</a></li>
                                            <li><a href="#"><span class="badge pull-right badge-danger">42</span>Messages</a></li>
                                            <li role="separator" class="divider"></li>
                                            <li><a href="#">Account Settings</a></li>
                                            <li><a href="/commodity_manage_system/outAdmin.action">登出系统</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </div><!-- /.container-fluid -->
                    </nav>
                </div><!-- /Page Header -->

				
					<%} %>

</body>
</html>