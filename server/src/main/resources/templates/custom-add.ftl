<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${app_name} - 客户编辑</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="/css/select2.min.css" type="text/css">
    <!-- Custom styles for this template-->
    <link href="/css/select2.min.css" type="text/css" rel="stylesheet" type="text/css">

    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <#include "dep_1/left.ftl"/>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <#include "dep_1/head.ftl" />
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">客户相关信息编辑</h1>
                    <a href="#" onclick="save()" class="d-sm-inlineDashboard-block btn btn-sm btn-primary shadow-sm">
                        <i class="fas fa-save fa-sm text-white-50"></i>保存</a>
                </div>

                <!-- Content Row -->
                <div class="row">

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">任务提醒</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">${schedule}</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">客户总数</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">${customer}</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">任务进度</div>
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                            </div>
                                            <div class="col">
                                                <div class="progress progress-sm mr-2">
                                                    <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pending Requests Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">服务次数</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">${calls}</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-comments fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Content Row -->

                <div class="row">

                    <!-- 投保人 -->
                    <div class="col-xl-8 col-lg-7">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">投保人信息</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">选择你的操作:</div>
                                        <a class="dropdown-item" href="#">编辑</a>
                                        <a class="dropdown-item" href="#">查看</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">添加提醒</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <tbody>
                                        <tr>
                                            <td colspan="2">姓名</td>
                                            <td colspan="2">性别</td>
                                            <td colspan="2">生日</td>

                                        </tr>
                                        <tr>
                                            <td colspan="2"><input id="s-name" class="form-control bg-light border-1 small" type="text"></td>
                                            <td colspan="2">
                                                <select id="s-sex" class="form-control bg-light border-1 small" type="text">
                                                    <option value="1">男</option>
                                                    <option value="0">女</option>
                                                </select>
                                            </td>
                                            <td colspan="2"><input id="s-birth" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">手机号码</td>
                                            <td colspan="2">证件类型</td>
                                            <td colspan="2">证件号</td>
                                        </tr>
                                        <tr>
                                        <tr>
                                            <td colspan="2"><input id="s-phone" class="form-control bg-light border-1 small" type="text"></td>
                                            <td colspan="2">
                                                <select id="s-pageType" class="form-control bg-light border-1 small" type="text">
                                                    <option value="身份证">身份证</option>
                                                    <option value="港澳通行证">港澳通行证</option>
                                                    <option value="户口簿">户口簿</option>
                                                    <option value="护照">护照</option>
                                                </select>
                                            </td>
                                            <td colspan="2"><input id="s-page" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        </tr>
                                        <tr>
                                            <td colspan="3">客户来源</td>
                                            <td colspan="3">证件有效期</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3"><input id="s-source" class="form-control bg-light border-1 small" type="text"></td>
                                            <td colspan="3"><input id="s-age" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- 保单 -->
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">保单基本信息</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">选择你的操作:</div>
                                        <a class="dropdown-item" href="#">编辑</a>
                                        <a class="dropdown-item" href="#">查看</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">添加提醒</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <tbody>
                                        <tr>
                                            <td colspan="2">投保人</td>
                                            <td>投保日期</td>
                                            <td>承保日期</td>
                                            <td>险种名称</td>
                                            <td>保额</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input id="o-name" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="o-time" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="o-startTime" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="o-type" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="o-money" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        <tr>
                                            <td>年缴保费</td>
                                            <td>实际交次</td>
                                            <td>剩余交次</td>
                                            <td>最后缴费日</td>
                                            <td colspan="2">缴费地址</td>
                                        </tr>
                                        <tr>
                                        <tr>
                                            <td><input id="o-yearFee" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="o-feeTimes" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="o-leftTimes" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="o-finish" class="form-control bg-light border-1 small" type="text"></td>
                                            <td colspan="2"><input id="o-address" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        </tr>
                                        <tr>
                                            <td colspan="3">开户行</td>
                                            <td colspan="3">银行帐号</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3"><input id="o-bankName" class="form-control bg-light border-1 small" type="text"></td>
                                            <td colspan="3"><input id="o-bankNum" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <#--被保人-->
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">被保人信息</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">选择你的操作:</div>
                                        <a class="dropdown-item" href="#">编辑</a>
                                        <a class="dropdown-item" href="#">查看</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">添加提醒</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <tbody>
                                        <tr>
                                            <td colspan="2">姓名</td>
                                            <td colspan="2">性别</td>
                                            <td colspan="2">生日</td>

                                        </tr>
                                        <tr>
                                            <td colspan="2"><input id="p-name" class="form-control bg-light border-1 small" type="text"></td>
                                            <td colspan="2">
                                                <select id="p-sex" class="form-control bg-light border-1 small" type="text">
                                                    <option value="1">男</option>
                                                    <option value="0">女</option>
                                                </select>
                                            </td>
                                            <td colspan="2"><input id="p-birth" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">手机号码</td>
                                            <td colspan="2">证件类型</td>
                                            <td colspan="2">证件号</td>
                                        </tr>
                                        <tr>
                                        <tr>
                                            <td colspan="2"><input id="p-phone" class="form-control bg-light border-1 small" type="text"></td>
                                            <td colspan="2">
                                                <select id="p-pageType" class="form-control bg-light border-1 small" type="text">
                                                    <option value="身份证">身份证</option>
                                                    <option value="港澳通行证">港澳通行证</option>
                                                    <option value="户口簿">户口簿</option>
                                                    <option value="护照">护照</option>
                                                </select>
                                            </td>
                                            <td colspan="2"><input id="p-page" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        </tr>
                                        <tr>
                                            <td colspan="3">住址</td>
                                            <td colspan="3">证件有效期</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3"><input id="p-address" class="form-control bg-light border-1 small" type="text"></td>
                                            <td colspan="3"><input id="p-age" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>


                        <!-- 受益人1 -->
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">受益人一</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">选择你的操作:</div>
                                        <a class="dropdown-item" href="#">编辑</a>
                                        <a class="dropdown-item" href="#">查看</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">添加提醒</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <tbody>
                                        <tr>
                                            <td colspan="2">姓名</td>
                                            <td colspan="2">性别</td>
                                            <td colspan="2">生日</td>

                                        </tr>
                                        <tr>
                                            <td colspan="2"><input id="g1-name" class="form-control bg-light border-1 small" type="text"></td>
                                            <td colspan="2">
                                                <select id="g1-sex" class="form-control bg-light border-1 small" type="text">
                                                    <option value="1">男</option>
                                                    <option value="0">女</option>
                                                </select>
                                            </td>
                                            <td colspan="2"><input id="g1-birth" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">手机号码</td>
                                            <td colspan="2">证件类型</td>
                                            <td colspan="2">证件号</td>
                                        </tr>
                                        <tr>
                                        <tr>
                                            <td colspan="2"><input id="g1-phone" class="form-control bg-light border-1 small" type="text"></td>
                                            <td colspan="2">
                                                <select id="g1-pageType" class="form-control bg-light border-1 small" type="text">
                                                    <option value="身份证">身份证</option>
                                                    <option value="港澳通行证">港澳通行证</option>
                                                    <option value="户口簿">户口簿</option>
                                                    <option value="护照">护照</option>
                                                </select>
                                            </td>
                                            <td colspan="2"><input id="g1-page" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        </tr>
                                        <tr>
                                            <td>关系</td>
                                            <td>类型</td>
                                            <td>受益顺序</td>
                                            <td>受益比例</td>
                                            <td>法定收益人</td>
                                            <td>证件有效期</td>
                                        </tr>
                                        <tr>
                                            <td><input id="g1-gx" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="g1-type" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="g1-order" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="g1-rate" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="g1-lawPerson" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="g1-age" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>


                        <!-- 受益人2 -->
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">受益人二</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">选择你的操作:</div>
                                        <a class="dropdown-item" href="#">编辑</a>
                                        <a class="dropdown-item" href="#">查看</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">添加提醒</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <tbody>
                                        <tr>
                                            <td colspan="2">姓名</td>
                                            <td colspan="2">性别</td>
                                            <td colspan="2">生日</td>

                                        </tr>
                                        <tr>
                                            <td colspan="2"><input id="g2-name" class="form-control bg-light border-1 small" type="text"></td>
                                            <td colspan="2">
                                                <select id="g2-sex" class="form-control bg-light border-1 small" type="text">
                                                    <option value="1">男</option>
                                                    <option value="0">女</option>
                                                </select>
                                            </td>
                                            <td colspan="2"><input id="g2-birth" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">手机号码</td>
                                            <td colspan="2">证件类型</td>
                                            <td colspan="2">证件号</td>
                                        </tr>
                                        <tr>
                                        <tr>
                                            <td colspan="2"><input id="g2-phone" class="form-control bg-light border-1 small" type="text"></td>
                                            <td colspan="2">
                                                <select id="g2-pageType" class="form-control bg-light border-1 small" type="text">
                                                    <option value="身份证">身份证</option>
                                                    <option value="港澳通行证">港澳通行证</option>
                                                    <option value="户口簿">户口簿</option>
                                                    <option value="护照">护照</option>
                                                </select></td>
                                            <td colspan="2"><input id="g2-page" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        </tr>
                                        <tr>
                                            <td>关系</td>
                                            <td>类型</td>
                                            <td>受益顺序</td>
                                            <td>受益比例</td>
                                            <td>法定收益人</td>
                                            <td>证件有效期</td>
                                        </tr>
                                        <tr>
                                            <td><input id="g2-gx" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="g2-type" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="g2-order" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="g2-rate" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="g2-lawPerson" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="g2-age" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- 受益人3 -->
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">受益人三</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">选择你的操作:</div>
                                        <a class="dropdown-item" href="#">编辑</a>
                                        <a class="dropdown-item" href="#">查看</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">添加提醒</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <tbody>
                                        <tr>
                                            <td colspan="2">姓名</td>
                                            <td colspan="2">性别</td>
                                            <td colspan="2">生日</td>

                                        </tr>
                                        <tr>
                                            <td colspan="2"><input id="g3-name" class="form-control bg-light border-1 small" type="text"></td>
                                            <td colspan="2">
                                                <select id="g3-sex" class="form-control bg-light border-1 small" type="text">
                                                    <option value="1">男</option>
                                                    <option value="0">女</option>
                                                </select>
                                            </td>
                                            <td colspan="2"><input id="g3-birth" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">手机号码</td>
                                            <td colspan="2">证件类型</td>
                                            <td colspan="2">证件号</td>
                                        </tr>
                                        <tr>
                                        <tr>
                                            <td colspan="2"><input id="g3-phone" class="form-control bg-light border-1 small" type="text"></td>
                                            <td colspan="2">
                                                <select id="g3-pageType" class="form-control bg-light border-1 small" type="text">
                                                    <option value="身份证">身份证</option>
                                                    <option value="港澳通行证">港澳通行证</option>
                                                    <option value="户口簿">户口簿</option>
                                                    <option value="护照">护照</option>
                                                </select>
                                            </td>
                                            <td colspan="2"><input id="g3-page" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        </tr>
                                        <tr>
                                            <td>关系</td>
                                            <td>类型</td>
                                            <td>受益顺序</td>
                                            <td>受益比例</td>
                                            <td>法定收益人</td>
                                            <td>证件有效期</td>
                                        </tr>
                                        <tr>
                                            <td><input id="g3-gx" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="g3-type" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="g3-order" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="g3-rate" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="g3-lawPerson" class="form-control bg-light border-1 small" type="text"></td>
                                            <td><input id="g3-age" class="form-control bg-light border-1 small" type="text"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- 服务跟踪 -->
                    <div class="col-xl-4 col-lg-5 container" id="track">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">跟踪服务</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">跟踪:</div>
                                        <a class="dropdown-item" href="#">新建跟踪</a>
                                        <a class="dropdown-item" href="#">添加提醒</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">编辑</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                暂无跟踪
                            </div>
                        </div>
                    </div>
                </div>



            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <#include "dep_1/footer.ftl"/>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>

