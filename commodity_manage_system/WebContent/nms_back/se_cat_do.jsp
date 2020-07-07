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
                        <h3 class="breadcrumb-header">子分类管理/Sub_Classification Manage</h3>
                    </div>
                <div id="main-wrapper">
                    <div class="row">
                        
                            <div class="col-md-12">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">商品分类修改/Rectify Commodity Sub_Classification</h4>
                                    </div>

                                    <div class="panel-body">
                                        <div class="row">
                                         <div class="col-md-2">
                                                <div class="control-group">
                                                    <div class="controls">
                                                    	<label class="control-label">子分类ID </label><font color="red">*</font>
                                                        <input type="text" readonly id="class_id" class="input-large form-control m-b-sm" value="<%=request.getParameter("id")%>">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="control-group">
                                                    <div class="controls">
                                                    	<label class="control-label">子分类名称 </label><font color="red">*</font>
                                                        <input type="text"  id="class_name" class="input-large form-control m-b-sm" value="<%=request.getParameter("name")%>">
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <div class="control-group">
                                                    <div class="controls">
                                                    	<label class="control-label">备注</label>
                                                        <textarea class="input-large form-control" id="remarks" rows="1" ><%=request.getParameter("remarks")%></textarea>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="control-group">
                                                    <div class="controls">
                                                    	<div class="row m-t-lg">
				                                            <div class="col-md-12">
				                                                <a id="rec"><button id="recButton" class="btn btn-warning" >修改</button></a>
				                                                <a id="del"><button id="delButton" class="btn btn-danger" >删除</button></a>
				                                            </div>
                                       				</div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row m-t-lg">
                                            <div class="col-md-12">
                                                <pre id='toastrOptions'>请完成所有带红色星号的内容，以保证数据的完整性。</pre>
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
                <!-- Sweet Alert Js  -->
        <script src="/commodity_manage_system/assets/plugins/sweetalert2/sweetalert2.min.js"></script>
        <script src="/commodity_manage_system/assets/js/pages/jquery.sweet-alert.init.js"></script>
        <script>

		$(document).ready(function() {
			 $("#rec").click(function(){
				 $("#recButton").attr('disabled',"true");
		          //得到input的值
		        var class_name = $('#class_name').val();
	        	var remarks = $('#remarks').val();
	        	var id = $('#class_id').val();
	        	if(class_name = ''){
	        		alert("子分类名称不能为空");
	        		return false;
	        	}
		          //设置linkToCart的href的值
		          $.ajax({
               url:"/commodity_manage_system/recSe_Classification",
               data:{
               	"se_cat.se_class_name":class_name,
               	"se_cat.id":id,
               	"se_cat.remarks":remarks,
               	},
               type:"post",
               success:function(data){
               	if(data > 0){
               		alert("操作成功");
               		 window.location.href='/commodity_manage_system/listSe_Classification';
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
		    	var class_name = $('#class_name').val();
		        var remarks = $('#remarks').val();
		        var id = $('#class_id').val();
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
		                       url: "/commodity_manage_system/delSe_Classification",
		                       data:{
		                         	"se_cat.se_class_name":class_name,
		                         	"se_cat.id":id,
		                         	"se_cat.remarks":remarks,
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
		                               	window.location.href='/commodity_manage_system/listSe_Classification';
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