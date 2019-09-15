package com.xkorey.gyh.admin.dao;

import com.xkorey.gyh.admin.model.RkUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RkUserDao extends JpaRepository<RkUser,Long> {

    RkUser findByLoginEmailAndPasswdAndUserStatus(String loginEmail,String passwd,Long status);

}
