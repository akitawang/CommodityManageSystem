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
                        <h3 class="breadcrumb-header">商品管理/Commodity Manage</h3>
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
                                                        <input id="cname" type="text" class="input-large form-control m-b-sm" value="<%=request.getParameter("cname")%>" />
                                                        <label class="control-label">库存数量</label><font color="red">*</font>
                                                        <input id="number" type="number" class="input-large form-control m-b-sm" value="<%=request.getParameter("number")%>" />
                                                        <label class="control-label">商品所属分类 </label>
                                                        <select  class="input-large form-control m-b-sm" id="cat">
                                                        <option value="<%=request.getParameter("cat")%>"> </option>
                                                        </select>
                                                        <label class="control-label">商品所属子分类 </label>
                                                        <select  class="input-large form-control m-b-sm" id="se_cat">
                                                        <option value="<%=request.getParameter("se_cat")%>"></option>
                                                        </select>
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="control-group">
                                                    <div class="controls">
                                                    	<label class="control-label">商品规格</label>
                                                        <input id="model" type="text" class="input-large form-control m-b-sm"  value="<%=request.getParameter("model")%>" />
                                                        
                                                        <label class="control-label">执行标准</label>
                                                        <input id="standards" type="text" class="input-large form-control m-b-sm"  value="<%=request.getParameter("standards")%>" />
                                                        
                                                        <label class="control-label">入库日期</label><font color="red">*</font>
                                                        <input id="born_date" type="date"  value="<%=request.getParameter("born_date")%>" class="input-large form-control m-b-sm"  />

                                                        <label class="control-label">过期日期</label>
                                                        <input id="invalid_date" type="date" class="input-large form-control m-b-sm" value="<%=request.getParameter("invalid_date")%>" />

                                                       
                                                        <div class="col-md-6">
                                                         <label class="control-label">生产省份</label>
                                                         <select  style="margin-bottom:15px;" class="form-control" id="province" >
                                                          <option value="<%=request.getParameter("province")%>"><%=request.getParameter("province")%></option>
                                                         </select>
                            							</div>
                            							<div class="col-md-6">
                            							<label class="control-label">生产城市 </label>
                                                        <select  class="form-control" id="city">
                                                         <option value="<%=request.getParameter("city")%>"><%=request.getParameter("city")%></option>
                                                        </select>
                            							</div>
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="control-group">
                                                    <div class="controls">
                                                    	<label class="control-label">重量(kg)</label><font color="red">*</font>
                                                        <input id="weight" type="text" class="input-large form-control m-b-sm"  value="<%=request.getParameter("weight")%>" />
                                                        
                                                        <label class="control-label">供应商 </label>
                                                        <select  class="form-control" id="supplier">
                                                        <option value="<%=request.getParameter("supplier")%>"></option>
                                                        </select>
                                                        
                                                        <label class="control-label">进货价格(￥)</label><font color="red">*</font>
                                                        <input id="in_price" type="text" class="input-large form-control m-b-sm"  value="<%=request.getParameter("in_price")%>"/>
                                                        
                                                        <label class="control-label">建议售卖价格(￥)</label><font color="red">*</font>
                                                        <input id="out_price" type="text" class="input-large form-control m-b-sm"  value="<%=request.getParameter("out_price")%>"/>

                                                        <label class="control-label">条形码</label>
                                                        <input class="input-large form-control" id="remarks"  value="<%=request.getParameter("remarks")%>" />

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row m-t-lg">
                                            <div class="col-md-12">
                                                <a><button id="recButton" class="btn btn-warning" >修改</button></a>
				                                <a><button id="delButton" class="btn btn-danger" >删除</button></a>
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
 
		var iNum1;
        var iNum2;
       $(function () {
            for(var i=0;i<province.length;i++){
                $('#province').append('<option>'+province[i]+'</option>');
            };
            $('#province').change(function () {
                $('#city').children().not(':eq(0)').remove();
                iNum1 = $(this).children('option:selected').index();
                var aaCity = city[iNum1-1];
                for(var j=0;j<aaCity.length;j++){
                    $('#city').append('<option>'+aaCity[j]+'</option>');
                }
            });
       })

		
		window.onload = SearchSupplier();//加载页面时自动执行方法
		 function SearchSupplier(){
			 $.ajax({
		         url: "/commodity_manage_system/SelectSupplier",  
		         type: "post",
		         dataType: "json",
		         contentType: "application/json",
		         traditional: true,
		         success: function (data) {
		        	 
		        	 if(data.length == 0){
		        		 $("#supplier").append("<option value=''>请在供应商管理模块添加供应商</option>");
		        	 }
		        	 else{
		             for (var i = 0; i < data.length; i++) {
		                 var jsonObj =data[i];
						 $("#supplier").append("<option value='"+jsonObj.sname+"'>" + jsonObj.sname + "</option>");
		             }}
		         },
		         error: function (msg) {
		             alert("下拉列表供应商数据加载出错，请重试！");
		         }
		     });
		 }
		
		 window.onload = Searchclassification();//加载页面时自动执行方法
		 function Searchclassification(){
			 $.ajax({
		         url: "/commodity_manage_system/SelectClassification",  
		         type: "post",
		         dataType: "json",
		         contentType: "application/json",
		         traditional: true,
		         success: function (data) {
		        	
		        	 if(data.length == 0){
		        		 $("#cat").append("<option value=''>请在分类管理模块添加分类</option>");
		        	 }
		        	 else{
		             for (var i = 0; i < data.length; i++) {
		                 var jsonObj =data[i];
						 $("#cat").append("<option value='"+jsonObj.class_name+"'>" + jsonObj.class_name + "</option>");
		             }}
		         },
		         error: function (msg) {
		             alert("下拉列表分类数据加载出错，请重试！");
		         }
		     });
		 }
		 
		 window.onload = Searchse_classification();//加载页面时自动执行方法
		 function Searchse_classification(){
			 $.ajax({
		         url: "/commodity_manage_system/SelectSe_Classification",  
		         type: "post",
		         dataType: "json",
		         contentType: "application/json",
		         traditional: true,
		         success: function (data) {
		        	
		        	 if(data.length == 0){
		        		 $("#se_cat").append("<option value=''>请在分类管理模块添加子分类</option>");
		        	 }
		        	 else{
		             for (var i = 0; i < data.length; i++) {
		                 var jsonObj =data[i];
						 $("#se_cat").append("<option value='"+jsonObj.se_class_name+"'>" + jsonObj.se_class_name + "</option>");
		             }}
		         },
		         error: function (msg) {
		             alert("下拉列表分类数据加载出错，请重试！");
		         }
		     });
		 }
		 
		 
		 $(document).ready(function() {
			 $("#recButton").click(function(){
				 $("#recButton").attr('disabled',"true");
				 	var picture = $('#picture').val();
		    		var cname = $('#cname').val();
		    		var number = $('#number').val();
		    		var cat = $('#cat').val();
		    		var se_cat = $('#se_cat').val();
		    		var model = $('#model').val();
		    		var born_date = $('#born_date').val();
		    		var invalid_date = $('#invalid_date').val();
		    		var standards = $('#standards').val();
		    		var province = $('#province').val();
		    		var city = $('#city').val();
		    		var supplier = $('#supplier').val();
		    		var weight = $('#weight').val();
		    		var remarks = $('#remarks').val();
		    		var in_price = $('#in_price').val();
		    		var out_price = $('#out_price').val();
		    		var id = $('#cid').val();
		    		var regPos = /^\d+(\.\d+)?$/; //非负浮点数
		    		if(cname == ''){
		    			alert("请您提交前先输入商品名称！");
		    			$("#recButton").removeAttr("disabled");
		    			return false;
		    		}
		    		else if(weight != '' && !regPos.test(weight)){
		    			alert("商品重量必须是一个数字");
		    			$("#recButton").removeAttr("disabled");
		    			return false;
		    	    }
		    		else if(in_price != '' && !regPos.test(in_price)){
		    			alert("商品进货价格必须是一个数字");
		    			$("#recButton").removeAttr("disabled");
		    			return false;
		    	    }
		    		else if(out_price != '' && !regPos.test(out_price)){
		    			alert("商品建议零售价必须是一个数字");
		    			$("#recButton").removeAttr("disabled");
		    			return false;
		    	    }
		    		else if(number == ''){
		    			alert("请您提交前先输入库存数量！");
		    			$("#recButton").removeAttr("disabled");
		    			return false;
		    		}
		    		else if(born_date == ''){
		    			alert("请您提交前先输入入库时间！");
		    			$("#recButton").removeAttr("disabled");
		    			return false;
		    		}
		          //设置linkToCart的href的值
		          $.ajax({
               url:"/commodity_manage_system/recCommodity",
               data:{
            	"commodity.cname":cname,
               	"commodity.number":number,
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
               	},
               type:"post",
               success:function(data){
               	if(data > 0){
               		alert("操作成功");
               		history.back(-1);
               	}
               	else{
               		alert("操作失败");
               	}
               	$("#recButton").removeAttr("disabled");
               },
               error:function(data){
               	alert("操作异常(请将以下内容截取给服务供应商以排除错误)：" +  data.responseText);
            	$("#recButton").removeAttr("disabled");
               }
           });
           return false;
		         
		      });
		 });
		 
		 
		 $("#delButton").on("click", function() {  
			 	var picture = $('#picture').val();
	    		var cname = $('#cname').val();
	    		var number = $('#number').val();
	    		var cat = $('#cat').val();
	    		var se_cat = $('#se_cat').val();
	    		var model = $('#model').val();
	    		var born_date = $('#born_date').val();
	    		var invalid_date = $('#invalid_date').val();
	    		var standards = $('#standards').val();
	    		var province = $('#province').val();
	    		var city = $('#city').val();
	    		var supplier = $('#supplier').val();
	    		var weight = $('#weight').val();
	    		var remarks = $('#remarks').val();
	    		var in_price = $('#in_price').val();
	    		var out_price = $('#out_price').val();
	    		var id = $('#cid').val();
		        swal({  
		        	  title: '你确定要删除吗？',
		               text: "一旦删除将无法恢复",
		               type: 'warning',
		               showCancelButton: true,
		               confirmButtonText: '确认',
		               cancelButtonText: '我再想想', 
		        }).then(function(isConfirm) {  
		            if(isConfirm.value !=true) {  
		                return false;
		            } else {  
		            	$.ajax({
		                       url: "/commodity_manage_system/delCommodity",
		                       data:{
		                    	   "commodity.cname":cname,
		                          	"commodity.number":number,
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
		                         	},
		                       type: "post",
		                       success:function (data) {
		                       	if(data > 0){
		                       		swal({
		                                   title: '删除成功',
		                                   text: "数据已经成功被移除",
		                                   type: 'success',
		                                   confirmButtonClass: 'btn btn-confirm mt-2'
		                               }).then(function () {
		                            	  history.back(-1);
		                               })
		                         		 
		                         	}
		                         	else{
		                         		swal({
		                                   title: '删除失败',
		                                   text: "删除遇到了一个问题，请重试",
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
		        })  
		 
        
        </script>
    </body>
</html>