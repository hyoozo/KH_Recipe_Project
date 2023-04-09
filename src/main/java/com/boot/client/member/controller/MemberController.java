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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.client.community.reply.vo.ReplyVO;
import com.boot.client.member.service.MemberService;
import com.boot.client.member.vo.MemberVO;
import com.boot.recipe.info.vo.RecipeVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SessionAttributes("login")
@RequestMapping("/member/*")
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
		return "member/loginForm";
		
	}
	
	
	@PostMapping("/loginProcess")
	public String loginProcess(MemberVO mvo, Model model,RedirectAttributes ras) {
		String url = "";
		MemberVO memberLogin = memberService.loginProcess(mvo);
		
		if(memberLogin != null) {
			model.addAttribute("login",memberLogin);
			url = "/";
		} else {
			ras.addFlashAttribute("loginError","로그인실패");
			url = "/member/loginForm";
		}
		return "redirect:"+url;
	}
	
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/";
	}
	
	@RequestMapping("/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	
	
	@PostMapping("/joinProcess")
	public String joinProcess(MemberVO mvo) {
		
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
	
	@RequestMapping("/updateForm")
	public String updateForm(@SessionAttribute(name = "login", required = false)MemberVO mvo) {
		return "member/updateForm";
	}
	@RequestMapping("/myPage")
	public String myPage(@SessionAttribute(name = "login", required = false)MemberVO mvo) {
		return "member/myPage";
	}
	
	@PostMapping("/updatePwdConfirm")
	public ResponseEntity<String> updatePwdConfirm(MemberVO mvo) {
		
		ResponseEntity<String> entity = null;
		int result = 0;
		result = memberService.updatePwdConfirm(mvo);
		
		entity = new ResponseEntity<String>(String.valueOf(result), HttpStatus.OK);
		
		return entity;
	}
	
	@PostMapping("/memberUpdate")
	public String memberUpdate(@ModelAttribute MemberVO mvo,Model model) {
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
	
	@ResponseBody
	@PostMapping(value="/idChk", consumes = "application/json")
	public String idChk(@RequestBody MemberVO mvo) {
		int result = 0;
		try {
		
		result = memberService.idChk(mvo);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return (result == 0) ? "SUCCESS": "FAILURE";
	}
	
	
	@GetMapping("/memberDelete")
	public String memberDelete(SessionStatus sessionStatus, MemberVO mvo) {
		
		int result = 0;
		result = memberService.memberDelete(mvo);
		String path = "";
		
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
		
		int result = 0;
		result = memberService.joinProcess(mvo);
		
		return (result == 1) ? "SUCCESS": "FAILURE";
	}
	
}

		
