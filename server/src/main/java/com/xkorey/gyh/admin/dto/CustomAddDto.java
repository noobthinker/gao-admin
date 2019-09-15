package com.xkorey.gyh.admin.dto;

import com.xkorey.gyh.admin.model.RkCustomer;
import com.xkorey.gyh.admin.model.RkOrder;
import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
public class CustomAddDto {

    @NotNull(message = "投保人不能空")
    RkCustomer source;

    RkOrder order;

    RkCustomer protect;

    RkCustomer good1,good2,good3;

    private String token;


}
