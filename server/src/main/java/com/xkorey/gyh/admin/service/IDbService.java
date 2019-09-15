package com.xkorey.gyh.admin.service;

import com.xkorey.gyh.admin.dto.CallDto;
import com.xkorey.gyh.admin.model.RkCalls;
import com.xkorey.gyh.admin.model.RkCustomer;
import com.xkorey.gyh.admin.model.RkOrder;
import com.xkorey.gyh.admin.model.RkOrderIdRelationShipder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IDbService {

    RkCustomer getCustomer(Long id);

    RkOrder getOrder(Long id);

    RkCalls getCalls(Long id);

    Long addCustomer(RkCustomer customer);
    Long addOrder(RkOrder order);
    Long addCalls(CallDto dto);

    Long addRelation(RkOrderIdRelationShipder relationShipder);

    List<RkOrderIdRelationShipder> getAllRelationShipder();

    Page<RkCustomer> listCustom(Integer page);
    List<RkCustomer> listAllCustom();
}
