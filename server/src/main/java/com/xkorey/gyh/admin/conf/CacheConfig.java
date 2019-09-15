package com.xkorey.gyh.admin.conf;

import com.github.benmanes.caffeine.cache.Caffeine;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.common.collect.Maps;
import com.xkorey.gyh.admin.dao.RkCommonConfDao;
import com.xkorey.gyh.admin.model.RkCommonConf;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.caffeine.CaffeineCacheManager;
import org.springframework.cache.interceptor.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@EnableCaching
@Configuration
@Slf4j
public class CacheConfig extends CachingConfigurerSupport {

    @Autowired
    RkCommonConfDao commonConfDao;

    @Override
    @Bean
    @Primary
    public CacheManager cacheManager() {
        Caffeine caffeine = Caffeine.newBuilder()
                .expireAfterAccess(10, TimeUnit.MINUTES)
                .maximumSize(10000)
                .initialCapacity(16);
        CaffeineCacheManager cacheManager = new CaffeineCacheManager("admin");
        cacheManager.setCaffeine(caffeine);
        cacheManager.setAllowNullValues(true);
        return cacheManager;
    }

    @Override
    public KeyGenerator keyGenerator() {
        return new KeyGenerator(){

            SimpleKeyGenerator simpleKeyGenerator = new SimpleKeyGenerator();

            @Override
            public Object generate(Object o, Method method, Object... objects) {
                return simpleKeyGenerator.generate(o,method,o.getClass().getSimpleName(),method.getName(),objects);
            }
        };
    }

    @Override
    public CacheResolver cacheResolver(){
        return new  SimpleCacheResolver(cacheManager()){
            @Override
            protected Collection<String> getCacheNames(CacheOperationInvocationContext<?> context) {
                return Arrays.asList(context.getTarget().getClass().getSimpleName());
            }
        };
    }


    @Bean("guavaCache")
    public Cache common(){
        return CacheBuilder.newBuilder()
                .expireAfterAccess(5,TimeUnit.MINUTES)
                .maximumSize(10000)
                .build();
    }


}
