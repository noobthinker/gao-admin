package com.admin;

import com.xkorey.gyh.admin.AdminApplication;
import com.xkorey.gyh.admin.common.JwtToken;
import com.xkorey.gyh.admin.dao.RkCallsDao;
import com.xkorey.gyh.admin.dao.RkScheduleDao;
import com.xkorey.gyh.admin.model.RkCalls;
import com.xkorey.gyh.admin.model.RkSchedule;
import com.xkorey.gyh.admin.model.RkUser;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.List;

@SpringBootTest(classes = AdminApplication.class)
@RunWith(SpringRunner.class)
@Slf4j
public class TokenTest {

    @Autowired
    RkCallsDao callsDao;

    @Test
    public void testToken(){
        JwtToken jwtToken = new JwtToken() {};
        RkUser user = new RkUser();
        user.setId(1);
        user.setRealName("test");
        String token = jwtToken.getToekn(user);
        System.out.println(token);

        token = jwtToken.getToekn(user);
        System.out.println(token);
         token = jwtToken.getToekn(user);
        System.out.println(token);
         token = jwtToken.getToekn(user);
        System.out.println(token);
        JwtToken jwt1 = new JwtToken() {};
         token = jwt1.getToekn(user);
        System.out.println(token);
    }

    @Test
    public void testCalls(){
        RkCalls rkCalls = new RkCalls();
        rkCalls.setNextServiceTime(new Date());
        callsDao.save(rkCalls);
        List<RkCalls> list = callsDao.findTarget(new Date(),new Date());
        log.info("{}",list);
    }

    @Test
    public void testCount(){
        log.info("all {}",callsDao.count());
    }

    @Autowired
    RkScheduleDao scheduleDao;

    @Test
    public void testRkSchedule(){
        List<RkSchedule> list = scheduleDao.findAll();
        for(RkSchedule schedule:list){
            log.info("{}",schedule);
        }
    }


}
