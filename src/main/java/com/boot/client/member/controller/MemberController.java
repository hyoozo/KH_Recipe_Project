package com.boot.client.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.client.member.service.MemberService;
import com.boot.client.member.vo.MemberVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/member/*")
@Slf4j
@Controller
public class MemberController {

	//@Setter(onMethod_ = @Autowired)
	//private MemberService memberService;
	
	@GetMapping("/loginForm")
	public String loginForm() {
		log.info("로그인 화면 호출");
		return "member/loginForm";
	}
}
