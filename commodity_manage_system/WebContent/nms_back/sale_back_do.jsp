<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.nms.pojo.*"%>  
<%@page import="java.net.*"%>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%>
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
      	<link href="/commodity_manage_system/assets/plugins/sweetalert2/sweetalert2.min.css" rel="stylesheet" >  
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
                        <h3 class="breadcrumb-header">商品退货/Commodity Back</h3>
                    </div>
                <div id="main-wrapper">
                    <div class="row">
                        
                            <div class="col-md-12">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">商品信息/Commodity Information</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="control-group">
                                                    <div class="controls">
                                                    	<label class="control-label">商品ID </label>
                                                        <input type="text" id="commodity_id"  class="input-large form-control m-b-sm" readonly value="<%=request.getParameter("commodity_id")%>" readonly>
                                                        <label class="control-label">商品名称</label><font color="red">*</font>
                                                        <input id="sale_name" type="text" class="input-large form-control m-b-sm" readonly value="<%=request.getParameter("sale_name")%>" readonly />
                                                        <label class="control-label">售出数量</label><font color="red">*</font>
                                                        <input id="sale_number" type="number" class="input-large form-control m-b-sm" readonly value="<%=request.getParameter("sale_number")%>" readonly />
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="control-group">
                                                    <div class="controls">
                                                    	<label class="control-label">订单ID</label><font color="red">*</font>
                                                        <input id="id" type="text" class="input-large form-control m-b-sm"  readonly value="<%=request.getParameter("id")%>" readonly />
                                                        
                                                        <label class="control-label">售出日期</label><font color="red">*</font>
                                                        <input id="sale_date" type="text" class="input-large form-control m-b-sm" readonly value="<%=request.getParameter("sale_date")%>" readonly />
                                                       
                                                       <label class="control-label">订单号</label><font color="red">*</font>
                                                        <input id="sale_order" type="text" class="input-large form-control m-b-sm" readonly value="<%=request.getParameter("sale_order")%>" readonly />
                                                       
                            							 
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="control-group">
                                                    <div class="controls">
                                                        <label class="control-label">售出价格(￥)</label><font color="red">*</font>
                                                        <input id="sale_price" type="text" class="input-large form-control m-b-sm" readonly value="<%=request.getParameter("sale_price")%>" readonly />
                                                        
                                                        
                                                        <label class="control-label">备注</label><font color="red">*</font>
                                                        <textarea id="remarks"  row="2" class="input-large form-control m-b-sm" placeholder="请填写退货原因等信息"></textarea>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </div>

                                        <div class="row m-t-lg">
                                            <div class="col-md-12"> 
				                                <a><button id="delButton" class="btn btn-danger" >退货</button></a>
                                            </div>
                                        </div>
 											 
                                        <div class="row m-t-lg">
                                            <div class="col-md-12">
                                                <pre id='toastrOptions'>请完成所有带红色星号的内容，以保证数据的完整性。若日期选择无法弹出选择框，请改用Chrome或Opera浏览器，或将当前浏览器调整为极速模式。</pre>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                              
                        </div>
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
        <script src="/commodity_manage_system/nms_back/data/city.js"></script>
        <!-- Sweet Alert Js  -->
        <script src="/commodity_manage_system/assets/plugins/sweetalert2/sweetalert2.min.js"></script>
        <script src="/commodity_manage_system/assets/js/pages/jquery.sweet-alert.init.js"></script>
        <script>
 

		 $("#delButton").on("click", function() {  
	    		var commodity_id = parseInt($('#commodity_id').val());
	    		var id = $('#id').val();
	    		var sale_price = $('#sale_price').val();
	    		var sale_date = $('#sale_date').val();
	    		var sale_number = $('#sale_number').val();
	    		var sale_name = $('#sale_name').val();
	    		var sale_order = $('#sale_order').val();
	    		var sale_status = '退货';
	    		var remarks = $('#remarks').val();
	    		

	    		
	    		
	    		if(remarks == ''){
	    			swal({
                        title: '退货失败',
                        text: "请填写退货原因备注",
                        type: 'error',
                        confirmButtonClass: 'btn btn-confirm mt-2'
                    }).then(function () {
                  	  return false;
                    })
	    		}
	    		else{
	    		 
		        swal({  
		        	   title: '你确定要退货？',
		               type: 'warning',
		               showCancelButton: true,
		               confirmButtonText: '确认',
		               cancelButtonText: '我再想想', 
		        }).then(function(isConfirm) {  
		            if(isConfirm.value !=true) {  
		                return false;
		            } else {  
		            	$.ajax({
		                       url: "/commodity_manage_system/backCommodity",
		                       data:{
		                    	   "sale.commodity_id":commodity_id,
		                          	"sale.id":id,
		                          	"sale.sale_price":sale_price,
		                          	"sale.sale_number":sale_number,
		                          	"sale.sale_name":sale_name,
		                          	"sale.remarks":remarks,
		                          	"sale.sale_status":sale_status,
		                          	"sale.sale_order":sale_order,
		                         	},
		                       type: "post",
		                       success:function (data) {
		                       		swal({
		                                   title: '退货成功',
		                                   text: cname+"已经成功被退货",
		                                   type: 'success',
		                                   confirmButtonClass: 'btn btn-confirm mt-2'
		                               }).then(function () {
		                            	   window.location="/commodity_manage_system/listback"
		                               })
		                         		 
		                       
		                       },
		                       error:function(data){
		                       	alert("操作异常(请将以下内容截取给服务供应商以排除错误)：" +  data.responseText);
		                         }
		                   });
		                }
		            })   
	    		}
		        })  
		 
        
        </script>
    </body>
</html>