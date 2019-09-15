package com.xkorey.gyh.admin.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum DataTypeEnum {

    first("first","投保人"),
    trace("call","电话追踪"),
    order("order","保单"),
    protect("protect","被保人"),
    good1("good1","受益人1"),
    good2("good2","受益人2"),
    good3("good3","受益人3"),
    scheduler_on("on","提醒打开"),
    scheduler_type_people("s_people","自定义提醒"),
    scheduler_type_birth("s_birth","个人生日提醒"),
    scheduler_type_order("s_order","保单"),
    scheduler_type_trace("s_trace","电话跟踪");

    private String name;
    private String desc;

}
