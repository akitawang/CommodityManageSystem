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
                        <h3 class="breadcrumb-header">员工账户管理/Staff Account Manage</h3>
                    </div>
                <div id="main-wrapper">
                    <div class="row">
                        
                            <div class="col-md-12">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">员工账户添加/Add Staff Account</h4>
                                    </div>
                                    <form id="add_staffaccount" action="/commodity_manage_system/regAdmin" method="post" >
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="control-group">
                                                    <div class="controls">
                                                    	<label class="control-label">用户名 </label><font color="red">*</font>
                                                        <input type="text"  name = "admin.useraccount" id="useraccount" class="input-large form-control m-b-sm" placeholder="请输入用户名">
                                                   		
                                                   		<label class="control-label">密码 </label><font color="red">*</font>
                                                        <input type="password" name = "admin.userpass" id="userpass" class="input-large form-control m-b-sm" placeholder="请输入密码">
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="control-group">
                                                    <div class="controls">
                                                    	<label class="control-label">员工姓名 </label>
                                                        <input type="text" name = "admin.username" id="username" class="input-large form-control m-b-sm" placeholder="请输入员工姓名">
                                                    
                                                    	<label class="control-label">员工联系方式 </label>
                                                        <input type="text" name = "admin.userphone" id="userphone" class="input-large form-control m-b-sm" placeholder="请输入员工联系方式">
                                                   
                                                    	<label class="control-label">员工邮箱 </label><font color="red">*</font>
                                                        <input type="text" name = "admin.useremail" id="useremail" class="input-large form-control m-b-sm" placeholder="请输入员工邮箱">
                                                    </div>
                                                </div>
                                            </div>
											<div class="col-md-4">
                                                <div class="control-group">
                                                    <div class="controls">
                                                    	<label class="control-label">员工身份证号 </label>
                                                        <input type="text" name = "admin.per_certification" id="per_certification" class="input-large form-control m-b-sm" placeholder="请输入员工身份证号">
                                                        
                                                        <label class="control-label">账户类型 </label>
                                                        <select  class="form-control" name = "admin.usertype" id="usertype">
                                                        <option value="manageman">管理员</option>
                                                        <option value="salesman">售货员</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                            <div class="col-md-12">
                                                <div class="control-group">
                                                    <div class="controls">
                                                    	<div class="row m-t-lg">
				                                            <div class="col-md-12">
				                                                <button type="submit" id="submitButton" class="btn btn-primary" >提交</button>
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
                               		</form>
                                </div>
                              
                        </div>
                        
                        <!-- list cat -->
                        <div class="col-md-12">
                                <div class="panel panel-white">
                                <div class="panel-heading">
                                    <h4 class="panel-title">员工账户列表/List Staff Account</h4>
                                </div>
                                <div class="panel-body">
                               <div class="table-responsive">
                                   <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                                       <thead>
                                            <tr>
                                                <th style="width: 10%; cellspacing: 0;">id</th>
                                                <th style="width: 25%; cellspacing: 0;">员工账户</th>
                                                <th style="width: 30%; cellspacing: 0;">员工邮箱</th>
                                                <th style="width: 15%; cellspacing: 0;">员工类型</th>
                                                <th style="width: 20%; cellspacing: 0;">操作</th>
                                            </tr>
                                        </thead>
	                                        <s:iterator value="admins" var="p">
												<tr>
													<td style="width: 10%; cellspacing: 0;">${p.id}</td>
													<td style="width: 25%; cellspacing: 0;">${p.useraccount}</td>
													<td style="width: 30%; cellspacing: 0;">${p.useremail}</td>
													<td style="width: 15%; cellspacing: 0;">${p.usertype}</td>
													<td style="width: 20%; cellspacing: 0;">
													<a href="/commodity_manage_system/nms_back/account_do.jsp?useraccount=${p.useraccount}&id=${p.id}&userpass=${p.userpass}&username=${p.username}&userphone=${p.userphone}&useremail=${p.useremail}&usertype=${p.usertype}&per_certification=${p.per_certification}">
													<button class="btn btn-primary" >修改</button>
													</a>
													</td>
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
        <script>

		$(document).ready(function(){
	        $("#add_staffaccount").submit(function(e){
	        	var useraccount = $('#useraccount').val();
	        	var userpass = $('#userpass').val();
	        	var usertype = $('#usertype').val();
	        	var useremail = $('#useremail').val();
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
	    		else{
	        	$("#submitButton").attr('disabled',"true");
	        	$.ajax({
	        		url:$("#add_staffaccount").attr("action"),
	                data: $("#add_staffaccount").serialize(),
	                type:"post",
	                async:true,//一定要是同步请求，否则会跳转；（ajax默认是异步的）
	                success:function(data){
	                	if(data > 0){
	                		alert("添加成功！");
	                		window.location.reload();
	                	}
	                	else{
	                		alert("操作异常！"+data);
	                	}
	                	$("#submitButton").removeAttr("disabled");
	                },
	                error:function(data){
	                	alert("操作异常(请将以下内容截取给服务供应商以排除错误)：" + $("#id").val() + data.responseText);
	                	$("#submitButton").removeAttr("disabled");
	                }
	            });
	        	return false;
	    	   }
	        });
	    });
		
		
        
        </script>
    </body>
</html>