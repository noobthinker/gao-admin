package com.xkorey.gyh.admin.dto;

import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

@Data
public class LoginDto {

    @NotNull(message = "用户名不能为空")
    @Email(message = "邮箱格式不正确")
    private String name;

    private String passwd;
}
