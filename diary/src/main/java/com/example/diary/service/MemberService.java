package com.example.diary.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.MemberMapper;
import com.example.diary.vo.Member;

import jakarta.servlet.http.HttpSession;

@Service
@Transactional
public class MemberService {
	@Autowired
	private MemberMapper memberMapper;
	
	//로그인
	public Member login(Member paramMember) {
		Member resultMember = memberMapper.login(paramMember);
		
		if(resultMember != null) {
			System.out.println("로그인 성공");
		}else {
			System.out.println("로그인 실패");			
		}
		
		return resultMember;
	}
	
	//회원가입
	public int addMember(Member paramMember) {
		int row = memberMapper.insertMember(paramMember);
		
		if(row == 1) {
			System.out.println("회원가입 성공");
		}else {
			System.out.println("회원가입 실패");			
		}
		return row;
	}
	
	//회원탈퇴 폼
	public Member deleteMemberform (HttpSession session) {
		Member member = (Member)session.getAttribute("loginMember");

		return member;
	}	
	
	//회원탈퇴
	public int deleteMember(Member paramMember) {
		int row = memberMapper.deleteMember(paramMember);
		
		System.out.println(paramMember+" <- 탈퇴할 member");
		
		if(row == 1) {
			System.out.println("회원탈퇴 성공");
		}else {
			System.out.println("회원탈퇴 실패");			
		}
		return row;
	}	

	//비밀번호 변경 폼
	public Member updateMemberform (HttpSession session) {
		Member member = (Member)session.getAttribute("loginMember");
		System.out.println(member+" <- 비밀번호 변경할 member");
		return member;
	}	
	
	//비밀번호 변경 액션
	public int updateMember(Map m) {
		int row = memberMapper.updateMember(m);
		
		System.out.println(m.get("paramMember")+" <- 비밀번호 변경할 member");
		
		if(row == 1) {
			System.out.println("비밀번호 변경 성공");
		}else {
			System.out.println("비밀번호 변경 실패");			
		}
		return row;
	}	
}
