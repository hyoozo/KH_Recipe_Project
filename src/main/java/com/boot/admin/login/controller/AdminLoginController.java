package com.boot.admin.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.admin.manage.service.ManagerService;
import com.boot.admin.vo.ManagerVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes("adminLogin")
@RequestMapping("/admin/*")
@Slf4j
public class AdminLoginController {
	
	@Setter(onMethod_ = @Autowired)
	private ManagerService managerService;
	
	@GetMapping("loginForm")
	public String loginForm() {
		return "login";
	}
	
	@PostMapping("/login")
	public String loginProcess(ManagerVO login, Model model, RedirectAttributes ras) {
		
		String url = "";
		ManagerVO adminLogin = managerService.loginProcess(login);
		
		if(adminLogin != null) {
			model.addAttribute("adminLogin", adminLogin);
			url = "/admin/admin/adminList";
		} else {
			ras.addFlashAttribute("errorMsg", "로그인 실패 아이디와 비밀번호가 일치하지 않습니다.");
			url = "/admin/loginForm";
		}
		
		return "redirect:"+url;
	}
	
	
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		log.info("admin 로그인 아웃 처리");
		sessionStatus.setComplete();
		return "redirect:/admin/loginForm";
	}
}
