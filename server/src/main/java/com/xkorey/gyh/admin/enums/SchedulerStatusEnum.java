package com.xkorey.gyh.admin.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum SchedulerStatusEnum {

    stop(0,"停止"),
    start(1,"运行中"),
    die(4,"死亡"),
    waiting(3,"等待");

    private Integer status;
    private String desc;

}
