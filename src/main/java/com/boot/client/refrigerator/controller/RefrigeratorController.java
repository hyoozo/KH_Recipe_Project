package com.boot.client.refrigerator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/refrigerator/*")
public class RefrigeratorController {
	
	@GetMapping("/refrigeratorView")
	public String refrigeratorView() {
		return "refrigerator/refrigeratorView";
	}

}
