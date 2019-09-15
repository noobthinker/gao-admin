package com.xkorey.gyh.admin.dao;

import com.xkorey.gyh.admin.model.RkCommonConf;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Cacheable(cacheNames = "admin")
public interface RkCommonConfDao extends JpaRepository<RkCommonConf,Long> {

    @Cacheable
    List<RkCommonConf> findAllByCommonType(String type);


}
