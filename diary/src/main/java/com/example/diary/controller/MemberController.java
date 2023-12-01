package com.example.diary.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.diary.service.MemberService;
import com.example.diary.vo.Member;

import jakarta.servlet.http.HttpSession;


@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	//로그인 폼
	@GetMapping("/member/login")
	public String login(HttpSession session, Model model) {
		//로그인 전에만 접근 가능
		if(session.getAttribute("loginMember") != null) {
			return "redirect:/member/home";
		}		
		
		return "member/login";
	}
	
	//로그인 액션
	@PostMapping("/member/login")
	public String login(HttpSession session,Member paramMember) {
		
		Member loginMember = memberService.login(paramMember);
		if(loginMember == null) {
			//로그인 실패
			return "redirect:/member/login";
		}
				
		session.setAttribute("loginMember", loginMember);
		
		return "redirect:/member/home";
	}
	
	//로그아웃
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
	   session.invalidate();   
	   return "member/login";
	      
	}
	
	//회원가입 폼
	@GetMapping("/member/addMember")
	public String addMember(HttpSession session){
		// 로그인 전에만 접근 가능
		if(session.getAttribute("loginMember") != null) {
			return "redirect:/member/home";
		}	
		return "member/addMember";
	}
	
	//회원가입 액션
	@PostMapping("/member/addMember")
	public String addMember(Member member){
		memberService.addMember(member);
		
		return "redirect:/member/login";
	}
	
	//회원탈퇴 폼
	@GetMapping("/member/deleteMember")
	public String deleteMember(Model model, HttpSession session){
		// 로그인 후에만 접근 가능
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/member/login";
		}	
		
		//서비스요청
		Member deleteMember = memberService.deleteMemberform(session);
		
		//view에 출력될 객체 model에 add
		model.addAttribute("deleteMember",deleteMember);
		
		return "member/deleteMember";
	}

	//회원탈퇴 액션
	@PostMapping("/member/deleteMember")
	public String deleteMember(Member paramMember, HttpSession session){
		memberService.deleteMember(paramMember);
		
		session.invalidate();
		return "redirect:/member/login";
	}
	
	//비밀번호 변경 폼
	@GetMapping("/member/updateMember")
	public String updateMember(Model model, HttpSession session){
		// 로그인 후에만 접근 가능
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/member/login";
		}	
		
		//서비스요청
		Member updateMember = memberService.updateMemberform(session);
		
		//view에 출력될 객체 model에 add
		model.addAttribute("updateMember", updateMember);
		
		return "member/updateMember";
	}	
	
	//비밀번호 변경 액션
	@PostMapping("/member/updateMember")
	public String updateMember(Member paramMember, String updateMemberPw, HttpSession session){
		
		// paramMember와 String updateMemberPw를 같이 요청하기 위해서 맵 생성
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("updateMemberPw", updateMemberPw);
		map.put("memberId", paramMember.getMemberId());
		map.put("memberPw", paramMember.getMemberPw());
		
		memberService.updateMember(map);
		
		session.invalidate();
		return "redirect:/member/login";
	}	
	
}
