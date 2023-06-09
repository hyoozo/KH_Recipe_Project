package com.boot.client.refrigerator.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.boot.client.member.vo.MemberVO;
import com.boot.client.refrigerator.memo.Memo;
import com.boot.client.refrigerator.service.FridgeService;
import com.boot.client.refrigerator.vo.FridgeVO;
import com.boot.client.refrigerator.vo.IgrNumVO;
import com.boot.recipe.info.vo.RecipeVO;

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

	@PostMapping("/insert")
	@ResponseBody
	public ResponseEntity<String> fridgeIgrInsert(@Param("m_num")int m_num, @Param("igr_num") int igr_num) {
		ResponseEntity<String> entity = null;
		int result = 0;
		result = fridgeService.fridgeIgrInsert(m_num, igr_num);
		entity = new ResponseEntity<String>(String.valueOf(result), HttpStatus.OK);
		return entity;
	}

	@GetMapping("/memberIgrList")
	@ResponseBody
	public List<FridgeVO> memberIgrList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		List<FridgeVO> list = null;
		list = fridgeService.memberIgrList(memberVO);
		return list;
	}

	@GetMapping("/memberIgrDelete")
	@ResponseBody
	public int memberIgrDelete(int igr_num, int m_num) {
		int result = 0;
		result = fridgeService.memberIgrDelete(igr_num, m_num);
		return result;
	}
	
	@GetMapping("/fridgeSelect")
	@ResponseBody
	public int fridgeSelect(int igr_num, int m_num) {
		System.out.println("fridgeSelect 호출 m_num ="+ m_num);
		int result = 0;
		result = fridgeService.fridgeSelect(igr_num, m_num);
		return result;
	}
	
	@GetMapping("/recomView")
	public String recomView(Model model) {
		return "refrigerator/refrigerator_recipe"; 
	}

	@ResponseBody
	@RequestMapping(value = "selectRecommend", method = RequestMethod.POST)
	public List<RecipeVO> selectRecommend(@RequestParam(value="arr") ArrayList<Integer> arr){
		List<RecipeVO> list = fridgeService.selectRecommend(arr);
		return list;
	}
	
	@GetMapping("/memoSelect")
	@ResponseBody
	public Memo meemoSelect(Memo memo, @SessionAttribute("login")  MemberVO member) {
		memo.setMember(member);
		memo.getMember().setM_num(member.getM_num());
		memo = fridgeService.memoSelect(memo);
		return memo;
	}
	
	@PostMapping("/memoUpdate")
	@ResponseBody
	public String memoUpdate(Memo memo, @SessionAttribute("login")  MemberVO member) {
		memo.setMember(member);
		memo.getMember().setM_num(member.getM_num());
		fridgeService.memoUpdate(memo);
		return memo.getMemo_content();
	}

	@PostMapping("/memoInsert")
	@ResponseBody
	public String memoInsert(Memo memo, @SessionAttribute("login")  MemberVO member) {
		memo.setMember(member);
		memo.getMember().setM_num(member.getM_num());
		fridgeService.memoInsert(memo);
		return memo.getMemo_content();
	}
	
	@PostMapping("/memoDelete")
	@ResponseBody
	public int memoDelete(@SessionAttribute("login")  MemberVO vo) {
		System.out.println(vo.getM_num());
		return fridgeService.memoDelete(vo);
	}
	
}
