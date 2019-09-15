package com.xkorey.gyh.admin.dto;

import com.xkorey.gyh.admin.model.RkCalls;
import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
public class CallDto {

    private RkCalls calls;
    @NotNull
    private Long sourceId;

    private String token;


}
