package com.jkxy.demomaven.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jkxy.demomaven.common.GlobalConstant;
import com.jkxy.demomaven.dao.PoetryDao;
import com.jkxy.demomaven.domain.SearchResult;


@Service
public class PoetryServiceImpl implements PoetryService {
	@Autowired
	private PoetryDao poetryDao;

	@Override
	public PageInfo<SearchResult> queryByPage(int filterType, String keyWord, Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		List<SearchResult> list = null;
		switch (filterType) {
		case GlobalConstant.BY_POET_NAME:
			list = poetryDao.selectByPoetName(keyWord);
			break;
		case GlobalConstant.BY_POETRY_TITLE:
			list = poetryDao.selectByPoetryTitle(keyWord);
			break;
		case GlobalConstant.BY_POETRY_CONTENT:
			list = poetryDao.selectByPoetryContent(keyWord);
			break;
		}
		PageInfo<SearchResult> page = new PageInfo<SearchResult>(list);
		System.out.println("总记录条数：" + page.getTotal());
		System.out.println("总页数：" + page.getPages());
		return page;
	}

}
