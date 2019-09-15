package com.xkorey.gyh.admin.service;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.RandomUtil;
import com.google.common.cache.Cache;
import com.xkorey.gyh.admin.common.AdminException;
import com.xkorey.gyh.admin.common.CommonParam;
import com.xkorey.gyh.admin.common.JwtToken;
import com.xkorey.gyh.admin.dao.*;
import com.xkorey.gyh.admin.dto.*;
import com.xkorey.gyh.admin.enums.DataTypeEnum;
import com.xkorey.gyh.admin.model.*;
import freemarker.template.Configuration;
import freemarker.template.TemplateModelException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.math.NumberUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.validation.beanvalidation.SpringValidatorAdapter;

import javax.transaction.Transactional;
import java.util.*;

import static com.xkorey.gyh.admin.enums.DataTypeEnum.*;
import static com.xkorey.gyh.admin.enums.SchedulerStatusEnum.*;

@Service
@Slf4j
public class DataService implements IDataService{

    @Autowired
    RkUserDao userDao;

    @Autowired
    JwtToken jwtToken;

    @Autowired
    RkCommonConfDao commonConfDao;

    @Autowired
    IDbService dbService;

    @Autowired
    RkScheduleDao scheduleDao;

    @Autowired
    RkCustomerDao customerDao;

    @Autowired
    RkCallsDao rkCallsDao;

    @Autowired
    RkOrderDao orderDao;

    @Autowired
    RkOrderIdRelationShipderDao relationShipderDao;

    @Autowired
    @Qualifier("guavaCache")
    Cache common;

    public CommonResponse login(LoginDto loginDto){
        RkUser user = userDao.findByLoginEmailAndPasswdAndUserStatus(loginDto.getName(),loginDto.getPasswd(), Long.valueOf(CommonParam.statusOn));
        if(null!=user){
            String token = jwtToken.getToekn(user);
            return CommonResponse.success(token);
        }
        return CommonResponse.error("未找到用户");
    }


    @Override
    public MainPageDto getMainpageData(Long id) {

        List<RkOrderIdRelationShipder> all = relationShipderDao.findByIdType(first.getName());
        if(CollectionUtil.isEmpty(all)){
            return null;
        }
        MainPageDto pageDto = new MainPageDto();
        RkOrderIdRelationShipder rk = null;
        if(null!=id){
            Optional<RkOrderIdRelationShipder> find = all.stream().filter(
                    r->r.getNextId().equals(id)
            ).findAny();
            if(find.isPresent()){
                rk = find.get();
            }
        }

        if(null==rk){
            Integer target = RandomUtil.randomInt(all.size());
            rk = all.get(target);
        }

        List<RkOrderIdRelationShipder> list = relationShipderDao.findBySourceIdOrderByNextIdDesc(rk.getSourceId());
        for(RkOrderIdRelationShipder shipder : list){
            if(first.getName().equals(shipder.getIdType())){
                RkCustomer user = dbService.getCustomer(shipder.getSourceId());
                pageDto.setFirst(user);
            }
            if(order.getName().equals(shipder.getIdType())){
                pageDto.setOrder(dbService.getOrder(shipder.getNextId()));
            }
            if(protect.getName().equals(shipder.getIdType())){
                pageDto.setTwo(dbService.getCustomer(shipder.getNextId()));
            }
            if(good1.getName().equals(shipder.getIdType())){
                pageDto.setThree(dbService.getCustomer(shipder.getNextId()));
            }
            if(good2.getName().equals(shipder.getIdType())){
                pageDto.setFour(dbService.getCustomer(shipder.getNextId()));
            }
            if(good3.getName().equals(shipder.getIdType())){
                pageDto.setFive(dbService.getCustomer(shipder.getNextId()));
            }
            if(trace.getName().equals(shipder.getIdType())){
                List<RkCalls> callList = pageDto.getCalls();
                if(CollectionUtil.isEmpty(callList)){
                    callList = new ArrayList<>();
                    pageDto.setCalls(callList);
                }
                callList.add(dbService.getCalls(shipder.getNextId()));
            }
        }
        pageDto.setTodyNotice(scheduleDao.findByShowStatus(1L));
        return pageDto;
    }

