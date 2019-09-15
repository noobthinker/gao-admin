package com.xkorey.gyh.admin.dao;

import com.xkorey.gyh.admin.model.RkOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RkOrderDao extends JpaRepository<RkOrder,Long> {
}
