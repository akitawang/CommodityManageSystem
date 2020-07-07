<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
        <title>重置密码</title>

        <!-- Styles -->
        <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/plugins/icomoon/style.css" rel="stylesheet">
        <link href="assets/plugins/uniform/css/default.css" rel="stylesheet"/>
        <link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet"/>
         
        <!-- Theme Styles -->
        <link href="assets/css/ecaps.min.css" rel="stylesheet">
        <link href="assets/css/custom.css" rel="stylesheet">
		
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <%  
        	String id = request.getParameter("uid");
        %>
        <!-- Page Container -->
        <div class="page-container">
                <!-- Page Inner -->
                <div class="page-inner login-page">
                    <div id="main-wrapper" class="container-fluid">
                        <div class="row">
                        <div id="container">
        					<div id="output">
                            <div class="col-sm-6 col-md-3 login-box">
                                <h4 class="login-title">重置您的密码</h4>
                                <form  id="resetpass" action="resetpassAdmin" method="post" >
                                	<div class="form-group">
                                        <label for="exampleInputEmail1">您的ID</label>
                                        <input   class="form-control" readonly value="<%=id%>" name="admin.id" id="user_id" >
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">请输入新密码</label>
                                        <input type="password" class="form-control"  name="admin.userpass" id="user_pass" >
                                    </div>
                                    
                                     
                                    <button type="submit" id="submitButton" class="btn btn-primary">下一步</button>
                                    <a href="login.jsp" class="btn btn-default">取消</a>
                                </form>
                            </div>
                        </div>
                    </div>
            </div><!-- /Page Content -->
        </div><!-- /Page Container -->
        </div>
        </div>
        
        <!-- Javascripts -->
        <script src="assets/plugins/jquery/jquery-3.1.0.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/uniform/js/jquery.uniform.standalone.js"></script>
        <script src="assets/plugins/switchery/switchery.min.js"></script>
        <script src="assets/js/ecaps.min.js"></script>
         
    </body>
		<script>
		
   			 $(document).ready(function(){
    	        $("#resetpass").submit(function(e){ 
    	        	var id = $('#user_id').val();
    	        	
    	        	var vp = $('#user_pass').val();
    	    		 
    	    		
    	    		if(vp == ''){
    	    			alert("请您提交前先输入新密码！");
    	    			return false;
    	    		}
    	    		 
    	    		 
    	    		else{
    	        	$("#submitButton").attr('disabled',"true");
    	        	$.ajax({
    	                url:$("#resetpass").attr("action"),
    	                data:$('#resetpass').serialize(),
    	                type:"post",
    	                async:true,//一定要是同步请求，否则会跳转；（ajax默认是异步的）
    	                success:function(data){
    	                	if(data > 0){
    	                		window.location.href='/myssh/reset_success.jsp';
    	                	}
    	                	else{
    	                		window.location.href='/myssh/reset_systemfault.jsp';
    	                	}
    	                	$("#submitButton").removeAttr("disabled");
    	                },
    	                error:function(data){
    	                	alert("操作异常(请将以下内容截取给服务供应商以排除错误)："  + data.responseText);
    	                	$("#submitButton").removeAttr("disabled");
    	                }
    	            }); 
    	        	return false;
    	    	   }
    	        });
    	    });
    </script>
</html>