    @Override
    @Transactional
    public CustomAddResponse saveData(CustomAddDto dto) {
        if(null == dto.getSource().getId()){
            RkCustomer havCus = customerDao.findByRealName(dto.getSource().getRealName());
            if(null!=havCus){
                throw new AdminException("投保人已存在");
            }
        }
        if(common.asMap().containsKey(dto.getToken())){
            throw new AdminException("请勿重复提交");
        }
        common.asMap().put(dto.getToken(),"0");
        customerDao.save(dto.getSource());
        log.info("id {}",dto.getSource().getId());
        orderDao.save(dto.getOrder());
        customerDao.save(dto.getProtect());
        customerDao.save(dto.getGood1());
        customerDao.save(dto.getGood2());
        customerDao.save(dto.getGood3());
        // save relation
        RkOrderIdRelationShipder s1 = new RkOrderIdRelationShipder();
        s1.setSourceId(dto.getSource().getId());
        s1.setNextId(dto.getSource().getId());
        s1.setIdType(first.getName());

        RkOrderIdRelationShipder s2 = new RkOrderIdRelationShipder();
        s2.setSourceId(dto.getSource().getId());
        s2.setNextId(dto.getOrder().getId());
        s2.setIdType(order.getName());

        RkOrderIdRelationShipder s3 = new RkOrderIdRelationShipder();
        s3.setSourceId(dto.getSource().getId());
        s3.setNextId(dto.getProtect().getId());
        s3.setIdType(protect.getName());

        RkOrderIdRelationShipder s4 = new RkOrderIdRelationShipder();
        s4.setSourceId(dto.getSource().getId());
        s4.setNextId(dto.getGood1().getId());
        s4.setIdType(good1.getName());

        RkOrderIdRelationShipder s5 = new RkOrderIdRelationShipder();
        s5.setSourceId(dto.getSource().getId());
        s5.setNextId(dto.getGood2().getId());
        s5.setIdType(good2.getName());


        RkOrderIdRelationShipder s6 = new RkOrderIdRelationShipder();
        s6.setSourceId(dto.getSource().getId());
        s6.setNextId(dto.getGood3().getId());
        s6.setIdType(good3.getName());

        relationShipderDao.save(s1);
        relationShipderDao.save(s2);
        relationShipderDao.save(s3);
        relationShipderDao.save(s4);
        relationShipderDao.save(s5);
        relationShipderDao.save(s6);
        CustomAddResponse response = new CustomAddResponse();
        response.setCustomeId(dto.getSource().getId());
        response.setProtectId(dto.getProtect().getId());
        response.setOrderId(dto.getOrder().getId());
        response.setGood1Id(dto.getGood1().getId());
        response.setGood2Id(dto.getGood2().getId());
        response.setGood3Id(dto.getGood3().getId());
        return response;
    }

