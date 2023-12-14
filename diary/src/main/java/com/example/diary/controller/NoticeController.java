package com.example.diary.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.diary.service.CommentService;
import com.example.diary.service.NoticeService;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Member;
import com.example.diary.vo.Notice;

import jakarta.servlet.http.HttpSession;

@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;
	@Autowired private CommentService commentService;
	
	//notice 상세보기 폼
	@GetMapping("/notice/noticeOne")
	public String noticeOne(Notice paramNotice, Model model, HttpSession session) {
		//로그인 후에만 접속가능
		if(session.getAttribute("loginMember") == null) {
			return "member/login";
		}
		
		//loginMember memberId와 memberLevel 알아오기
		Member loginMember = (Member)session.getAttribute("loginMember");
		int memberLevel = loginMember.getMemberLevel();
		String loginMemberId = loginMember.getMemberId();
	
		//요청값 디버깅
		System.out.println(paramNotice.getNoticeNo() + " <- 상세보기할 noticeNo");
		
		//서비스 요청
		Notice noticeOne = noticeService.noticeOneService(paramNotice);
		List<Comment> commentList = commentService.selectCommentList(session, paramNotice.getNoticeNo());
		
		//출력값 디버깅
		System.out.println(noticeOne+ " <-상세보기 할 notice 객체");
		
		//view에 출력될 객체 model에 add
		model.addAttribute("noticeOne",noticeOne);	//notice 모델
		model.addAttribute("commentList",commentList); // commentList 모델
		model.addAttribute("memberLevel",memberLevel); 
		model.addAttribute("loginMemberId",loginMemberId); 
		
		return "notice/noticeOne";
	}

	//notice 추가 폼
	@GetMapping("/notice/addNotice")
	public String addNotice(HttpSession session) {
		//로그인 후에만 접속가능
		if(session.getAttribute("loginMember") == null) {
			return "member/login";
		}
		//서비스 요청
		
		return "notice/addNotice";
	}
	
	//notice 추가 액션
	@PostMapping("/notice/addNotice")
	public String addNotice(Notice insertNotice, HttpSession session) {
		
		//session에 있는 memberId를 notice 객체에 대입
		Member loginMember = (Member)session.getAttribute("loginMember");
		insertNotice.setMemberId(loginMember.getMemberId());
		
		//insert될 notice 객체 디버깅
		System.out.println(insertNotice + " <- insert될 notice 객체");
		
		//서비스 요청 
		noticeService.AddNoticeService(insertNotice);
		
		//리다이렉트
		return "redirect:/member/home";
	}
	
	//notice 삭제 폼
	@GetMapping("/notice/deleteNotice")
	public String deleteNotice(Notice notice, Model model, HttpSession session) {
		//로그인 후에만 접속가능
		if(session.getAttribute("loginMember") == null) {
			return "member/login";
		}
		
		//서비스 요청(deleteNotice에 삭제할 Notice객체를 출력하기 위함)
		Notice deleteNotice = noticeService.noticeOneService(notice);
		
		//delete될 notice 객체 디버깅
		System.out.println(deleteNotice + " <- delete될 notice 객체");
		
		//deleteNotice를 model에 저장
		model.addAttribute("deleteNotice", deleteNotice);
		
		//포워딩
		return "notice/deleteNotice";
	}
	
	//notice 삭제 액션
	@PostMapping("/notice/deleteNotice")
	public String deleteNotice(Notice deleteNotice, String memberPw, Model model, HttpSession session) {
		//로그인 후에만 접속가능
		if(session.getAttribute("loginMember") == null) {
			return "member/login";
		}
			
		//서비스 요청
		noticeService.DeleteNoticeService(deleteNotice, memberPw, session);
		
		//리다이렉트
		return "redirect:/member/home";
	}
	
	//notice 수정 폼
	@GetMapping("/notice/updateNotice")
	public String updateNotice(Notice paramNotice, Model model, HttpSession session) {
		//로그인 후에만 접속가능
		if(session.getAttribute("loginMember") == null) {
			return "member/login";
		}
		
		//서비스 요청(updateNotice에 수정할 Notice객체를 출력하기 위함)
		Notice updateNotice = noticeService.noticeOneService(paramNotice);
		System.out.println(updateNotice + " <- 업데이트할 notice 객체");
		
		//updateNotice를 model에 저장
		model.addAttribute("updateNotice", updateNotice);
		
		//포워딩
		return "notice/updateNotice";
	}
	
	//notice 수정 액션
	@PostMapping("/notice/updateNotice")
	public String updateNotice(Notice notice, String memberPw, Model model, HttpSession session) {
		//로그인 후에만 접속가능
		if(session.getAttribute("loginMember") == null) {
			return "member/login";
		}
		
		//서비스 요청
		noticeService.UpdateNoticeService(notice, memberPw, session);
		
		//리다이렉트
		return "redirect:/member/home";
	}
	
}
