<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${app_name} - 跟踪编辑</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
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
                    <h1 class="h3 mb-0 text-gray-800">跟踪服务记录</h1>
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
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">任务提醒
                                        </div>
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
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">客户总数
                                        </div>
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
                                                    <div class="progress-bar bg-info" role="progressbar"
                                                         style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                         aria-valuemax="100"></div>
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
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">服务次数
                                        </div>
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
                                <h6 class="m-0 font-weight-bold textnow-primary">跟踪服务记录表</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                         aria-labelledby="dropdownMenuLink">
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
                                            <td colspan="2">服务时间</td>
                                            <td colspan="2">服务类型</td>
                                            <td colspan="2">跟踪次数</td>

                                        </tr>
                                        <tr>
                                            <td colspan="2"><input value="${now?datetime}" id="serviceTime"
                                                                   class="form-control bg-light border-1 small"
                                                                   type="text"></td>
                                            <td colspan="2">
                                                <input id="serviceType" class="form-control bg-light border-1 small"
                                                       type="text">
                                            </td>
                                            <td colspan="2">

                                                <#if data.calls??>
                                                    <input value="${data.calls?size+1}" id="callTimes"
                                                           class="form-control bg-light border-1 small" type="text">
                                                <#else>
                                                    <input value="1" id="callTimes"
                                                           class="form-control bg-light border-1 small" type="text">
                                                </#if>


                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">随手礼</td>
                                            <td colspan="2">加保意向</td>
                                            <td colspan="2">同意转介绍</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input id="gift"
                                                                   class="form-control bg-light border-1 small"
                                                                   type="text"></td>
                                            <td colspan="2">
                                                <input id="agreeOrder" class="form-control bg-light border-1 small"
                                                       type="text">
                                            </td>
                                            <td colspan="2"><input id="agreeSuggest"
                                                                   class="form-control bg-light border-1 small"
                                                                   type="text"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">态度</td>
                                            <td colspan="2">下次服务时间</td>
                                            <td>同意见面</td>
                                            <td>同意加微信</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input id="manner"
                                                                   class="form-control bg-light border-1 small"
                                                                   type="text"></td>
                                            <td colspan="2">
                                                <input value="${now?datetime}" id="nextServiceTime"
                                                       class="form-control bg-light border-1 small" type="text">
                                            </td>
                                            <td><input id="agreeMeet" class="form-control bg-light border-1 small"
                                                       type="text"></td>
                                            <td><input id="agreeWx" class="form-control bg-light border-1 small"
                                                       type="text"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">跟踪备注</td>
                                        </tr>
                                        <tr>
                                            <td colspan="6"><input id="callNote"
                                                                   class="form-control bg-light border-1 small"
                                                                   type="text"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <#include "dep_1/comm-show.ftl" />


                    </div>

                    <!-- 服务跟踪 -->
                    <div class="col-xl-4 col-lg-5 container" id="track">
                      <#include "dep_1/call-list.ftl" />
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
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
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

<input type="hidden" id="cid">

<!-- Bootstrap core JavaScript-->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/v/publicendor/jquery-easing/jquery.easing.min.js"></script>

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
    var token = "${token}";
    function save() {

        var data =
            {
                "calls": {
                    "serviceTime": $("#serviceTime").val(),
                    "serviceType": $("#serviceType").val(),
                    "callTimes": $("#callTimes").val(),
                    "gift": $("#gift").val(),
                    "agreeOrder": $("#agreeOrder").val(),
                    "agreeSuggest": $("#agreeSuggest").val(),
                    "manner": $("#manner").val(),
                    "nextServiceTime": $("#nextServiceTime").val(),
                    "agreeMeet": $("#agreeMeet").val(),
                    "agreeWx": $("#agreeWx").val(),
                    "callNote": $("#callNote").val(),
                    "id": $("#cid").val()
                },
                "sourceId":${data.first.id},
                "token":token
            }

        $.ajax({
            type: "post",
            url: "/admin/call-add-submit.html?q=" + Math.random(),
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (d) {
                if (d.code) {
                    $("#a-ok-t").text("error");
                    $("#a-ok-b").text(d.msg)
                } else {
                    $("#a-ok-t").text("添加成功");
                    $("#a-ok-b").text("数据已录入成功");
                    $("#cid").val(d);
                    token+=d;
                }
                $("#addOk").modal();
            }
        });

    }


</script>
</body>

</html>
