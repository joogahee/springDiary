package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Member;
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
	List<Map<String,Object>> selectScheduleListByWord(Map<String, Object> map);
	
	//페이징을 위해 검색된 일정이 총 몇개인지 
	int selectScheduleListByWordCnt(Map<String, Object> map);
	int selectScheduleListByDateCnt(String scheduleDate);
	
	//schedule 최대 연도 , 최소 연도
	Integer selectScheduleDateMaxYear();
	Integer selectScheduleDateMinYear();
	
	//schedule 추가
	int insertSchedule(Schedule schedule);
	
	//schedule 수정
	int updateSchedule(Schedule schedule);
	
	//schedule 삭제
	int deleteSchedule(Schedule schedule);
	
	//schedule 상세보기(수정,삭제를위해)
	Schedule selectScheduleOne(int ScheduleNo);
}
