package com.xkorey.gyh.admin.service;

import com.xkorey.gyh.admin.dto.CustomAddDto;
import com.xkorey.gyh.admin.dto.CustomAddResponse;
import com.xkorey.gyh.admin.dto.MainPageDto;

public interface IDataService {

    MainPageDto getMainpageData(Long id);


    CustomAddResponse saveData(CustomAddDto dto);



}
