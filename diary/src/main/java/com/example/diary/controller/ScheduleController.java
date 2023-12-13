package com.example.diary.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.ScheduleService;
import com.example.diary.vo.Member;
import com.example.diary.vo.Schedule;

import jakarta.servlet.http.HttpSession;

@Controller
public class ScheduleController {
	@Autowired private ScheduleService scheduleService;
	
	//날짜로 schedule검색
	@GetMapping("/schedule/scheduleByDate")
	public String scheduleListByDate( HttpSession session,
										@RequestParam(defaultValue = "1") int currentPage,
										@RequestParam(defaultValue = "") String year,
										@RequestParam(defaultValue = "") String month,
										@RequestParam(defaultValue = "") String day,
										Model model) {
		// 로그인 후에만 접근 가능
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/member/login";
		}	
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
	public String scheduleListByWord(Model model, HttpSession session,
										@RequestParam(defaultValue = "1") int currentPage,
										@RequestParam(name="word", defaultValue = "") String word) {
		// 로그인 후에만 접근 가능
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/member/login";
		}
		
		List<Map<String,Object>> resultList = scheduleService.getScheduleListByWord(word,currentPage);

		// 서비스에서 전달받은 map에서 lastPage를 가져옴
		int lastPage = (int) resultList.get(0).get("lastPage");

		//view에 출력될 객체 model에 add
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list",resultList);
		model.addAttribute("word",word);
		
		return "schedule/schedule";
	}
	
	//schedulOne 출력
	@GetMapping("schedule/scheduleOne")
	public String scheduleOne(Model model, HttpSession session,
								@RequestParam int year,
								@RequestParam int month,
								@RequestParam int day) {
		// 로그인 후에만 접근 가능
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/member/login";
		}	
		
		List<Schedule> list = scheduleService.getScheduleOne(year,month,day);
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		model.addAttribute("list", list);
		return "schedule/scheduleOne";
	}
	
	//schedule 추가
	@PostMapping("schedule/addSchedule")
	public String addSchedule(HttpSession session,
								@RequestParam int year,
								@RequestParam int month,
								@RequestParam int day,
								@RequestParam String emoji,
								@RequestParam String scheduleMemo) {
		// 로그인 후에만 접근 가능
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/member/login";
		}
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId=loginMember.getMemberId();
		
		//파라미터 디버깅
		System.out.println("Date : " +year+month+day +"memberId : " + loginMember.getMemberId());
		
		//service에 매개변수로 들어갈 Schedule 객체 세팅
		Schedule schedule = new Schedule();
				
		schedule.setScheduleDate(year+"-"+month+"-"+day);
		schedule.setScheduleMemo(scheduleMemo);
		schedule.setScheduleEmoji(emoji);
		schedule.setMemberId(memberId);
		
		System.out.println(schedule + "<-schedule");
		//service 호출
		 scheduleService.addSchedule(schedule);
		
		return "redirect:/schedule/scheduleOne?year="+year+"&&month="+month+"&&day="+day;
	
	}
	
	//schedule 수정 폼
	@GetMapping("schedule/updateSchedule")
	public String updateSchedule(HttpSession session, Model model,
									@RequestParam int scheduleNo,
									@RequestParam int year,
									@RequestParam int month,
									@RequestParam int day) {
		// 로그인 후에만 접근 가능
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/member/login";
		}
		
		//서비스 호출
		Schedule schedule = scheduleService.getScheduleOne(scheduleNo);
		
		//model에 담아서 jsp에 출력
		model.addAttribute("schedule", schedule);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		
		return "schedule/updateSchedule";
	}
	
	//schedule 수정 액션
	@PostMapping("schedule/updateSchedule")
	public String updateSchedule(HttpSession session,
									@RequestParam int scheduleNo,
									@RequestParam String scheduleMemo,
									@RequestParam String scheduleDate,
									@RequestParam String scheduleEmoji,
									@RequestParam String password,
									@RequestParam int year,
									@RequestParam int month,
									@RequestParam int day) {
		// 로그인 후에만 접근 가능
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/member/login";
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		//서비스에 보내줄 map세팅
		map.put("scheduleNo", scheduleNo);
		map.put("scheduleMemo", scheduleMemo);
		map.put("scheduleDate", scheduleDate);
		map.put("scheduleEmoji", scheduleEmoji);
		map.put("password", password);
		
		//서비스 호출
		scheduleService.updateSchedule(map, session);
		
		return "redirect:/schedule/scheduleOne?year="+year+"&&month="+month+"&&day="+day;
	}
	
	//schedule 삭제 폼
	@GetMapping("schedule/deleteSchedule")
	public String deleteSchedule(HttpSession session, Model model,
									@RequestParam int scheduleNo,
									@RequestParam int year,
									@RequestParam int month,
									@RequestParam int day) {
		// 로그인 후에만 접근 가능
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/member/login";
		}
		
		//서비스 호출
		Schedule schedule = scheduleService.getScheduleOne(scheduleNo);
		
		//model에 담아서 jsp에 출력
		model.addAttribute("schedule", schedule);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		
		return "schedule/deleteSchedule";
	}
	
	//schedule 삭제 액션
	@PostMapping("schedule/deleteSchedule")
	public String deleteSchedule(HttpSession session,
									@RequestParam int scheduleNo,
									@RequestParam String password,
									@RequestParam int year,
									@RequestParam int month,
									@RequestParam int day) {
		// 로그인 후에만 접근 가능
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/member/login";
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		//서비스에 보내줄 map세팅
		map.put("scheduleNo", scheduleNo);
		map.put("password", password);
		
		//서비스 호출
		scheduleService.deleteSchedule(map, session);
		
		return "redirect:/schedule/scheduleOne?year="+year+"&&month="+month+"&&day="+day;
	}
	

}
