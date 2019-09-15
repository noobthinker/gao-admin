package com.xkorey.gyh.admin.controller;


import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.CircleCaptcha;
import com.xkorey.gyh.admin.common.CommonParam;
import com.xkorey.gyh.admin.common.JwtToken;
import com.xkorey.gyh.admin.dto.CommonResponse;
import com.xkorey.gyh.admin.dto.LoginDto;
import com.xkorey.gyh.admin.model.RkUser;
import com.xkorey.gyh.admin.service.DataService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.Cache;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;

@Controller
public class NoAuthController {

    @Value("${id.worker.node:1}")
    Integer workNode;

    @Autowired
    DataService service;

    @Autowired
    JwtToken jwtToken;

    @RequestMapping("/login.html")
    public String login(@CookieValue(value = "who",required = false) String token){
        if(StringUtils.isNotEmpty(token)){
            RkUser user = jwtToken.parseToken(token);
            if(null!=user){
                return "redirect:/admin/index.html";
            }
        }
        return "login";
    }

    @PostMapping("/login-submit.html")
    @ResponseBody
    public CommonResponse loginSubmit(@Valid @RequestBody LoginDto dto){
        return  service.login(dto);
    }

    @RequestMapping("/token")
    public void token(){
    }

    @RequestMapping("/captcha.jpg")
    public void captcha(HttpServletResponse response) throws IOException {
        CircleCaptcha captcha = CaptchaUtil.createCircleCaptcha(180,76);
        String code = captcha.getGenerator().generate();
        String token = CommonParam.tokenLocal.get();
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        captcha.write(response.getOutputStream());
    }


}
