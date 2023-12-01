package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Notice;

@Mapper
public interface HomeMapper {
	// 목록(페이징)
	List<Notice> selectNoticeList(Map<String,Object> paramMap);
	
	// 전체 notice 수(페이징)
	int selectTotalNotice();
}
