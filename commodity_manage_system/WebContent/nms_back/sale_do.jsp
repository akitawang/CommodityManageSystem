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
                        <h3 class="breadcrumb-header">商品出售/Commodity Sale</h3>
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
                                                        <input type="text" id="cid"  class="input-large form-control m-b-sm" value="<%=request.getParameter("id")%>" readonly>
                                                        <label class="control-label">商品名称</label><font color="red">*</font>
                                                        <input id="cname" type="text" class="input-large form-control m-b-sm" value="<%=request.getParameter("cname")%>" readonly />
                                                        <label class="control-label">库存数量</label><font color="red">*</font>
                                                        <input id="number" type="number" class="input-large form-control m-b-sm" value="<%=request.getParameter("number")%>" readonly />
                                                        <label class="control-label">商品所属分类 </label><font color="red">*</font>
                                                        <input id="cat" type="text" class="input-large form-control m-b-sm" value="<%=request.getParameter("cat")%>" readonly />
                                                        <label class="control-label">条形码</label>
                                                        <input class="input-large form-control" id="remarks"  value="<%=request.getParameter("remarks")%>" readonly />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="control-group">
                                                    <div class="controls">
                                                    	<label class="control-label">商品规格</label>
                                                        <input id="model" type="text" class="input-large form-control m-b-sm"  value="<%=request.getParameter("model")%>" readonly />
                                                        
                                                        <label class="control-label">执行标准</label>
                                                        <input id="standards" type="text" class="input-large form-control m-b-sm"  value="<%=request.getParameter("standards")%>" readonly />
                                                        
                                                        <label class="control-label">重量(kg)</label><font color="red">*</font>
                                                        <input id="weight" type="text" class="input-large form-control m-b-sm"  value="<%=request.getParameter("weight")%>" readonly />
                                                       
                                                       <label class="control-label">产地</label><font color="red">*</font>
                                                        <input  type="text" class="input-large form-control m-b-sm"  value="<%=request.getParameter("province")%><%=request.getParameter("city")%>" readonly />
                                                       
                                                       <label class="control-label">供应商</label> 
                                                        <input id="weight" type="text" class="input-large form-control m-b-sm"  value="<%=request.getParameter("supplier")%>" readonly />
                            							 
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="control-group">
                                                    <div class="controls">
                                                        <label class="control-label">进货价格(￥)</label><font color="red">*</font>
                                                        <input id="in_price" type="text" class="input-large form-control m-b-sm"  value="<%=request.getParameter("in_price")%>" readonly />
                                                        
                                                        <label class="control-label">建议售卖价格(￥)</label><font color="red">*</font>
                                                        <input id="out_price" type="text" class="input-large form-control m-b-sm"  value="<%=request.getParameter("out_price")%>" readonly />
                                                        
                                                        
                                                        <label class="control-label">实际售出价格(￥)</label><font color="red">*</font>
                                                        <input id="sale_price" type="text" class="input-large form-control m-b-sm" />
                                                        
                                                        <label class="control-label">售出数量</label><font color="red">*</font>
                                                        <input id="sale_number" type="text" class="input-large form-control m-b-sm" />

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                         

                                        <div class="row m-t-lg">
                                            <div class="col-md-12"> 
				                                <a><button id="delButton" class="btn btn-danger" >售出</button></a>
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
	    		var number = parseInt($('#number').val());
	    		var sale_name = $('#cname').val();
	    		var id = $('#cid').val();
	    		var sale_price = $('#sale_price').val();
	    		var sale_number = $('#sale_number').val();
	    		var rnumber = parseInt(number)-parseInt(sale_number);
	    		
	    		var picture = "<%=request.getParameter("picture")%>";
	    		var cname = "<%=request.getParameter("cname")%>";
	    		var cat ="<%=request.getParameter("cat")%>";
	    		var se_cat =" <%=request.getParameter("se_cat")%>";
	    		var model = "<%=request.getParameter("model")%>";
	    		var born_date ="<%=request.getParameter("born_date")%>";
	    		var invalid_date ="<%=request.getParameter("invalid_date")%>";
	    		var standards ="<%=request.getParameter("standards")%>";
	    		var province = "<%=request.getParameter("province")%>";
	    		var city = "<%=request.getParameter("city")%>";
	    		var supplier = "<%=request.getParameter("supplier")%>";
	    		var weight = "<%=request.getParameter("weight")%>";
	    		var remarks = "<%=request.getParameter("remarks")%>";
	    		var in_price ="<%=request.getParameter("in_price")%>";
	    		var out_price = "<%=request.getParameter("out_price")%>";
	    		var regPos = /^\d+(\.\d+)?$/; //非负浮点数
	    		
	    		
	    		
	    		if(sale_price=='' || sale_number==''){
	    			swal({
                        title: '出售失败',
                        text: "请将表单填写完整",
                        type: 'error',
                        confirmButtonClass: 'btn btn-confirm mt-2'
                    }).then(function () {
                  	  return false;
                    })
	    		}
	    		else if(parseInt(number) <= parseInt(0) || parseInt(rnumber) < parseInt(0)){
	    			swal({
                        title: '出售失败',
                        text: "库存不足，无法出售",
                        type: 'error',
                        confirmButtonClass: 'btn btn-confirm mt-2'
                    }).then(function () {
                  	  return false;
                    })
	    		}
	    		else if(sale_price != '' && !regPos.test(sale_price)){
	    			swal({
                        title: '出售失败',
                        text: "商品出售价格必须是一个数字",
                        type: 'error',
                        confirmButtonClass: 'btn btn-confirm mt-2'
                    }).then(function () {
                  	  return false;
                    })
	    		}
	    		else{
	    		 
		        swal({  
		        	   title: '你确定要售出吗？',
		               type: 'warning',
		               showCancelButton: true,
		               confirmButtonText: '确认',
		               cancelButtonText: '我再想想', 
		        }).then(function(isConfirm) {  
		            if(isConfirm.value !=true) {  
		                return false;
		            } else {  
		            	$.ajax({
		                       url: "/commodity_manage_system/saleCommodity",
		                       data:{
		                    	    "commodity.cname":cname,
		                          	"commodity.number":rnumber,
		                          	"commodity.cat":cat,
		                          	"commodity.se_cat":se_cat,
		                          	"commodity.model":model,
		                          	"commodity.born_date":born_date,
		                          	"commodity.invalid_date":invalid_date,
		                          	"commodity.standards":standards,
		                          	"commodity.city":city,
		                          	"commodity.province":province,
		                          	"commodity.supplier":supplier,
		                          	"commodity.weight":weight,
		                          	"commodity.remarks":remarks,
		                          	"commodity.photo":picture,
		                          	"commodity.in_price":in_price,
		                          	"commodity.out_price":out_price,
		                          	"commodity.id":id,
		                          	"sale.commodity_id":id,
		                          	"sale.sale_price":sale_price,
		                          	"sale.sale_number":sale_number,
		                          	"sale.sale_name":sale_name,
		                         	},
		                       type: "post",
		                       success:function (data) {
		                       	if(data > 0){
		                       		swal({
		                                   title: '售出成功',
		                                   text: cname+"已经成功被售出",
		                                   type: 'success',
		                                   confirmButtonClass: 'btn btn-confirm mt-2'
		                               }).then(function () {
		                            	   window.location="/commodity_manage_system/listSale"
		                               })
		                         		 
		                         	}
		                         	else{
		                         		swal({
		                                   title: '售出败',
		                                   text: "售出遇到了一个问题，请重试",
		                                   type: 'error',
		                                   confirmButtonClass: 'btn btn-confirm mt-2'
		                               })
		                         	}
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