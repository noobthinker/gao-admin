package com.xkorey.gyh.admin.service;

import com.google.common.cache.Cache;
import com.xkorey.gyh.admin.common.AdminException;
import com.xkorey.gyh.admin.dao.RkCallsDao;
import com.xkorey.gyh.admin.dao.RkCustomerDao;
import com.xkorey.gyh.admin.dao.RkOrderDao;
import com.xkorey.gyh.admin.dao.RkOrderIdRelationShipderDao;
import com.xkorey.gyh.admin.dto.CallDto;
import com.xkorey.gyh.admin.model.RkCalls;
import com.xkorey.gyh.admin.model.RkCustomer;
import com.xkorey.gyh.admin.model.RkOrder;
import com.xkorey.gyh.admin.model.RkOrderIdRelationShipder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

import static com.xkorey.gyh.admin.enums.DataTypeEnum.trace;

@Service
@Slf4j
public class DbService implements IDbService {

    @Override
    public RkCustomer getCustomer(Long id) {
        return customerDao.getOne(id);
    }

    @Override
    public RkOrder getOrder(Long id) {
        return orderDao.getOne(id);
    }

    @Override
    public RkCalls getCalls(Long id) {
        return callsDao.getOne(id);
    }



    @Override
    public Long addCustomer(RkCustomer customer) {
        return null;
    }

    @Override
    public Long addOrder(RkOrder order) {
        return null;
    }

    @Override
    @Transactional
    public Long addCalls(CallDto dto) {
        if(common.asMap().containsKey(dto.getToken())){
            throw new AdminException("请勿重复提交");
        }
        common.asMap().put(dto.getToken(),"0");
        RkOrderIdRelationShipder shipder=null;
        if(null==dto.getCalls().getId()){
            shipder = new RkOrderIdRelationShipder();
            shipder.setSourceId(dto.getSourceId());
            shipder.setIdType(trace.getName());
        }
        callsDao.save(dto.getCalls());
        if(null!=shipder){
            shipder.setNextId(dto.getCalls().getId());
            relationShipderDao.save(shipder);
        }
        return dto.getCalls().getId();
    }

    @Override
    public Long addRelation(RkOrderIdRelationShipder relationShipder) {
        return null;
    }

    @Override
    public List<RkOrderIdRelationShipder> getAllRelationShipder() {
        return null;
    }



    @Autowired
    RkCustomerDao customerDao;

    @Autowired
    RkOrderDao orderDao;

    @Autowired
    RkCallsDao callsDao;

    @Autowired
    @Qualifier("guavaCache")
    Cache common;

    @Autowired
    RkOrderIdRelationShipderDao relationShipderDao;

    @Override
    public Page<RkCustomer> listCustom(Integer page) {
        Sort sort = new Sort(Sort.Direction.DESC,"id");
        Pageable pageable = PageRequest.of(page,10,sort);
        return customerDao.findAll(pageable);
    }

    @Override
    public List<RkCustomer> listAllCustom() {
        return customerDao.findAll();
    }
}
