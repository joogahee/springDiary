package com.example.diary.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.MemberMapper;
import com.example.diary.mapper.ScheduleMapper;
import com.example.diary.vo.Member;
import com.example.diary.vo.Schedule;

import jakarta.servlet.http.HttpSession;

@Service
@Transactional
public class ScheduleService {
	@Autowired private ScheduleMapper scheduleMapper;
	@Autowired private MemberMapper memberMapper;
	
	
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
	
	//schedule 추가
	public void addSchedule(Schedule schedule) {
		
		int row = scheduleMapper.insertSchedule(schedule);
		
		if(row == 1) {
			System.out.println("일정 추가 성공");
		}else {
			System.out.println("일정 추가 실패");			
		}
	}
	
	//schedule 수정,삭제를 위한 schedule 상세보기
	public Schedule getScheduleOne(int shceduleNo) {
		//mapper 호출
		Schedule schedule = scheduleMapper.selectScheduleOne(shceduleNo);
		
		//controller로 보내기
		return schedule;
		
	}
	
	//schedule 수정
	public int updateSchedule(Map<String,Object> map, HttpSession session) {
		
		int row = 0;
		
		//로그인 된 MemberId와 MemberPw 확인 
		Member loginMember = (Member)session.getAttribute("loginMember");
		Member member = new Member();
		member.setMemberId(loginMember.getMemberId());
		member.setMemberPw((String)map.get("password"));
		
		System.out.println(member+"<--member");
		
		//수정 mapper에 보내줄 schedule 객체 세팅
		Schedule schedule = new Schedule();
		schedule.setScheduleNo((int)map.get("scheduleNo"));
		schedule.setCreatedate((String)map.get("scheduleDate"));
		schedule.setScheduleMemo((String)map.get("scheduleMemo"));
		schedule.setScheduleEmoji((String)map.get("scheduleEmoji"));
		
		//수정를 위해 비밀번호 확인
		Member resultMember = memberMapper.login(member);
		
		if(resultMember == null) {
			throw new RuntimeException("비밀번호가 틀렸습니다");
			
		}else if(resultMember != null) {
			//수정 mapper 호출
			row = scheduleMapper.updateSchedule(schedule);
		}
		
		if(row == 1) {
			System.out.println("일정 수정 성공");
		}else {
			System.out.println("일정 수정 실패");			
		}
		
		return row;
		
	}
	
	//schedule 삭제
	public int deleteSchedule(Map<String,Object> map, HttpSession session) {
		
		int row = 0;
		
		//로그인 된 MemberId와 MemberPw 확인 
		Member loginMember = (Member)session.getAttribute("loginMember");
		Member member = new Member();
		member.setMemberId(loginMember.getMemberId());
		member.setMemberPw((String)map.get("password"));
		
		System.out.println(member+"<--member");
		
		//삭제 mapper에 보내줄 schedule 객체 세팅
		Schedule schedule = new Schedule();
		schedule.setScheduleNo((int)map.get("scheduleNo"));
		
		//삭제를 위해 비밀번호 확인
		Member resultMember = memberMapper.login(member);
		
		if(resultMember == null) {
			throw new RuntimeException("비밀번호가 틀렸습니다");
			
		}else if(resultMember != null) {
			//삭제 mapper 호출
			row = scheduleMapper.deleteSchedule(schedule);
		}
		
		if(row == 1) {
			System.out.println("일정 삭제 성공");
		}else {
			System.out.println("일정 삭제 실패");			
		}
		
		return row;
		
	}
}
