package com.boot.admin.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.admin.manage.service.ManagerService;
import com.boot.client.member.vo.MemberVO;
import com.boot.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/user/*")
@Slf4j
public class AdminUserManageController {
	@Setter(onMethod_ = @Autowired)
	private ManagerService managerService;
	
	@GetMapping("userList")
	public String userList(@ModelAttribute MemberVO mvo, Model model) {
		
		 log.info("userList() 호출");
		 List<MemberVO> memberList = managerService.userList(mvo);
		 model.addAttribute("memberList", memberList);
		 
		 int total = managerService.memberCnt(mvo);
		 model.addAttribute("pageMaker", new PageDTO(mvo, total));
		 
		return "admin/user/userList";
	}
	
	@GetMapping("userDelete")
	public String userDelete(@ModelAttribute MemberVO mvo) {
		
		log.info("userDelete() 호출");
		int result = 0;
		String url = "";
		result = managerService.userDelete(mvo);
		
		if(result >= 1) {
			url = "/admin/user/userList";
		}
		return "redirect:"+url;
	}
}
