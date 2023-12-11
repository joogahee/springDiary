package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Schedule;

@Mapper
public interface ScheduleMapper {
	
	//schedule 달별 출력
	List<Schedule> selectScheduleListByMonth(Map<String,Object> paramMap);
	//schedule 일별 출력
	List<Schedule> selectScheduleListByDate(Map<String, Object> map);
	
	//schedule 캘린더에 출력
	List<Map<String,Object>> selectScheduleByMonthCnt(Map<String, Object> map);
	
	//일 별 schedule 상세보기 출력
	List<Schedule> selectScheduleOneListByDay(Map<String, Object> map);
	
	//schedule 검색
	List<Schedule> selectScheduleListByWord(String word);
	
	//schedule 최대 연도 , 최소 연도
	Integer selectScheduleDateMaxYear();
	Integer selectScheduleDateMinYear();
	
	
}
