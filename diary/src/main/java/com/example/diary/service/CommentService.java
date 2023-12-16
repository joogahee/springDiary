package com.example.diary.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.CommentMapper;
import com.example.diary.mapper.MemberMapper;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Member;

import jakarta.servlet.http.HttpSession;

@Transactional
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
	
	//commentOne
	public Comment commentOne(HttpSession session, int commentNo) {
		
		//mapper 호출
		Comment comment = commentMapper.selectCommentOne(commentNo);
		
		return comment;
	}
	
	//comment 삭제
	public int deleteComment(HttpSession session, int commentNo, String memberPw){
		
		Member loginmember = (Member)session.getAttribute("loginMember");
		String memberId = loginmember.getMemberId();
		
		Member paramMember = new Member();
		paramMember.setMemberId(memberId);
		paramMember.setMemberPw(memberPw);
		
		//member Mapper호출
		Member resultMember = memberMapper.login(paramMember);
		
		//비밀번호 체크
		if(resultMember == null) {
			 // resultMember가 null인 경우 예외 발생 
		    throw new NullPointerException("비밀번호가 틀렸습니다.");
		}
		
		//comment 삭제 mapper호출
		int row = commentMapper.deleteComment(commentNo);
		
		//삭제확인 디버깅
		if(row != 1) {
			System.out.println("삭제실패");
		}else {
			System.out.println("삭제성공");
		}
		return row;
	}
	
	//comment 수정
	public int updateComment(HttpSession session, int commentNo, String memberPw, String commentContent) {

		Member loginmember = (Member)session.getAttribute("loginMember");
		String memberId = loginmember.getMemberId();
		
		Member paramMember = new Member();
		paramMember.setMemberId(memberId);
		paramMember.setMemberPw(memberPw);
		
		//member Mapper호출
		Member resultMember = memberMapper.login(paramMember);
		
		//비밀번호 체크
		if(resultMember == null) {
			 // resultMember가 null인 경우 예외 발생 
		    throw new NullPointerException("비밀번호가 틀렸습니다.");
		}
		
		//mapper에 보내줄 Comment객체 세팅
		Comment paramComment = new Comment();
		paramComment.setCommentContent(commentContent);
		paramComment.setCommentNo(commentNo);
		
		//mapper호출
		int row = commentMapper.updateComment(paramComment);
		
		//수정확인 디버깅
		if(row != 1) {
			System.out.println("수정실패");
		}else {
			System.out.println("수정성공");
		}

		return row;
	}
}