</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">退出系统</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">是否要注销、注销后需要输入用户名和密码才可以登录系统</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">知道了</button>
                <a class="btn btn-primary" href="#">OK</a>
            </div>
        </div>
    </div>
</div>


<div class="modal" id="addOk" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="a-ok-t">退出系统</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body" id="a-ok-b">是否要注销、注销后需要输入用户名和密码才可以登录系统</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">知道了</button>
                <a class="btn btn-primary" href="login.html">OK</a>
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="sid">
<input type="hidden" id="oid">
<input type="hidden" id="pid">
<input type="hidden" id="g1id">
<input type="hidden" id="g2id">
<input type="hidden" id="g3id">

<!-- Bootstrap core JavaScript-->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/vendor/chart.js/Chart.min.js"></script>

<script src="/js/jquery.pin.js"></script>

<script src="/js/select2.js"></script>
<script src="/js/search.js"></script>

<script>

    // $("#track").pin({
    //     containerSelector: ".container"
    // });
    var token="${token}";
    function save() {
        // source
        var source ={
            "realName":$("#s-name").val(),
            "sex":$("#s-sex").val(),
            "birthDay":$("#s-birth").val(),
            "mobile":$("#s-phone").val(),
            "paperType":$("#s-pageType").val(),
            "paper":$("#s-page").val(),
            "customerSource":$("#s-source").val(),
            "paperAge":$("#s-age").val()
        };
        //order
        var order = {
            "orderPeople":$("#o-name").val(),
            "orderTime":$("#o-time").val(),
            "orderType":$("#o-type").val(),
            "orderStartTime":$("#o-startTime").val(),
            "orderMoney":$("#o-money").val(),
            "orderYearFee":$("#o-yearFee").val(),
            "feeTimes":$("#o-feeTimes").val(),
            "feeTimesLeft":$("#o-leftTimes").val(),
            "orderFinishTime":$("#o-finish").val(),
            "feeAddress":$("#o-address").val(),
            "bankName":$("#o-bankName").val(),
            "bankNumber":$("#o-bankNum").val()
        };
        //protect
        var protect= {
            "realName":$("#p-name").val(),
            "sex":$("#p-sex").val(),
            "birthDay":$("#p-birth").val(),
            "mobile":$("#p-phone").val(),
            "paperType":$("#p-pageType").val(),
            "paper":$("#p-page").val(),
            "address":$("#p-address").val(),
            "paperAge":$("#p-age").val()
        };
        //goo1
        var good1 = {
            "realName":$("#g1-name").val(),
            "sex":$("#g1-sex").val(),
            "birthDay":$("#g1-birth").val(),
            "mobile":$("#g1-phone").val(),
            "paperType":$("#g1-pageType").val(),
            "paper":$("#g1-page").val(),
            "relationShip":$("#g1-gx").val(),
            "feeOrder":$("#g1-order").val(),
            "feeRate":$("#g1-rate").val(),
            "feeOwner":$("#g1-lawPerson").val(),
            "orderType":$("#g1-type").val(),
            "paperAge":$("#g1-age").val()
        };
        //good2
        var good2 = {
            "realName":$("#g2-name").val(),
            "sex":$("#g2-sex").val(),
            "birthDay":$("#g2-birth").val(),
            "mobile":$("#g2-phone").val(),
            "paperType":$("#g2-pageType").val(),
            "paper":$("#g2-page").val(),
            "relationShip":$("#g2-gx").val(),
            "feeOrder":$("#g2-order").val(),
            "feeRate":$("#g2-rate").val(),
            "feeOwner":$("#g2-lawPerson").val(),
            "orderType":$("#g2-type").val(),
            "paperAge":$("#g2-age").val()
        };
        //good3
        var good3 = {
            "realName":$("#g3-name").val(),
            "sex":$("#g3-sex").val(),
            "birthDay":$("#g3-birth").val(),
            "mobile":$("#g3-phone").val(),
            "paperType":$("#g3-pageType").val(),
            "paper":$("#g3-page").val(),
            "relationShip":$("#g3-gx").val(),
            "feeOrder":$("#g3-order").val(),
            "feeRate":$("#g3-rate").val(),
            "feeOwner":$("#g3-lawPerson").val(),
            "orderType":$("#g3-type").val(),
            "paperAge":$("#g3-age").val()
        };

        var data = {
            "source":source,
            "order":order,
            "protect":protect,
            "good1":good1,
            "good2":good2,
            "good3":good3
        }
        var _id1 = $("#sid").val();
        var _id2 = $("#oid").val();
        var _id3 = $("#pid").val();
        var _id4 = $("#g1id").val();
        var _id5 = $("#g2id").val();
        var _id6 = $("#g3id").val();

        data.source.id=_id1;
        data.protect.id=_id3;
        data.order.id=_id2;
        data.good1.id=_id4;
        data.good2.id=_id5;
        data.good3.id=_id6;
        data.token=token;

        $.ajax({
            type: "post",
            url: "/admin/custom-add-submit.html?q="+Math.random(),
            contentType : "application/json",
            data: JSON.stringify(data),
            success: function (d) {
                if(d.code){
                    $("#a-ok-t").text("error");
                    $("#a-ok-b").text(d.msg)
                }else{
                    $("#a-ok-t").text("添加成功");
                    $("#a-ok-b").text("客户数据已录入成功");
                    $("#sid").val(d.customeId);
                    $("#oid").val(d.orderId);
                    $("#pid").val(d.protectId);
                    $("#g1id").val(d.good1Id);
                    $("#g2id").val(d.good2Id);
                    $("#g3id").val(d.good3Id);
                    token+=d.customeId;
                }
                $("#addOk").modal();
            }
        });

    }




</script>
</body>

</html>
