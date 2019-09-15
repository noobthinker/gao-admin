package com.xkorey.gyh.admin.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.xkorey.gyh.admin.common.SearchAlgorithm;
import com.xkorey.gyh.admin.dao.RkCallsDao;
import com.xkorey.gyh.admin.dao.RkCustomerDao;
import com.xkorey.gyh.admin.dao.RkScheduleDao;
import com.xkorey.gyh.admin.dto.SearchDto;
import com.xkorey.gyh.admin.enums.DataTypeEnum;
import com.xkorey.gyh.admin.model.RkCalls;
import com.xkorey.gyh.admin.model.RkCustomer;
import com.xkorey.gyh.admin.model.RkSchedule;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.xkorey.gyh.admin.enums.DataTypeEnum.*;

@Service
@Slf4j
public class SearchService implements ISearchService {

//    Table fullTxt = Table.create("full-txt-search");

    @Autowired
    RkCustomerDao rkCustomerDao;

    @Autowired
    RkCallsDao rkCallsDao;

    @Autowired
    RkScheduleDao scheduleDao;

    ObjectMapper om = new ObjectMapper();

    SearchAlgorithm algorithm = new SearchAlgorithm();

    @Override
    public List<SearchDto> search(String txt) {
        return algorithm.search(txt);
    }


//    @PostConstruct
//    void initTab(){
//        fullTxt.addColumns(
//                LongColumn.create("id"),
//                StringColumn.create("type"),
//                StringColumn.create("value"));
//    }
//    @PostConstruct
//    void initTab(){
//        fullTxt.addColumns(
//                LongColumn.create("id"),
//                StringColumn.create("type"),
//                StringColumn.create("value"));
//    }

    @Scheduled(fixedDelay = 1000*60)
    public void fillData(){
        List<SearchDto> searchDtoList = new ArrayList();
        List<RkCustomer> customerList = rkCustomerDao.findAll();
        for(RkCustomer customer:customerList){
            searchDtoList.addAll(objToDto(
                    customer.getId(),
                    customer,first));
        }
        List<RkCalls> callList = rkCallsDao.findAll();
        for(RkCalls calls:callList){
            searchDtoList.addAll(
              objToDto(calls.getId(),
                      calls,
                      trace)
            );
        }
        List<RkSchedule> scheduleList = scheduleDao.findByIdType(scheduler_type_people.getName());
        for(RkSchedule schedule:scheduleList){
            searchDtoList.addAll(
                    objToDto(
                            schedule.getId(),
                            schedule,
                            scheduler_type_people
                    )
            );
        }
//        log.info("clear table data");
//        fullTxt.clear();
        log.info("all seach txt size {}",searchDtoList.size());
        algorithm.merge(searchDtoList);
//        for(SearchDto dto:searchDtoList){
//            Row row = new Row(fullTxt);
//            row.setLong(0,dto.getVisitId());
//            row.setString(1,dto.getType());
//            row.setString(2,dto.getValue());
//            fullTxt.addRow(row);
//        }
    }

    private List<SearchDto> objToDto(Long id,Object o, DataTypeEnum type){
        List<SearchDto> searchDtoList = new ArrayList();
        Map data = om.convertValue(o, Map.class);
        for(Object key:data.keySet()){
            SearchDto dto = new SearchDto();
            dto.setType(type.getDesc());
            dto.setVisitId(id);
            dto.setValue(StringUtils.join(data.get(key)));
            searchDtoList.add(dto);
        }
        return searchDtoList;
    }


}
