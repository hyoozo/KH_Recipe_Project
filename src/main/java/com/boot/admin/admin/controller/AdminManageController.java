package com.boot.admin.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
		log.info(adminList.toString());
		model.addAttribute("adminList", adminList);
		
		int total = managerService.adminCnt(mvo);
		log.info(Integer.toString(total));
		model.addAttribute("pageMaker", new PageDTO(mvo, total));
		
		return "admin/main/adminList";
	}

}
