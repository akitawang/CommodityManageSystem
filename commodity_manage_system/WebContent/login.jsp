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
        <title>登录系统</title>

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
                        <div id="container">
        					<div id="output">
                            <div class="col-sm-6 col-md-3 login-box">
                                <h4 class="login-title">登录您的账户</h4>
                                <form  id="login" action="logAdmin" method="post" >
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">用户名</label>
                                        <input   class="form-control" name="admin.useraccount" id="login_admin">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">密码</label>
                                        <input type="password" class="form-control" name="admin.userpass" id="login_pass">
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="customCheck1">
                                        <label class="custom-control-label" for="customCheck1">记住我</label>
                                    </div>
                                    <button type="submit" id="submitButton" class="btn btn-primary">登录</button>
                                    <a href=" " disabled class="btn btn-default">注册</a><br>
                                    <a href="findpass.jsp" class="forgot-link">忘记密码？</a>
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
	    
		//记住用户名密码
		var user = document.getElementById('login_admin'),
	      pass = document.getElementById('login_pass'),
	      check = document.getElementById('customCheck1'),
	      localUser = localStorage.getItem('user') || ''; //获取到user的值并保存
	      localPass = localStorage.getItem('pass') || ''; //获取到pwd的值并保存
	      user.value = localUser;
	      pass.value = localPass;
	      if (localUser !== '' && localPass !== '') {
	        check.setAttribute('checked', '');
	      }

	    function fn() {
	      if (check.checked) {
	        localStorage.setItem('user', user.value);
	        localStorage.setItem('pass', pass.value);
	      } else {
	        localStorage.setItem('user', '');
	        localStorage.setItem('pass', '');
	      }
	    }

		 
		</script>
		<script>
    $(document).ready(function(){
    	        $("#login").submit(function(e){
    	        	var vaccount = $('#login_admin').val();
    	    		var vpass = $('#login_pass').val();
    	    		if(vaccount == ''){
    	    			alert("请您提交前先输入用户名！");
    	    			return false;
    	    		}
    	    		else if(vpass == ''){
    	    			alert("请您提交前先输入密码！");
    	    			return false;
    	    		}
    	    		
    	    		else{
    	        	$("#submitButton").attr('disabled',"true");
    	        	$.ajax({
    	                url:$("#login").attr("action"),
    	                data:$('#login').serialize(),
    	                type:"post",
    	                async:true,//一定要是同步请求，否则会跳转；（ajax默认是异步的）
    	                success:function(data){
    	                	if(data > 0){
    	                		window.location.href='/commodity_manage_system/nms_back/index.jsp';
    	                	}
    	                	else{
    	                		alert("用户名或密码错误！");
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