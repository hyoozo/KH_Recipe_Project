package com.boot.client.member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.client.member.service.MemberService;
import com.boot.client.member.vo.MemberVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SessionAttributes("login")
@RequestMapping("/member")
@Slf4j
@Controller
class MemberController {

	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;
	
	@ModelAttribute
	public MemberVO login() {
		return new MemberVO();
	}
	
	@GetMapping("/loginForm")
	public String loginForm() {
		log.info("로그인 화면 호출");
		return "member/loginForm";
		
	}
	
	
	@PostMapping("/loginProcess")
	public String loginProcess(MemberVO mvo, Model model,RedirectAttributes ras) {
		String url = "";
		MemberVO memberLogin = memberService.loginProcess(mvo);
		log.info("memberLogin:"+memberLogin);
		
		if(memberLogin != null) {
			model.addAttribute("login",memberLogin);
			url = "/";
			log.info("성공");
		} else {
			ras.addFlashAttribute("loginError","로그인실패");
			url = "/member/loginForm";
			log.info("실패");
		}
		return "redirect:"+url;
	}
	
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		log.info("로그아웃");
		sessionStatus.setComplete();
		return "redirect:/";
	}
	
	@RequestMapping("/joinForm")
	public String joinForm() {
		log.info("회원가입화면 호출");
		return "member/joinForm";
	}
	
	
	@PostMapping("/joinProcess")
	public String joinProcess(MemberVO mvo) {
		log.info("회원가입성공");;
		
		int result = 0;
		result = memberService.joinProcess(mvo);
		String path = "";
		
		if(result == 1) {
			path = "/";
		} else {
			path = "/member/joinForm";
		}
		
		return "redirect:" + path;

	}
	
	@GetMapping("/myPage")
	public String myPage(@ModelAttribute MemberVO mvo,Model model) {
		log.info("myPage 호출 성공");
		log.info("model:"+model);

		return "member/myPage";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm() {
		return "member/updateForm";
	}
	
	@PostMapping("/updatePwdConfirm")
	public ResponseEntity<String> updatePwdConfirm(MemberVO mvo) {
		log.info("updatePwdConfirm 호출 성공");
		
		ResponseEntity<String> entity = null;
		int result = 0;
		result = memberService.updatePwdConfirm(mvo);
		
		entity = new ResponseEntity<String>(String.valueOf(result), HttpStatus.OK);
		
		return entity;
	}
	
	@PostMapping("/memberUpdate")
	public String memberUpdate(@ModelAttribute MemberVO mvo,Model model) {
		log.info("수정완료 호출");
		log.info("mvo: " + mvo);
		int result = 0;
		
		result = memberService.memberUpdate(mvo);
		String path = ""; 
		
		if(result == 1) {
			MemberVO memberLogin = memberService.loginProcess(mvo);
			model.addAttribute("login",memberLogin);
			path = "/member/myPage";
		} else {
			path = "/member/updateForm"; 
		}
	
		return "redirect:" + path;
	}
	
	/*
	@PostMapping(value="/idChk", consumes = "application/json")
	public String idChk(@RequestBody MemberVO mvo) {
		int result = 0;
		try {
		log.info("아이디 중복체크 확인");
		
		result = memberService.idChk(mvo);
		
		log.info("result : " + result);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return (result == 0) ? "SUCCESS": "FAILURE";
	}
	*/
	
	@GetMapping("/memberDelete")
	public String memberDelete(SessionStatus sessionStatus, MemberVO mvo) {
		log.info("회원계정 삭제 호출");
		
		int result = 0;
		result = memberService.memberDelete(mvo);
		String path = "";
		log.info("result:"+result);
		
		if(result == 1) {
			sessionStatus.setComplete();
			path = "/";
		} else {
			path = "/member/updateForm";
		}
		
		return "redirect:" + path;
	}
	
	
	
	
	@PostMapping(value = "/joinProcess",consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String joinProess(@RequestBody MemberVO mvo) {
		log.info("회원가입성공");
		
		int result = 0;
		result = memberService.joinProcess(mvo);
		
		log.info("result : " + result);
		
		return (result == 1) ? "SUCCESS": "FAILURE";
	}
	

}

		
