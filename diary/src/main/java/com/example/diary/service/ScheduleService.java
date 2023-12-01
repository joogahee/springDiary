package com.example.diary.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.ScheduleMapper;
import com.example.diary.vo.Schedule;

@Service
@Transactional
public class ScheduleService {
	@Autowired private ScheduleMapper scheduleMapper;
	
	public List<Schedule> getScheduleListByMonth(String memberId, int year) {
		
		return scheduleMapper.selectScheduleListByMonth(null);
	}
}
