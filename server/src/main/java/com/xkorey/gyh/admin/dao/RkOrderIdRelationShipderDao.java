package com.xkorey.gyh.admin.dao;

import com.xkorey.gyh.admin.model.RkOrderIdRelationShipder;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RkOrderIdRelationShipderDao extends CrudRepository<RkOrderIdRelationShipder,Long> {

    List<RkOrderIdRelationShipder> findBySourceIdAndIdType(Long sourceId,String idType);

    List<RkOrderIdRelationShipder> findBySourceIdOrderByNextIdDesc(Long souceId);

    List<RkOrderIdRelationShipder> findByIdType(String type);

}
