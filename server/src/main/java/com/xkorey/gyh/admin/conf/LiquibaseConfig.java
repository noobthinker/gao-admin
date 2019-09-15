package com.xkorey.gyh.admin.conf;

import com.xkorey.gyh.admin.common.JwtToken;
import com.xkorey.gyh.admin.common.LoginInterceptor;
import com.xkorey.gyh.admin.common.TokenInterceptor;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.cache.Cache;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.crypto.KeyGenerator;
import java.util.Map;

@Configuration
public class LiquibaseConfig implements WebMvcConfigurer, BeanPostProcessor {

    @Autowired
    TokenInterceptor tokenInterceptor;

    @Autowired
    LoginInterceptor loginInterceptor;




    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**");
    }


    @Bean
    public JwtToken jwtToken(){
        return new JwtToken() {};
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //指定拦截器，指定拦截路径事情了
        registry.addInterceptor(tokenInterceptor).addPathPatterns("/**/**.html");
        registry.addInterceptor(loginInterceptor).addPathPatterns("/admin/**/**.html");
    }

    @Override
    public Object postProcessBeforeInitialization(Object bean, String beanName)
            throws BeansException {
        if (bean instanceof FreeMarkerConfigurer) {
            FreeMarkerConfigurer configurer = (FreeMarkerConfigurer) bean;
//            configurer.setFreemarkerVariables(ftl);
        }
        return bean;
    }

}
