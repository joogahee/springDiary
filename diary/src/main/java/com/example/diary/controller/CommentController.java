package com.example.diary.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.CommentService;
import com.example.diary.service.MemberService;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Member;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommentController {
	@Autowired CommentService commentService;
	@Autowired MemberService memberService;
	
	//commentList 출력 
	@GetMapping("/notice/noticeOn")
	public String commentList(@RequestParam int noticeNo,  Model model, HttpSession session) {
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
	
	//comment 추가
	@PostMapping("comment/insertComment")
	public String insertComment(Model model,HttpSession session,
									@RequestParam int noticeNo,
									@RequestParam String commentContent,
									@RequestParam(defaultValue = "0") int isSecret) {
		//요청값 디버깅
		System.out.println(noticeNo + "commentLsit 를 출력할 noticeNo");
		System.out.println(isSecret + " <-- 1:비밀글 0:전체공개");
		
		//service에 보낼 객체 세팅
		Comment comment = new Comment();
		comment.setNoticeNo(noticeNo);
		comment.setCommentContent(commentContent);
		comment.setIsSecret(isSecret);
		
		//서비스 요청
		commentService.insertComment(session, comment);
		
		//리다이렉트
		return "redirect:/notice/noticeOne?noticeNo="+noticeNo;
	}
	
	//comment 삭제(폼)
	@GetMapping("comment/deleteComment")
	public String deleteComment(Model model, HttpSession session,
									@RequestParam int commentNo) {
		//로그인 후에만 접속가능
		if(session.getAttribute("loginMember") == null) {
			return "member/login";
		}
		
		//요청값 디버깅
		System.out.println(commentNo + "삭제할 commentNo");
		
		//service 요청
		Comment comment = commentService.commentOne(session, commentNo);
		
		//view에 출력될 객체 model에 add
		model.addAttribute("comment", comment);
		
		return "comment/deleteComment";
	}
	
	//comment삭제(액션)
	@PostMapping("comment/deleteComment")
	public String deleteComment(HttpSession session,
									@RequestParam int commentNo,
									@RequestParam String memberPw,
									@RequestParam int noticeNo) {
		//service 호출
		commentService.deleteComment(session, commentNo, memberPw);
		
		//리다이렉트
		return "redirect:/notice/noticeOne?noticeNo="+noticeNo;
	}
	
	//comment 수정(폼)
	@GetMapping("comment/updateComment")
	public String updateComment(Model model, HttpSession session,
									@RequestParam int commentNo) {
		//로그인 후에만 접속가능
		if(session.getAttribute("loginMember") == null) {
			return "member/login";
		}
		
		//요청값 디버깅
		System.out.println(commentNo + "수정할 commentNo");
		
		//service 요청
		Comment comment = commentService.commentOne(session, commentNo);
		
		//view에 출력될 객체 model에 add
		model.addAttribute("comment", comment);
		
		return "comment/updateComment";
	}
	
	//comment수정(액션)
	@PostMapping("comment/updateComment")
	public String updateComment(HttpSession session,
									@RequestParam int commentNo,
									@RequestParam String memberPw,
									@RequestParam int noticeNo,
									@RequestParam String commentContent) {
		//service 호출
		commentService.updateComment(session, commentNo, memberPw, commentContent);
		
		//리다이렉트
		return "redirect:/notice/noticeOne?noticeNo="+noticeNo;
	}
}
