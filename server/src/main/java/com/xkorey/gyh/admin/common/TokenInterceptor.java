package com.xkorey.gyh.admin.common;

import cn.hutool.core.util.IdUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.validation.support.BindingAwareModelMap;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
@Slf4j
public class TokenInterceptor implements HandlerInterceptor {

    @Value("${id.worker.node:1}")
    Integer workNode;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = response.getHeader("token");
        if(StringUtils.isNotEmpty(token)){
            CommonParam.tokenLocal.set(token);
        }else{
            request.setAttribute("token",IdUtil.getSnowflake(workNode,workNode).nextIdStr());
        }
        return true;
    }


    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception  {
        String token = CommonParam.tokenLocal.get();
        if(StringUtils.isEmpty(token)){
            token = IdUtil.getSnowflake(workNode,workNode).nextIdStr();
        }
        log.info("token {}",token);
        response.setHeader("token", token);
//        request.setAttribute("token",token);
//        RequestContextHolder.currentRequestAttributes().setAttribute("token",token,0);
        if(StringUtils.isNotEmpty(CommonParam.tokenLocal.get())){
            CommonParam.tokenLocal.remove();
        }
    }

}


