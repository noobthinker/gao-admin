<!-- 投保人 -->
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
                <a class="dropdown-item" href="/admin/id/edit/${data.first.id}">编辑</a>
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
                <!-- Card Body -->
                <tr>
                    <td colspan="2">${data.first.realName!}</td>
                    <td colspan="2">${(data.first.sex==1)?string("男","女")}</td>
                    <td colspan="2">${data.first.birthDay!}</td>
                </tr>
                <tr>
                    <td colspan="2">手机号码</td>
                    <td colspan="2">证件类型</td>
                    <td colspan="2">证件号</td>
                </tr>
                <tr>
                    <td colspan="2">${data.first.mobile!}</td>
                    <td colspan="2">${data.first.paperType!}</td>
                    <td colspan="2">${data.first.paper!}</td>
                </tr>
                <tr>
                    <td colspan="3">客户来源</td>
                    <td colspan="3">证件有效期</td>
                </tr>
                <tr>
                    <td colspan="3">${data.first.customerSource!}</td>
                    <td colspan="3">${data.first.paperAge!}</td>
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
                <a class="dropdown-item" href="/admin/id/edit/${data.first.id}">编辑</a>
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
                    <td colspan="2">${data.order.orderPeople!}</td>
                    <td>${data.order.orderTime!}</td>
                    <td>${data.order.orderStartTime!}</td>
                    <td>${data.order.orderType!}</td>
                    <td>${data.order.orderMoney!}</td>
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
                    <td>${data.order.orderYearFee!}</td>
                    <td>${data.order.feeTimes!}</td>
                    <td>${data.order.feeTimesLeft!}</td>
                    <td>${data.order.orderFinishTime!}</td>
                    <td colspan="2">${data.order.feeAddress!}</td>
                </tr>
                </tr>
                <tr>
                    <td colspan="3">开户行</td>
                    <td colspan="3">银行帐号</td>
                </tr>
                <tr>
                    <td colspan="3">${data.order.bankName!}</td>
                    <td colspan="3">${data.order.bankNumber!}</td>
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
                <a class="dropdown-item" href="/admin/id/edit/${data.first.id}">编辑</a>
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
                    <td colspan="2">${data.two.realName!}</td>
                    <td colspan="2">${(data.two.sex==1)?string("男","女")}</td>
                    <td colspan="2">${data.two.birthDay!}</td>
                </tr>
                <tr>
                    <td colspan="2">手机号码</td>
                    <td colspan="2">证件类型</td>
                    <td colspan="2">证件号</td>
                </tr>
                <tr>
                <tr>
                    <td colspan="2">${data.two.mobile!}</td>
                    <td colspan="2">${data.two.paperType!}
                    </td>
                    <td colspan="2">${data.two.paper!}</td>
                </tr>
                </tr>
                <tr>
                    <td colspan="3">住址</td>
                    <td colspan="3">证件有效期</td>
                </tr>
                <tr>
                    <td colspan="3">${data.two.address!}</td>
                    <td colspan="3">${data.two.paperAge!}</td>
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
                <a class="dropdown-item" href="/admin/id/edit/${data.first.id}">编辑</a>
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
                    <td colspan="2">${data.three.realName!}</td>
                    <td colspan="2">${(data.three.sex==1)?string("男","女")}</td>
                    <td colspan="2">${data.three.birthDay!}</td>
                </tr>
                <tr>
                    <td colspan="2">手机号码</td>
                    <td colspan="2">证件类型</td>
                    <td colspan="2">证件号</td>
                </tr>
                <tr>
                <tr>
                    <td colspan="2">${data.three.mobile!}</td>
                    <td colspan="2">${data.three.paperType!}</td>
                    <td colspan="2">${data.three.paper!}</td>
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
                    <td>${data.three.relationShip!}</td>
                    <td>${data.three.orderType!}</td>
                    <td>${data.three.feeOrder!}</td>
                    <td>${data.three.feeRate!}</td>
                    <td>${data.three.feeOwner!}</td>
                    <td>${data.three.paperAge!}</td>
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
                <a class="dropdown-item" href="/admin/id/edit/${data.first.id}">编辑</a>
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
                    <td colspan="2">${data.four.realName!}</td>
                    <td colspan="2">${(data.four.sex==1)?string("男","女")}</td>
                    <td colspan="2">${data.four.birthDay!}</td>
                </tr>
                <tr>
                    <td colspan="2">手机号码</td>
                    <td colspan="2">证件类型</td>
                    <td colspan="2">证件号</td>
                </tr>
                <tr>
                <tr>
                    <td colspan="2">${data.four.mobile!}</td>
                    <td colspan="2">${data.four.paperType!}</td>
                    <td colspan="2">${data.four.paper!}</td>
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
                    <td>${data.four.relationShip!}</td>
                    <td>${data.four.orderType!}</td>
                    <td>${data.four.feeOrder!}</td>
                    <td>${data.four.feeRate!}</td>
                    <td>${data.four.feeOwner!}</td>
                    <td>${data.four.paperAge!}</td>
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
                <a class="dropdown-item" href="/admin/id/edit/${data.first.id}">编辑</a>
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
                    <td colspan="2">${data.five.realName!}</td>
                    <td colspan="2">${(data.five.sex==1)?string("男","女")}</td>
                    <td colspan="2">${data.five.birthDay!}</td>
                </tr>
                <tr>
                    <td colspan="2">手机号码</td>
                    <td colspan="2">证件类型</td>
                    <td colspan="2">证件号</td>
                </tr>
                <tr>
                <tr>
                    <td colspan="2">${data.five.mobile!}</td>
                    <td colspan="2">${data.five.paperType!}</td>
                    <td colspan="2">${data.five.paper!}</td>
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
                    <td>${data.five.relationShip!}</td>
                    <td>${data.five.orderType!}</td>
                    <td>${data.five.feeOrder!}</td>
                    <td>${data.five.feeRate!}</td>
                    <td>${data.five.feeOwner!}</td>
                    <td>${data.five.paperAge!}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>


