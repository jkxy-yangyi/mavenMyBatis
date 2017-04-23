package com.jkxy.demomaven.service;

import com.github.pagehelper.PageInfo;
import com.jkxy.demomaven.domain.SearchResult;


public interface PoetryService {
	PageInfo<SearchResult> queryByPage(int filterType,String keyWord,Integer pageNo,Integer pageSize);
}
