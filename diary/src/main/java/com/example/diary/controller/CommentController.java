package com.example.diary.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.diary.service.CommentService;
import com.example.diary.vo.Comment;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommentController {
	@Autowired CommentService commentService;
	
	//commentList 출력 
	@GetMapping("/notice/noticeOn")
	public String commentList(int noticeNo,  Model model, HttpSession session) {
		//로그인 후에만 접속가능
		if(session.getAttribute("loginMember") == null) {
			return "member/login";
		}		
		//요청값 디버깅
		System.out.println(noticeNo + "commentLsit 를 출력할 noticeNo");
		
		//서비스 요청
		List<Comment> commentList = commentService.selectCommentList(session, noticeNo);
		
		//view에 출력될 객체 model에 add
		model.addAttribute("commentList",commentList);
		
		return "notice/noticeOne";
	}
}
