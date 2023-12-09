package com.example.diary.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.ScheduleService;
import com.example.diary.vo.Schedule;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScheduleController {
	@Autowired private ScheduleService scheduleService;
	
	//날짜로 schedule검색
	@GetMapping("/schedule/scheduleByDate")
	public String scheduleListByDate(@RequestParam(defaultValue = "1") int currentPage,
										@RequestParam(defaultValue = "") String year,
										@RequestParam(defaultValue = "") String month,
										@RequestParam(defaultValue = "") String day,
										Model model) {
		Map<String, Object> map = scheduleService.getScheduleListByDate(currentPage, year, month, day);
		
		//view에 출력될 객체 model에 add
		model.addAttribute("map", map);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		model.addAttribute("currentPage", currentPage);
		
		return "schedule/dateSearchSchedule";
		
	}
	
	//단어로 schedule검색
	@GetMapping("/schedule/word")
	public String scheduleListByWord(Model model,
										@RequestParam(name="word", defaultValue = "") String word) {
		List<Schedule> list = scheduleService.getScheduleListByWord(word);
		model.addAttribute("list",list);
		return "schedule/schedule";
	}
	
	@GetMapping("schedule/scheduleOne")
	public String scheduleOne(Model model,
								@RequestParam int year,
								@RequestParam int month,
								@RequestParam int day) {
		List<Schedule> list = scheduleService.getScheduleOne(year,month,day);
		
		model.addAttribute("list", list);
		return "schedule/scheduleOne";
	}

}
