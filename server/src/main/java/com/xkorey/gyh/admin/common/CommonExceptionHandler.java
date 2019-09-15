package com.xkorey.gyh.admin.common;

import com.xkorey.gyh.admin.dto.CommonResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.xml.bind.ValidationException;
import java.security.SignatureException;

@ControllerAdvice
@RestControllerAdvice
@Slf4j
public class CommonExceptionHandler {

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public CommonResponse excetpion(Exception e){
        log.error("error",e);
        return CommonResponse.error();
    }

    @ExceptionHandler({ValidationException.class, BindException.class, MethodArgumentNotValidException.class})
    @ResponseBody
    public CommonResponse beanValidateException(Exception e){
        if(e instanceof BindException){
            return CommonResponse.error(((BindException)e).getAllErrors().get(0).getDefaultMessage());
        }
        if(e instanceof MethodArgumentNotValidException){
            return CommonResponse.error(((MethodArgumentNotValidException)e)
                    .getBindingResult()
                    .getAllErrors()
                    .get(0)
                    .getDefaultMessage());
        }
        return CommonResponse.error();
    }

    @ExceptionHandler(AdminException.class)
    @ResponseBody
    public CommonResponse adminExcetion(AdminException e){
        return CommonResponse.error(e.getMessage());
    }


    @ExceptionHandler(SignatureException.class)
    public CommonResponse jwtSignatureException(SignatureException e){
        log.error("key error",e);
        return CommonResponse.error("清空缓存再登录");
    }



}
