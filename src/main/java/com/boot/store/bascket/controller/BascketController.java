package com.boot.store.bascket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.boot.client.member.vo.MemberVO;
import com.boot.store.bascket.service.BascketService;
import com.boot.store.bascket.vo.BascketVO;

import lombok.Setter;

@Controller
@RequestMapping("/bascket/*")
public class BascketController {
	
	@Setter(onMethod_ = @Autowired)
	private BascketService bascketService;
	
	@GetMapping
	public String BascketList(@ModelAttribute BascketVO bvo, @SessionAttribute(name="", required=false) MemberVO mvo,Model model) {
		
		bvo.setM_num(mvo.getM_num());
		
		List<BascketVO> bascket = bascketService.bascketList(bvo);
		
		model.addAttribute("bascket", bascket);
		
		return "bascket/bascketList";
	}
	
	@ResponseBody
	@PostMapping("/insertItem")
	public String BascketInsert(@ModelAttribute BascketVO vo) {
		
		String str = "";
		int result = 0;
		result = bascketService.insertBascket(vo);
		
		if(result != 0) {
			str = "성공";
		} else {
			str = "실패";
		}
		
		return str;
	}
	
	@ResponseBody
	@PostMapping("/bascketPay")
	public String BascketPay() {
		String str = "";
		
		
		
		return str;
	}
}
