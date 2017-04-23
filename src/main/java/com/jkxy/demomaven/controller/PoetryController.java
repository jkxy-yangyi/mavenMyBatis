package com.jkxy.demomaven.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.jkxy.demomaven.domain.SearchResult;
import com.jkxy.demomaven.service.PoetryService;

@Controller
public class PoetryController {
	
	@Resource
	private PoetryService poetryService;
	
	private PageInfo<SearchResult> page = new PageInfo<SearchResult>();
	
	
	
	
	@RequestMapping("/poetry")    
    public String getIndex(Model model,@RequestParam int filterType,@RequestParam String keyWord, Integer pageNo){     
        page = poetryService.queryByPage(filterType, keyWord, pageNo, 20);
		model.addAttribute("page",page);
		model.addAttribute("filterType",filterType);
		model.addAttribute("keyWord",keyWord);
		System.out.println(page);
        return "index";  
    }
	@RequestMapping("/index")
	public String index(){
		 return "index";
	}
	
	public PageInfo<SearchResult> getPage() {
		return page;
	}

	public void setPage(PageInfo<SearchResult> page) {
		this.page = page;
	}
	
	
}
