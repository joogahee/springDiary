package com.example.diary.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.diary.mapper.MemberMapper;
import com.example.diary.mapper.NoticeMapper;
import com.example.diary.vo.Member;
import com.example.diary.vo.Notice;

import jakarta.servlet.http.HttpSession;

@Service
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private MemberMapper memberMapper;
	
	//notice 상세보기
	public Notice noticeOneService(Notice paramNotice) {

		//mapper 호출 (요청)
		Notice noticeOne = noticeMapper.selectNoticeOne(paramNotice);
		
		return noticeOne;
		
	}
	
	//insertNotice
	public int AddNoticeService(Notice notice) {
		
		// mapper 호출
		int row = this.noticeMapper.insertNotice(notice);
		
		//추가확인 디버깅
		if(row == 1) {
			System.out.println("추가성공");
		}else {
			System.out.println("추가실패");
		}
		
		return row;
	}
	
	//deleteNotice
	public int DeleteNoticeService(Notice deleteNotice, String memberPw, HttpSession session) {

		//memberLevel이 1인 경우에만 삭제가능-> 현재로그인 된 member의 level 체크
		Member loginMember = (Member)session.getAttribute("loginMember");
		int memberLevel = memberMapper.checkMemberLevel(loginMember);
		System.out.println("로그인 된 memberId의 Level : " + memberLevel);
		
		//디버깅 변수
		int row = 0;
		
		//ID와 password확인
		loginMember.setMemberPw(memberPw);
		Member resultMember = memberMapper.login(loginMember);
		System.out.println(resultMember + " <- 현재 삭제를 시도하는 member");
		
		if(memberLevel == 1 && resultMember != null) {
			// mapper 호출
			row = this.noticeMapper.deleteNotice(deleteNotice);	
		}
		
		//삭제확인 디버깅
		if(row == 1) {
			System.out.println("삭제성공");
		}else {
			System.out.println("삭제실패");
		}
		
		return row;
		}

	//updateNotice
	public int UpdateNoticeService(Notice notice, String memberPw, HttpSession session) {
		
		//memberLevel이 1인 경우에만 수정가능-> 현재로그인 된 member의 level 체크
		Member loginMember = (Member)session.getAttribute("loginMember");
		int memberLevel = memberMapper.checkMemberLevel(loginMember);
		System.out.println("로그인 된 memberId의 Level : " + memberLevel);
		
		//디버깅 변수
		int row = 0;
		
		System.out.println(memberPw);
		//ID와 password확인
		loginMember.setMemberPw(memberPw);
		Member resultMember = memberMapper.login(loginMember);
		System.out.println(resultMember + " <- 현재 수정를 시도하는 member");
		
		if(memberLevel == 1 && resultMember != null) {
			// mapper 호출
			noticeMapper.updateNotice(notice);
		}
		
		//삭제확인 디버깅
		if(row == 1) {
			System.out.println("수정성공");
		}else {
			System.out.println("수정실패");
		}
		
		return row;
		}

	
}
