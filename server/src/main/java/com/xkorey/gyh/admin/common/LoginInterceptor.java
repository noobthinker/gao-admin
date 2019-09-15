package com.xkorey.gyh.admin.common;

import cn.hutool.core.util.IdUtil;
import com.xkorey.gyh.admin.model.RkUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Value("${id.worker.node:1}")
    Integer workNode;

    @Autowired
    JwtToken jwtToken;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = request.getHeader("who");
        if(StringUtils.isEmpty(token)){
            for(Cookie cookie :request.getCookies()){
                if(StringUtils.equals(cookie.getName(),"who")){
                    token = cookie.getValue();
                }
            }
        }
        if(StringUtils.isEmpty(token)){
            throw new AdminException("请登录");
        }
        RkUser user = jwtToken.parseToken(token);
        CommonParam.userLocal.set(user);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView){
        if(null!=CommonParam.userLocal.get()){
            CommonParam.userLocal.remove();
        }
    }


}
