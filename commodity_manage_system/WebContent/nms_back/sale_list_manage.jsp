<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.nms.pojo.*"%>  
<%@page import="java.net.*"%>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive Admin Dashboard Template">
        <meta name="keywords" content="admin,dashboard">
        <meta name="author" content="skcats">
        <!-- The above 6 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        
        <!-- Title -->
        <title>商品库存管理系统  V1.0 预览版 </title>

        <!-- Styles -->
        <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
        <link href="/commodity_manage_system/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="/commodity_manage_system/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="/commodity_manage_system/assets/plugins/icomoon/style.css" rel="stylesheet">
        <link href="/commodity_manage_system/assets/plugins/uniform/css/default.css" rel="stylesheet"/>
        <link href="/commodity_manage_system/assets/plugins/switchery/switchery.min.css" rel="stylesheet"/>
        <link href="/commodity_manage_system/assets/plugins/nvd3/nv.d3.min.css" rel="stylesheet">  
      <link href="/commodity_manage_system/assets/plugins/datatables/css/jquery.datatables.min.css" rel="stylesheet" type="text/css"/>	
        <link href="/commodity_manage_system/assets/plugins/datatables/css/jquery.datatables_themeroller.css" rel="stylesheet" type="text/css"/>	
        <!-- Theme Styles -->
        <link href="/commodity_manage_system/assets/css/ecaps.min.css" rel="stylesheet">
        <link href="/commodity_manage_system/assets/css/custom.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        
        <!-- Page Container -->
        <div class="page-container">
        <!-- include side navigate bar-->
    	<%@include file="/nms_back/nav.jsp" %>
            
            
                 <!-- Page Inner -->
                <div class="page-inner">
                    <div class="page-title">
                        <h3 class="breadcrumb-header">商品出售/Commodity Sale</h3>
                    </div>
                <div id="main-wrapper">
                    <div class="row">
                        <!-- list cat -->
                        <div class="col-md-12">
                                <div class="panel panel-white">
                                <div class="panel-heading">
                                    <h4 class="panel-title">商品列表/Commodity List</h4>
                                </div>
                                <div class="panel-body">
                               <div class="table-responsive">
                                   <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                       <thead>
                                            <tr>
                                            	<th style="width: 10%; cellspacing: 0;">ID</th>
                                                <th style="width: 15%; cellspacing: 0;">商品名称</th>
                                                <th style="width: 10%; cellspacing: 0;">商品数量</th>
                                                <th style="width: 15%; cellspacing: 0;">商品分类</th>
                                                <th style="width: 20%; cellspacing: 0;">建议零售价</th>
                                                <th style="width: 20%; cellspacing: 0;">条形码</th>
                                                <th style="width: 10%; cellspacing: 0;">操作</th>
                                            </tr>
                                        </thead>
	                                        <s:iterator value="commoditys" var="p">
												<tr>
													<td style="width: 10%; cellspacing: 0;">${p.id}</td>
	                                                <th style="width: 15%; cellspacing: 0;">${p.cname}</th>
	                                                <th style="width: 10%; cellspacing: 0;">${p.number}</th>
	                                                <th style="width: 15%; cellspacing: 0;">${p.cat}</th>
	                                                <th style="width: 20%; cellspacing: 0;">${p.out_price}</th>
	                                                <th style="width: 20%; cellspacing: 0;">${p.remarks}</th>
	                                                <th style="width: 10%; cellspacing: 0;">
	                                                <a href="/commodity_manage_system/nms_back/sale_do.jsp?cname=${p.cname}&id=${p.id}&number=${p.number}&cat=${p.cat}&se_cat=${p.se_cat}&phote=${p.photo}&model=${p.model}&born_date=${p.born_date}&invalid_date=${p.invalid_date}&standards=${p.standards}&province=${p.province}&city=${p.city}&supplier=${p.supplier}&weight=${p.weight}&remarks=${p.remarks}&in_price=${p.in_price}&out_price=${p.out_price}">
	                                                <button class="btn btn-primary" >出售</button>
	                                                </a>
	                                                </th>
												</tr>
											</s:iterator>
                                   </table>
                               </div>
                                </div>
                            </div>
                              
                        </div><!-- list cat -->
                    </div><!-- Row -->
                </div><!-- Main Wrapper -->
                <!-- footer -->
                <%@include file="./footer.jsp" %>
                </div><!-- /Page Inner -->
               
            </div><!-- /Page Content -->
        </div><!-- /Page Container -->
        
        
        <!-- Javascripts -->
        <script src="/commodity_manage_system/assets/plugins/jquery/jquery-3.1.0.min.js"></script>
        <script src="/commodity_manage_system/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="/commodity_manage_system/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <script src="/commodity_manage_system/assets/plugins/uniform/js/jquery.uniform.standalone.js"></script>
        <script src="/commodity_manage_system/assets/plugins/switchery/switchery.min.js"></script>
        <script src="/commodity_manage_system/assets/plugins/d3/d3.min.js"></script>
        <script src="/commodity_manage_system/assets/plugins/nvd3/nv.d3.min.js"></script>
        <script src="/commodity_manage_system/assets/plugins/flot/jquery.flot.min.js"></script>
        <script src="/commodity_manage_system/assets/plugins/flot/jquery.flot.time.min.js"></script>
        <script src="/commodity_manage_system/assets/plugins/flot/jquery.flot.symbol.min.js"></script>
        <script src="/commodity_manage_system/assets/plugins/flot/jquery.flot.resize.min.js"></script>
        <script src="/commodity_manage_system/assets/plugins/flot/jquery.flot.tooltip.min.js"></script>
        <script src="/commodity_manage_system/assets/plugins/flot/jquery.flot.pie.min.js"></script>
        <script src="/commodity_manage_system/assets/plugins/chartjs/chart.min.js"></script>
        <script src="/commodity_manage_system/assets/js/ecaps.min.js"></script>
        <script src="/commodity_manage_system/assets/js/pages/dashboard.js"></script>
        <script src="/commodity_manage_system/assets/plugins/datatables/js/jquery.datatables.min.js"></script>
        <script src="/commodity_manage_system/assets/js/pages/table-data.js"></script>
       
    </body>
</html>