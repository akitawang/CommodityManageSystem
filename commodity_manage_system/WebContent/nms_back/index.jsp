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
                        <h3 class="breadcrumb-header"><%=time %>，<%=user.getUsername() %></h3>
                    </div>
                    <div id="main-wrapper">
                        <div class="row">
                            <div class="col-lg-3 col-md-6">
                                <div class="panel panel-white stats-widget">
                                    <div class="panel-body">
                                        <div class="pull-left">
                                            <span class="stats-number">￥781,876</span>
                                            <p class="stats-info">今日总收入</p>
                                        </div>
                                        
                                        <div class="pull-right">
                                            <i class="icon-arrow_upward stats-icon"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="panel panel-white stats-widget">
                                    <div class="panel-body">
                                        <div class="pull-left">
                                            <span class="stats-number">578,100</span>
                                            <p class="stats-info">今日售卖商品总数</p>
                                        </div>
                                        <div class="pull-right">
                                            <i class="icon-arrow_downward stats-icon"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="panel panel-white stats-widget">
                                    <div class="panel-body">
                                        <div class="pull-left">
                                            <span class="stats-number">+23,356</span>
                                            <p class="stats-info">合计 总收入</p>
                                        </div>
                                        <div class="pull-right">
                                            <i class="icon-arrow_upward stats-icon"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="panel panel-white stats-widget">
                                    <div class="panel-body">
                                        <div class="pull-left">
                                            <span class="stats-number">￥58</span>
                                            <p class="stats-info">合计 售卖商品总数</p>
                                        </div>
                                        <div class="pull-right">
                                            <i class="icon-arrow_upward stats-icon"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- Row -->
                        <div class="row">
                            <div class="col-lg-8 col-md-12">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">Total Revenue</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div id="chart1"><svg></svg></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">Server Status</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="container-fluid">
                                            <div class="server-load row">
                                                <div class="server-stat col-sm-4">
                                                    <p>167GB</p>
                                                    <span>Usage</span>
                                                </div>
                                                <div class="server-stat col-sm-4">
                                                    <p>320GB</p>
                                                    <span>ecaps</span>
                                                </div>
                                                <div class="server-stat col-sm-4">
                                                    <p><%=Runtime.getRuntime().totalMemory() %></p>
                                                    <span>CPU</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="chart2"><svg></svg></div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- Row -->
                        <div class="row">
                            <div class="col-lg-5 col-md-12">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">Tasks</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="task-list">
                                            <div class="task-item">
                                                <span class="task-name">Download 'Alpha' admin template</span>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 80%;">
                                                        <span class="sr-only">80% Complete</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="task-item">
                                                <span class="task-name">Create a new landing page</span>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 10%;">
                                                        <span class="sr-only">10% Complete</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="task-item">
                                                <span class="task-name">Delete inactive users</span>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
                                                        <span class="sr-only">80% Complete</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="task-item">
                                                <span class="task-name">Update NVD3 chart plugin<i class="fa fa-check"></i></span>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                                                        <span class="sr-only">100% Complete</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="task-item">
                                                <span class="task-name">Install 4 new layouts<i class="fa fa-check"></i></span>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                                                        <span class="sr-only">100% Complete</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-12">
                                <div class="panel panel-white">
                                    <div class="panel-heading clearfix">
                                        <h4 class="panel-title">Invoices</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive invoice-table">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">0567</th>
                                                        <td>Kenny Highland</td>
                                                        <td><span class="label label-success">Finished</span></td>
                                                        <td>$427</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">0186</th>
                                                        <td>Darrell Price</td>
                                                        <td>Twitter</td>
                                                        <td><span class="label label-success">Finished</span></td>
                                                        <td>$1714</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">0712</th>
                                                        <td>Richard Lunsford</td>
                                                        <td>Facebook</td>
                                                        <td><span class="label label-danger">Denied</span></td>
                                                        <td>$685</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">0095</th>
                                                        <td>Amy Walker</td>
                                                        <td>Youtube</td>
                                                        <td><span class="label label-warning">Pending</span></td>
                                                        <td>$9900</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">1054</th>
                                                        <td>Kathy Olson</td>
                                                        <td>Youtube</td>
                                                        <td><span class="label label-default">Upcoming</span></td>
                                                        <td>$1250</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">0043</th>
                                                        <td>Susan Mabry</td>
                                                        <td>Instagram</td>
                                                        <td><span class="label label-default">Upcoming</span></td>
                                                        <td>$399</td>
                                                    </tr>
                                                </tbody>
                                            </table>
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
    </body>
</html>