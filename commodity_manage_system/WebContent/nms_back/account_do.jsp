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
                                                    
                                                    	<label class="control-label">用户id </label><font color="red">*</font>
                                                        <input type="text"  id="userid" readonly class="input-large form-control m-b-sm"  value="<%=request.getParameter("id")%>">
                                                        
                                                    	<label class="control-label">用户名 </label><font color="red">*</font>
                                                        <input type="text"  name = "admin.useraccount" id="useraccount" class="input-large form-control m-b-sm"value="<%=request.getParameter("useraccount")%>">
                                                   		
                                                   		<label class="control-label">密码 </label><font color="red">*</font>
                                                        <input type="password" name = "admin.userpass" id="userpass" class="input-large form-control m-b-sm" value="<%=request.getParameter("userpass")%>">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="control-group">
                                                   <div class="controls">
                                                    	<label class="control-label">员工姓名 </label>
                                                        <input type="text" name = "admin.username" id="username" class="input-large form-control m-b-sm" value="<%=request.getParameter("username")%>">
                                                    
                                                    	<label class="control-label">员工联系方式 </label>
                                                        <input type="text" name = "admin.userphone" id="userphone" class="input-large form-control m-b-sm" value="<%=request.getParameter("userphone")%>">
                                                   
                                                    	<label class="control-label">员工邮箱 </label><font color="red">*</font>
                                                        <input type="text" name = "admin.useremail" id="useremail" class="input-large form-control m-b-sm" value="<%=request.getParameter("useremail")%>">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="control-group">
                                                    <div class="controls">
                                                    	<label class="control-label">员工身份证号 </label>
                                                        <input type="text" name = "admin.per_certification" id="per_certification" class="input-large form-control m-b-sm" value="<%=request.getParameter("per_certification")%>">
                                                        
                                                        <label class="control-label">账户类型 </label>
                                                        <select  class="form-control"  name = "admin.usertype" id="usertype">
                                                        <option value="<%=request.getParameter("usertype")%>"><%=request.getParameter("usertype")%></option>
                                                        <option value="manageman">管理员</option>
                                                        <option value="salesman">售货员</option>
                                                        </select>
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
        <!-- Sweet Alert Js  -->
        <script src="/commodity_manage_system/assets/plugins/sweetalert2/sweetalert2.min.js"></script>
        <script src="/commodity_manage_system/assets/js/pages/jquery.sweet-alert.init.js"></script>
        <script>
	 
		 $(document).ready(function() {
			 $("#recButton").click(function(){
				 $("#recButton").attr('disabled',"true");
				 	var useraccount = $('#useraccount').val();
		        	var userpass = $('#userpass').val();
		        	var usertype = $('#usertype').val();
		        	var useremail = $('#useremail').val();
		        	var userid = $('#userid').val();
		        	var userphone = $('#userphone').val();
		        	var per_certification = $('#per_certification').val();
		        	var username = $('#username').val();
		    		if(useraccount == ''){
		    			alert("请您提交前先输入用户账户！");
		    			return false;
		    		}
		    		else if(userpass == ''){
		    			alert("请您提交前先输入用户密码！");
		    			return false;
		    		}
		    		else if(usertype == ''){
		    			alert("请您提交前先输入用户类型！");
		    			return false;
		    		}
		    		else if(useremail == ''){
		    			alert("请您提交前先输入用户邮箱！");
		    			return false;
		    		}
		          //设置linkToCart的href的值
		          $.ajax({
               url:"/commodity_manage_system/recAccount",
               data:{
            	"admin.useraccount":useraccount,
               	"admin.userpass":userpass,
               	"admin.usertype":usertype,
               	"admin.useremail":useremail,
               	"admin.id":userid,
               	"admin.userphone":userphone,
               	"admin.per_certification":per_certification,
               	"admin.username":username,
               	},
               type:"post",
               success:function(data){
               	if(data > 0){
               		alert("操作成功");
               		 window.location.href='/commodity_manage_system/listAccount';
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
			 var useraccount = $('#useraccount').val();
	        	var userpass = $('#userpass').val();
	        	var usertype = $('#usertype').val();
	        	var useremail = $('#useremail').val();
	        	var userid = $('#userid').val();
	        	var userphone = $('#userphone').val();
	        	var per_certification = $('#per_certification').val();
	        	var username = $('#username').val();
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
		                       url: "/commodity_manage_system/delAccount",
		                       data:{
		                    	   "admin.useraccount":useraccount,
		                          	"admin.userpass":userpass,
		                          	"admin.usertype":usertype,
		                          	"admin.useremail":useremail,
		                          	"admin.id":userid,
		                          	"admin.userphone":userphone,
		                          	"admin.per_certification":per_certification,
		                          	"admin.username":username,
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
		                               	window.location.href='/commodity_manage_system/listAccount';
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