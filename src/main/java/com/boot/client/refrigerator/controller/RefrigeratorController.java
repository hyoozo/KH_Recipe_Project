package com.boot.client.refrigerator.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.client.member.vo.MemberVO;
import com.boot.client.refrigerator.service.FridgeService;
import com.boot.client.refrigerator.vo.FridgeVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/refrigerator/*")
public class RefrigeratorController {
	
	@Setter(onMethod_=@Autowired)
	private FridgeService fridgeService; 
	
	@GetMapping("/refrigeratorView")
	public String refrigeratorView() {
		return "refrigerator/refrigeratorView";
	}
	
	@GetMapping("/recommendRcpView")
	public String recommendRcpView() {
		return "refrigerator/refrigerator_recipe";
	}
	
	@PostMapping("/insert")
	@ResponseBody
	public ResponseEntity<String> fridgeIgrInsert(@Param("m_num")int m_num, @Param("igr_num") int igr_num) {
		
		ResponseEntity<String> entity = null;
		int result = 0;
		result = fridgeService.fridgeIgrInsert(m_num, igr_num);
		
		log.info("fridgeIgrInsert result======" + result);
		
		
		entity = new ResponseEntity<String>(String.valueOf(result), HttpStatus.OK);
		
		return entity;
	}

	@GetMapping("/memberIgrList")
	@ResponseBody
	public List<FridgeVO> memberIgrList(MemberVO member) {
		List<FridgeVO> list = null;
		list = fridgeService.memberIgrList(member);
		return list;
	}
	
	@GetMapping("/memberIgrDelete")
	@ResponseBody
	public int memberIgrList(int fridge_num) {
		int result = 0;
		result = fridgeService.memberIgrDelete(fridge_num);
		return result;
	}
}
