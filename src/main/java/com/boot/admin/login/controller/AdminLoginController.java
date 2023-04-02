package com.boot.admin.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminLoginController {
	
	@GetMapping("loginForm")
	public String loginForm() {
		return "login";
	}
}
