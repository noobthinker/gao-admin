package com.xkorey.gyh.admin.controller;

import com.xkorey.gyh.admin.dto.CallDto;
import com.xkorey.gyh.admin.dto.CustomAddDto;
import com.xkorey.gyh.admin.dto.CustomAddResponse;
import com.xkorey.gyh.admin.dto.SearchDto;
import com.xkorey.gyh.admin.model.RkCalls;
import com.xkorey.gyh.admin.service.IDataService;
import com.xkorey.gyh.admin.service.IDbService;
import com.xkorey.gyh.admin.service.ISearchService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
@Slf4j
public class DataController {

    @Autowired
    IDbService dbService;

    @Autowired
    ISearchService searchService;

    @Autowired
    IDataService dataService;

    @RequestMapping("index.html")
    public String index(Model model){
        model.addAttribute("data",dataService.getMainpageData(null));
        return "main";
    }

    @RequestMapping("custom-list.html")
    public String custom(/*Integer page, */Model model){
//        if(null==page){
//            page=1;
//        }

        model.addAttribute("custom",dbService.listAllCustom());
        return "all-customer";
    }

    @RequestMapping("custom-add.html")
    public String customeAdd(Integer cid){
        if(null != cid){

        }
        return "custom-add";
    }

    @RequestMapping("id/show")
    public String idShow(Long qq,Model model){
        model.addAttribute("data",dataService.getMainpageData(qq));
        return "main";
    }

    @RequestMapping("id/edit/{id}")
    public String idEdit(@PathVariable Long id, Model model){
        model.addAttribute("data",dataService.getMainpageData(id));
        return "custom-edit";
    }


    @RequestMapping("custom-add-submit.html")
    @ResponseBody
    public CustomAddResponse customAddSubmit(@RequestBody @Valid CustomAddDto dto){
        log.info("dto {}",dto);
        return dataService.saveData(dto);
    }


    @RequestMapping("search.html")
    @ResponseBody
    public List<SearchDto> search(String q){
        return searchService.search(q);
    }


    @RequestMapping("add-{id}-calls.html")
    public String addCalls(@PathVariable Long id,Model model){
        model.addAttribute("data",dataService.getMainpageData(id));
        model.addAttribute("now",new Date());
        return "calls-add";
    }

    @RequestMapping("call-add-submit.html")
    @ResponseBody
    public Long addCallsSubmit(@Valid @RequestBody CallDto calls){
        return dbService.addCalls(calls);
    }

}
