package com.example.diary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.diary.mapper.HomeMapper;
import com.example.diary.vo.Member;
import com.example.diary.vo.Notice;

import jakarta.servlet.http.HttpSession;

@Service
public class HomeService {
	@Autowired
	private HomeMapper homeMapper;
	
	//home 화면에 Notice List출력 service
	public Map<String, Object>  homeService(Map<String, Object> map, HttpSession session) {
		
		// 페이징에 필요한 변수
		int rowPerPage = 2; //한페이지에 표시할 공지사항 수 
		int beginRow = ((int)(map.get("currentPage")) - 1) * rowPerPage;
		int noticeCount = homeMapper.selectTotalNotice();
		int lastPage = noticeCount/rowPerPage;
		
		if(noticeCount%rowPerPage != 0) {
			lastPage = lastPage + 1;
		}
		
		//lastPage 디버깅
		System.out.println(lastPage + "<--lastPage");
		System.out.println(noticeCount + "<--noticeCount");
		
		// memberLevel (관리자만 공지 추가할 수 있게)
		Member loginMember = (Member)session.getAttribute("loginMember");
		int memberLevel = loginMember.getMemberLevel();
		
		// Map에 beginRow, rowPerPage 값 추가
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		// mapper 호출
		List<Notice> noticeList = homeMapper.selectNoticeList(paramMap);
		
		Map<String, Object> map2 = new HashMap<>();
		
		// map에 lastPage 추가
		map2.put("lastPage", lastPage);
		
		// map에 loginMember 추가
		map2.put("loginMember", loginMember);
		
		// map에 currentPage 추가
		map2.put("currentPage", map.get("currentPage"));
		
		// map에 memberLevel 추가
		map2.put("memberLevel", memberLevel);
		
		// map에 공지사항 목록 추가
		map2.put("noticeList", noticeList);
		
		return map2;
	}

}
