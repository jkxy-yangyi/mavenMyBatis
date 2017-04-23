package com.jkxy.demomaven.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jkxy.demomaven.domain.SearchResult;


public interface PoetryDao {
	
	List<SearchResult> selectByPoetName(@Param("poetName") String poetName);  

	List<SearchResult> selectByPoetryTitle(@Param("poetryTitle") String poetryTitle);  
	
	List<SearchResult> selectByPoetryContent(@Param("poetryContent") String poetryContent);  
}
