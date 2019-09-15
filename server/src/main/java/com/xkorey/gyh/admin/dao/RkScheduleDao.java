package com.xkorey.gyh.admin.dao;

import com.xkorey.gyh.admin.model.RkSchedule;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RkScheduleDao extends JpaRepository<RkSchedule,Long> {

    @Query(nativeQuery = true,value = "select * from rk_schedule where show_status=:status order by id  desc limit 5 ")
    List<RkSchedule> findByShowStatus(Long status);

    RkSchedule findBySourceIdAndIdType(Long id,String idType);

    List<RkSchedule> findByShowStatusAndIdType(Long status,String idType);

    List<RkSchedule> findByIdType(String type);

    Long countByShowStatus(Long status);
}
