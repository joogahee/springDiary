package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Schedule;

@Mapper
public interface ScheduleMapper {
	
	//schedule 달별 출력
	List<Schedule> selectScheduleListByMonth(Map<String,Object> paramMap);
	
	List<Schedule> selectScheduleList();
	
	//schedule 검색
	List<Schedule> selectScheduleListByWord(String word);
	
	Integer selectScheduleDateMaxYear();
	Integer selectScheduleDateMinYear();
	
	List<Schedule> selectScheduleListByDate(Map<String, Object> map);
}
