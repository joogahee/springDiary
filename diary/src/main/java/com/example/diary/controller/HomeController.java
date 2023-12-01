package com.example.diary.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.CalendarService;
import com.example.diary.service.HomeService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@Autowired HomeService homeService;
	@Autowired CalendarService calendarService;
	//@Autowired ScheduleService scheduleService;

	@GetMapping("/member/home")
	public String noticeList(Model model,HttpSession session,
								@RequestParam(defaultValue = "1") int currentPage, 
								@RequestParam(required = false) Integer targetYear,
								@RequestParam(required = false) Integer targetMonth) {
		//로그인 후에만 접속가능
		if(session.getAttribute("loginMember") == null) {
			return "member/login";
		}
		

		//service로 보내줄 Map 세팅
		Map<String, Object> map = new HashMap<>();
		map.put("currentPage", currentPage);
		
		//service 호출
		Map<String, Object> noticeMap = new HashMap<>();
		noticeMap = homeService.homeService(map, session);
		Map<String,Object> calendarMap = calendarService.getCalendar(targetYear,targetMonth);
		//List<Schedule> list = scheduleService.getScheduleListByMonth(null, currentPage);
		
		//noticemap 디버강
		System.out.println(noticeMap + " <-- noticeMap");
		
		//model add
		model.addAttribute("noticeMap", noticeMap);
		model.addAttribute("calendarMap", calendarMap);
		//model.addAttribute("list", list);
		
		// 포워딩
		return "member/home";
	}
}
