package com.example.diary.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.ScheduleMapper;
import com.example.diary.vo.Schedule;

@Service
@Transactional
public class ScheduleService {
	@Autowired private ScheduleMapper scheduleMapper;
	
	//schedule을 단어로 검색
	public List<Schedule> getScheduleListByWord(String word){
		List<Schedule> list = null;
			list = scheduleMapper.selectScheduleListByWord(word);
		return list;
	}
	
	public List<Schedule> getScheduleListByMonth(Map<String,Object> paramMap) {
		
		return scheduleMapper.selectScheduleListByMonth(null);
	}
	
	//schedule을 날짜로 검색
	public Map<String, Object> getScheduleListByDate(int currentPage, String year, String month, String day) {
		// 월범위
		Integer minYear = scheduleMapper.selectScheduleDateMinYear();
		Integer maxYear = scheduleMapper.selectScheduleDateMaxYear();
		Map<String, Integer> maxMinMap = new HashMap<>();
		maxMinMap.put("minYear", minYear);
		maxMinMap.put("maxYear", maxYear);
		
		
		// 스케줄 리스트
		Map<String, Object> paramMap = new HashMap<>();
		if(year.equals("")) {
			paramMap.put("year", null);
		} else {
			paramMap.put("year", Integer.parseInt(year));
		}
		// if..else
		if(month.equals("")) {
			paramMap.put("month", null);
		} else {
			paramMap.put("month", Integer.parseInt(month));
		}
		// if..else
		if(day.equals("")) {
			paramMap.put("day", null);
		} else {
			paramMap.put("day", Integer.parseInt(day));
		}
		
		paramMap.put("maxMinMap", maxMinMap);
		
		// 페이징에 필요한 변수
		int rowPerPage = 10; //한페이지에 표시할 공지사항 수 
		int beginRow = (currentPage - 1) * rowPerPage;
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("beginRow", beginRow);
		
		List<Schedule> list = scheduleMapper.selectScheduleListByDate(paramMap);
		
		// 반환 맵
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("maxMinMap", maxMinMap); // 년도 최소, 최대값
		resultMap.put("list", list); // 조건결과 리스트
		resultMap.put("rowPerPage", rowPerPage); // 조건결과 리스트
		return resultMap;
	}
	
	//schedule 캘린더에 출력
	public List<Map<String,Object>> getScheduleListByMonthCnt(Map<String,Object> map) {
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		list = scheduleMapper.selectScheduleByMonthCnt(map);
		
		System.out.println("schedule 캘린더에 출력 map size"+map.size());
		
		return list;
	}
	
	//scheduleOne 출력
	public List<Schedule> getScheduleOne(int year, int month, int day) {
		Map<String,Object> map = new HashMap<>();
		
		map.put("year", year);
		map.put("month", month);
		map.put("day", day);
		
		List<Schedule> list = scheduleMapper.selectScheduleOneListByDay(map);
		
		return list;
	}
}
