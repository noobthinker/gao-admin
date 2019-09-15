package com.xkorey.gyh.admin.service;

import com.xkorey.gyh.admin.dto.SearchDto;

import java.util.List;

public interface ISearchService {

    List<SearchDto> search(String txt);
}
