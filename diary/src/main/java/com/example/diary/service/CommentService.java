package com.example.diary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.diary.mapper.CommentMapper;
import com.example.diary.mapper.MemberMapper;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Member;

import jakarta.servlet.http.HttpSession;

@Service
public class CommentService {
	@Autowired CommentMapper commentMapper;
	@Autowired MemberMapper memberMapper;
	
	//comment 출력
	public List<Comment> selectCommentList(HttpSession session, int noticeNo){
		
		//로그인 된 member의 memberId와 memberLevel
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		
		//memberLevel
		int memberLevel = memberMapper.checkMemberLevel(loginMember);
		
		//디버깅
		System.out.println(memberId + "로그인 된 memberId");
		System.out.println(memberLevel + "로그인 된 memberLevel");
		
		//Mapper에 보내줄 Map 세팅
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("memberId", memberId);
		paramMap.put("noticeNo", noticeNo);
		paramMap.put("memberLevel", memberLevel);
		
		//mapper 호출
		List<Comment> list = commentMapper.selectComment(paramMap);
		
		//commentController로 보내기
		return list;
		
	}
	
	//comment 추가
	public int insertComment(HttpSession session, Comment comment) {
		Member member = (Member)session.getAttribute("loginMember");
		String memberId = member.getMemberId();
		
		comment.setMemberId(memberId);
		
		//디버깅 
		System.out.println(comment + " <--추가될 comment 객체");
		
		//mampper 호출
		int row = commentMapper.insertComment(comment);
		
		//추가확인 디버깅
		if(row != 1) {
			System.out.println("추가실패");
		}else {
			System.out.println("추가성공");
		}
		
		return row;
	}
}
