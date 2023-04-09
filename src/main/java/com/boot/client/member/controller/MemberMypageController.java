package com.boot.client.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.boot.client.community.board.controller.ComReplyController;
import com.boot.client.community.board.service.ComReplyService;
import com.boot.client.community.board.vo.CommunityVO;
import com.boot.client.member.service.MemberService;
import com.boot.client.member.vo.MemberVO;
import com.boot.recipe.info.vo.RecipeVO;
import com.boot.store.orderList.vo.OrderListVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping(value="/mypage/*")
@Controller
@Slf4j
public class MemberMypageController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;
	
	
	@GetMapping(value="/recipeCheck/{m_num}", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<RecipeVO> recipeCheck(@PathVariable("m_num") Integer m_num) {
		List<RecipeVO> recipe = memberService.recipeCheck(m_num);
		return recipe;
	}
	
	@GetMapping(value="/commCheck/{m_num}", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<CommunityVO> commCheck(@PathVariable("m_num") Integer m_num) {
		List<CommunityVO> order = memberService.commCheck(m_num);
		return order;
	}

}
