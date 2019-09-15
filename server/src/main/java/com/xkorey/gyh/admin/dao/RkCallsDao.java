package com.xkorey.gyh.admin.dao;

import com.xkorey.gyh.admin.model.RkCalls;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface RkCallsDao extends JpaRepository<RkCalls,Long> {

    @Query("select r from RkCalls r where r.nextServiceTime>= :begin and r.nextServiceTime<=:end")
    List<RkCalls> findTarget(Date begin,Date end);

}
