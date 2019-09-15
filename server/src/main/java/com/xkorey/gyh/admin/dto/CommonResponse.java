package com.xkorey.gyh.admin.dto;

import lombok.Data;

@Data
public class CommonResponse<T> {

    private String msg;
    private Integer code;
    private T data;

    public static <T> CommonResponse<T> success(T data){
        CommonResponse response = new CommonResponse();
        response.setCode(200);
        response.setMsg("成功");
        response.setData(data);
        return response;
    }

    public static CommonResponse error(){
        CommonResponse response = new CommonResponse();
        response.setCode(500);
        response.setMsg("error");
        return response;
    }

    public static CommonResponse error(String msg){
        CommonResponse response = new CommonResponse();
        response.setCode(500);
        response.setMsg(msg);
        return response;
    }

}
