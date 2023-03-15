package com.boot.pay.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseCookie;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pay/*")
public class PayController {
	
	@GetMapping("/call")
	public String payCall(HttpServletRequest request,  HttpServletResponse response) {
		
		ResponseCookie noneCookie = ResponseCookie.from("sameSiteCookie", "sameSiteCookieValue")
				.path("/")
				.sameSite("None")
				.httpOnly(false)
				.secure(true)
				.domain("localhost")
				.build();
		
		/*
		 * response.setHeader("Set-Cookie",
		 * "Test1=TestCookieValue1; Secure; SameSite=None");
		 * 
		 * response.addHeader("Set-Cookie",
		 * "Test2=TestCookieValue2; Secure; SameSite=None");
		 * 
		 * response.addHeader("Set-Cookie",
		 * "Test3=TestCookieValue3; Secure; SameSite=None");
		 */
		
		response.setHeader("Set-Cookie", "JSESSIONID=" + request.getRequestedSessionId() + "; path=/; Secure;  SameSite=None");
		
		response.setHeader("Set-Cookie", noneCookie.toString());
		
		return "pay/pay";
	}
}
