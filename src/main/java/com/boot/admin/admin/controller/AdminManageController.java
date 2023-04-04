package com.boot.admin.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.admin.manage.service.ManagerService;
import com.boot.admin.vo.ManagerVO;
import com.boot.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/admin/*")
@Slf4j
public class AdminManageController {
	
	@Setter(onMethod_ = @Autowired)
	private ManagerService managerService;
	
	@GetMapping("adminList")
	public String adminList(@ModelAttribute ManagerVO mvo, Model model ) {
		log.info("adminList() 호출");
		
		List<ManagerVO> adminList = managerService.adminList(mvo);
		log.info("adminList 값 : " + adminList.toString());
		model.addAttribute("adminList", adminList);
		
		int total = managerService.adminCnt(mvo);
		model.addAttribute("pageMaker", new PageDTO(mvo, total));
		
		return "admin/main/adminList";
	}
	
	@GetMapping("insertForm")
	public String insertForm() {
		return "admin/main/insertForm";
	}
	
	@PostMapping("idCheck")
	@ResponseBody
	public String idCheck(@ModelAttribute ManagerVO mvo) {
		String result = "";
		ManagerVO checkId = managerService.idCheck(mvo);
		if(checkId != null) {
			result = "중복";
		} else {
			result = "성공";
		}
		return result;
	}
	
	@PostMapping("adminInsert")
	public String adminInsert(@ModelAttribute ManagerVO mvo) {
		int result = 0;
		String url = "";
		
		result = managerService.insertAdmin(mvo);
		if(result > 0) {
			url = "/admin/admin/adminList";
		} else {
			url = "/admin/admin/adminInsert";
		}
		return "redirect:"+url;
	}
	
	@GetMapping("adminDelete")
	public String adminDelete(@ModelAttribute ManagerVO mvo) {
		log.info("adminDelete() 호출");
		
		int result = 0;
		
		String url = "";
		result = managerService.adminDelete(mvo);
		
		if(result >= 1) {
			url = "/admin/admin/adminList";
		}
		
		return "redirect:"+url;
	}
}
