package com.xkorey.gyh.admin.common;

import com.google.common.collect.Sets;
import com.xkorey.gyh.admin.dto.SearchDto;
import lombok.Getter;
import org.apache.commons.lang3.StringUtils;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Getter
public class SearchAlgorithm {

    Set<SearchDto> pool = Sets.newConcurrentHashSet();


    public List<SearchDto> search(String txt){
        return pool.parallelStream()
                .filter(dto-> StringUtils.contains(dto.getValue(),txt))
                .collect(Collectors.toList());

    }

    public void merge(List<SearchDto> source){
        pool.addAll(source);
    }





}
