package com.xkorey.gyh.admin.common;

import com.xkorey.gyh.admin.model.RkUser;

public interface CommonParam {

    ThreadLocal<String> tokenLocal = new ThreadLocal<>();

    ThreadLocal<RkUser> userLocal = new ThreadLocal<>();

    Integer statusOn=1;
    Integer statusOff=0;


}