    @Scheduled(fixedDelay = 1000*60*10)
    @Transactional
    public void scheduler(){
        List<RkCommonConf> commonBirth = commonConfDao.findAllByCommonType(scheduler_type_birth.getName());
        List<RkCommonConf> commonOrder = commonConfDao.findAllByCommonType(scheduler_type_order.getName());
        List<RkCommonConf> commonTrace = commonConfDao.findAllByCommonType(scheduler_type_trace.getName());
        List<RkCommonConf> commonPeople = commonConfDao.findAllByCommonType(scheduler_type_people.getName());
        log.info("定时开始");
        Integer timer=0;
        if(CollectionUtil.isNotEmpty(commonBirth)){
            timer = NumberUtils.toInt(commonBirth.get(0).getCommonValue(),30);
        }
        DateTime now = new DateTime();
        List<RkCustomer> allCustomer = customerDao.findAll();
        for(RkCustomer customer:allCustomer){
            if(null==customer.getBirthDay()){
                continue;
            }
            RkSchedule schedule = scheduleDao.findBySourceIdAndIdType(customer.getId(), scheduler_type_birth.getName());
            if(null!=schedule){
                // 还在提醒状态
                if(schedule.getShowStatus()>0){
                    if(schedule.getTarget().before(now.toDate())){
                        schedule.setShowStatus(stop.getStatus());
                        schedule.setTarget(
                                new DateTime(schedule.getTarget()).plusYears(1).toDate()
                        );
                        log.info("生日提醒关闭 客户 id {} 姓名 {}",customer.getId(),customer.getRealName());
                        scheduleDao.saveAndFlush(schedule);
                    }
                }else{
                    if(DateTime.now().plusHours(timer).isAfter(schedule.getTarget().getTime())){
                        log.info("生日提醒开始 客户 id {} 姓名 {}",customer.getId(),customer.getRealName());
                        schedule.setShowStatus(start.getStatus());
                        scheduleDao.saveAndFlush(schedule);
                    }
                }
            }else{
                DateTime birth = new DateTime(customer.getBirthDay());
                DateTime birthYear = new DateTime(
                    now.getYear(),
                        birth.monthOfYear().get(),
                        birth.dayOfMonth().get(),
                        0,0,0,0
                );
                if(now.plusHours(timer).isAfter(birthYear)){
                    log.info("生日提醒开始 客户 id {} 姓名 {}",customer.getId(),customer.getRealName());
                  RkSchedule tmp = new RkSchedule();
                  tmp.setShowStatus(start.getStatus());
                  tmp.setTarget(birthYear.toDate());
                  tmp.setSourceId(customer.getId());
                  tmp.setIdType(scheduler_type_birth.getName());
                  scheduleDao.save(tmp);
                }else{
                    RkSchedule tmp = new RkSchedule();
                    tmp.setShowStatus(stop.getStatus());
                    log.info("生日提醒转到下一年 客户 id {} 姓名 {}",customer.getId(),customer.getRealName());
                    tmp.setTarget(birthYear.plusYears(1).toDate());
                    tmp.setSourceId(customer.getId());
                    tmp.setIdType(scheduler_type_birth.getName());
                    scheduleDao.save(tmp);
                }
            }
        }

        if(CollectionUtil.isNotEmpty(commonBirth)){
            timer = NumberUtils.toInt(commonTrace.get(0).getCommonValue(),10);
        }
        List<RkCalls> allCalls = rkCallsDao.findAll();
        for(RkCalls calls:allCalls){
            RkSchedule tmp = scheduleDao.findBySourceIdAndIdType(calls.getId(),scheduler_type_trace.getName());
            if(null==tmp){
                tmp = new RkSchedule();
                tmp.setSourceId(calls.getId());
                tmp.setIdType(scheduler_type_trace.getName());
                tmp.setTarget(calls.getNextServiceTime());
            }
            schedulerHelper(tmp,timer,scheduler_type_trace);
        }


        if(CollectionUtil.isNotEmpty(commonOrder)){
            timer = NumberUtils.toInt(commonOrder.get(0).getCommonValue(),10);
        }
        List<RkOrder> orderList = orderDao.findAll();
        for(RkOrder order:orderList){
            RkSchedule tmp = scheduleDao.findBySourceIdAndIdType(order.getId(),scheduler_type_order.getName());
            if(null==tmp){
                tmp = new RkSchedule();
                tmp.setTarget(order.getOrderFinishTime());
                tmp.setIdType(scheduler_type_order.getName());
                tmp.setSourceId(order.getId());
            }
            schedulerHelper(tmp,timer,scheduler_type_order);
        }

        //
        if(CollectionUtil.isNotEmpty(commonPeople)){
            timer = NumberUtils.toInt(commonPeople.get(0).getCommonValue(),10);
        }

        List<RkSchedule> noteList = scheduleDao.findByShowStatusAndIdType(Long.valueOf(waiting.getStatus()),
                scheduler_type_people.getName());

        for(RkSchedule schedule:noteList){
            schedulerHelper(schedule,timer,scheduler_type_people);
        }

        log.info("定时结束");
    }

    private void schedulerHelper(RkSchedule schedule,Integer hour,DataTypeEnum typeEnum){
        if(null == schedule.getTarget()){
            return;
        }
        DateTime now = DateTime.now();
        Date showDate = now.plusHours(hour).toDate();
        if(null==schedule.getId()){
            log.info("{} 加入提醒 id {}",typeEnum.getDesc(),schedule.getSourceId());
            if(showDate.before(schedule.getTarget())){
                schedule.setShowStatus(waiting.getStatus());
            }
            if(now.toDate().before(schedule.getTarget())){
                log.info("{} 已过期 id {}",typeEnum.getDesc(),schedule.getSourceId());
                schedule.setShowStatus(die.getStatus());
            }
            schedule.setShowStatus(start.getStatus());
            scheduleDao.save(schedule);
        }
        if(schedule.getShowStatus()>0 && die.getStatus()!=schedule.getShowStatus()){
            if(schedule.getTarget().before(now.toDate())){
                schedule.setShowStatus(die.getStatus());
                log.info("{} 自动关闭,id {}",typeEnum.getDesc(),schedule.getId());
                scheduleDao.saveAndFlush(schedule);
            }
            if(showDate.after(schedule.getTarget())){
                schedule.setShowStatus(start.getStatus());
                log.info("{} 开启,id {}",typeEnum.getDesc(),schedule.getId());
                scheduleDao.saveAndFlush(schedule);
            }
        }



    }


    @Autowired
    Configuration configuration;

    @Scheduled(fixedDelay = 1000*60)
    public void countSchedule() throws TemplateModelException {
        log.info("count schedule..start");
        Long customer = customerDao.countByRealNameIsNotNullAndRealNameIsNot("");
        Long calls = rkCallsDao.count();
        Long schedule = scheduleDao.countByShowStatus(Long.valueOf(start.getStatus()));
        configuration.setSharedVariable("schedule",schedule);
        configuration.setSharedVariable("customer",customer);
        configuration.setSharedVariable("calls",calls);
        log.info("count schedule..end");
    }

}
