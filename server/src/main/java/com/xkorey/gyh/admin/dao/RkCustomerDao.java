package com.xkorey.gyh.admin.dao;

import com.xkorey.gyh.admin.model.RkCustomer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface RkCustomerDao extends JpaRepository<RkCustomer,Long> {

    RkCustomer findByRealName(String realName);

    Long countByRealNameIsNotNullAndRealNameIsNot(String p);
}
