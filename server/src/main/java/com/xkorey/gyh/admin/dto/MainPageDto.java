package com.xkorey.gyh.admin.dto;

import com.xkorey.gyh.admin.model.RkCalls;
import com.xkorey.gyh.admin.model.RkCustomer;
import com.xkorey.gyh.admin.model.RkOrder;
import com.xkorey.gyh.admin.model.RkSchedule;
import lombok.Data;

import java.util.List;

@Data
public class MainPageDto {

    //
    List<RkSchedule> todyNotice;

    // random info
    RkCustomer first;
    RkOrder order;
    RkCustomer two;
    RkCustomer three;
    RkCustomer four;
    RkCustomer five;

    List<RkCalls> calls;

}
