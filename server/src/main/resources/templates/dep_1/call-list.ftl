
<#if data?? && data.calls??>
    <#list data.calls as call>
        <div class="card shadow mb-4">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">跟踪服务-${data.calls?size-call_index}</h6>
                <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                        <div class="dropdown-header">跟踪:</div>
                        <a class="dropdown-item" href="/admin/add-${data.first.id}-calls.html">新建跟踪</a>
                        <a class="dropdown-item" href="#">添加提醒</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">编辑</a>
                    </div>
                </div>
            </div>
            <!-- Card Body -->
            <div class="card-body">
                [<small>服务类型</small>:${call.serviceType}],
                [<small>态度</small>:${call.manner!}],
                [<small>同意见面</small>:${call.agreeMeet!}],
                [<small>加保意向</small>:${call.agreeOrder!}],
                [<small>下次服务时间</small>:${call.nextServiceTime!}],
                [<small>服务时间</small>:${call.serviceTime!}],
                [<small>跟踪备注</small>:${call.callNote!}],
            </div>
        </div>
    </#list>

<#else >
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
                    <#if data??>
                        <a class="dropdown-item" href="/admin/add-${data.first.id}-calls.html">新建跟踪</a>
                        <#else>
                        <a class="dropdown-item" href="#">新建跟踪</a>
                    </#if>

                    <a class="dropdown-item" href="#">添加提醒</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">编辑</a>
                </div>
            </div>
        </div>
        <!-- Card Body -->
        <div class="card-body">
           暂无跟踪，请添加跟踪
        </div>
    </div>
</#if>