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
        <title></title>

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
        
        <!-- Page Container -->
        <div class="page-container">
                <!-- Page Inner -->
                <div class="page-inner login-page">
                    <div id="main-wrapper" class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6 col-md-3 login-box">
                                <h4 class="login-title">创建一个账户</h4>
                                <form id="register" action="regAdmin" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputFirstName">用户名<font color="red">*</font></label>
                                        <input   name="admin.useraccount"  class="form-control" id="useraccount">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword">密码<font color="red">*</font></label>
                                        <input  name="admin.userpass" type="password" class="form-control" id="userpass">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputLastName">姓名<font color="red">*</font></label>
                                        <input   name="admin.username"  class="form-control" id="username">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail">Email地址<font color="red">*</font></label>
                                        <input  name="admin.useremail" type="email" class="form-control" id="useremail">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail">手机号码<font color="red">*</font></label>
                                        <input name="admin.userphone"  type="number" class="form-control" id="userphone">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword">用户类型<font color="red">*</font></label>
                                        <input   name="admin.usertype"  value="默认普通用户" readonly  class="form-control" id="usertype">
                                    </div>
                                    <button type="submit" id="submitbutton" class="btn btn-primary">注册</button>
                                    <a href="login.jsp" class="btn btn-default">登录</a><br>
                                    <a href="findpass.jsp" class="forgot-link">忘记密码?</a>
                                </form>
                            </div>
                        </div>
                    </div>
            </div><!-- /Page Content -->
        </div><!-- /Page Container -->
        
        
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
    	        $("#register").submit(function(e){
    	        	var vaccount = $('#useraccount').val();
    	    		var vpass = $('#userpass').val();
    	    		var vname = $('#username').val();
    	    		var vemail = $('#useremail').val();
    	    		var vphone = $('#userphone').val();
    	    		var vtype = $('#usertype').val();
    	    		if(vaccount == ''){
    	    			alert("请您提交前先输入用户名！");
    	    			return false;
    	    		}
    	    		else if(vpass == ''){
    	    			alert("请您提交前先输入密码！");
    	    			return false;
    	    		}
    	    		else if(vname == ''){
    	    			alert("请您提交前先输入姓名！");
    	    			return false;
    	    		}
    	    		else if(vemail == ''){
    	    			alert("请您提交前先输入邮箱！");
    	    			return false;
    	    		}
    	    		else if(vphone == ''){
    	    			alert("请您提交前先输入手机！");
    	    			return false;
    	    		}
    	    		else if(vtype == ''){
    	    			alert("请您提交前先输入账户类型！");
    	    			return false;
    	    		}
    	    		else{
    	        	$("#submitButton").attr('disabled',"true");
    	        	$.ajax({
    	                url:$("#register").attr("action"),
    	                data:$('#register').serialize(),
    	                type:"post",
    	                async:true,//一定要是同步请求，否则会跳转；（ajax默认是异步的）
    	                success:function(data){
    	                	if(data > 0){
    	                		alert("操作成功"); 
    	                	}
    	                	else{
    	                		console.log(data);
    	                		alert("操作失败");
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
</html>