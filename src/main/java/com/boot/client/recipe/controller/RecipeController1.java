package com.boot.client.recipe.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.boot.client.member.vo.MemberVO;
import com.boot.client.recipe.service.RecipeService1;
import com.boot.common.vo.CommonVO;
import com.boot.common.vo.PageDTO;
import com.boot.recipe.info.vo.RecipeVO;
import com.boot.recipe.like.vo.RecLikeVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/recipe/*")
@Slf4j
public class RecipeController1 {

	@Setter(onMethod_ = @Autowired)
	private RecipeService1 recipeService1;

	@ModelAttribute
	public MemberVO memberLogin() {
		return new MemberVO();
	}

	@GetMapping("/recipeList")
	public String recipeList(@ModelAttribute RecipeVO rvo, Model model) {
		log.info("recipeList() 호출");

		List<RecipeVO> recipeList = recipeService1.recipeList(rvo);
		model.addAttribute("recipeList", recipeList);
		
		int total = recipeService1.recipeCnt(rvo);
		model.addAttribute("pageMaker", new PageDTO(rvo, total));

		return "recipe/recipeList";
	}

	@GetMapping("/scroll")
	@ResponseBody
	public List<RecipeVO> recipeListScroll(@ModelAttribute RecipeVO rvo, @RequestParam("pageNum") int pageNum) {
		log.info("recipeListScroll() 호출");
		
		rvo.setPageNum(pageNum);
	    List<RecipeVO> recipeList = recipeService1.recipeList(rvo);
		return recipeList;
	}

	@PostMapping(value = "/likeCnt", consumes = "application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Integer> likeCnt(@RequestBody List<String> rcp_seq_arr) {
		List<Integer> likeCntList = new ArrayList<>();
		for (String rcp_seq : rcp_seq_arr) {
			RecipeVO rvo = new RecipeVO();
			rvo.setRcp_seq(Integer.parseInt(rcp_seq));
			int likeCnt = recipeService1.likeCnt(rvo);
			likeCntList.add(likeCnt);
		}
		return likeCntList;
	}

	@GetMapping("/recipeDetail")
	public String recipeDetail(@ModelAttribute RecipeVO rvo,
			@SessionAttribute(name = "login", required = false) MemberVO login, Model model) {
		log.info("recipeDetail() 호출");
		//log.info("bvo = " + rvo);

		RecipeVO detail = recipeService1.recipeDetail(rvo);
		model.addAttribute("detail", detail);
		//log.info(detail.toString());
		
		if (login != null) {
			RecLikeVO lvo = new RecLikeVO();
			lvo.setRcp_seq(rvo.getRcp_seq());
			lvo.setM_num(login.getM_num());
			RecLikeVO likecheck = recipeService1.findLike(lvo);
			if (likecheck == null) {
				model.addAttribute("likecheck", 0); // 한번도 좋아요를 눌러보지 않은경우 값이 아예없음
			} else if (likecheck.getRcplike_status() != 1) {
				model.addAttribute("likecheck", 0); // 좋아요 상태가 1이 아니면 빈 하트
			} else {
				model.addAttribute("likecheck", 1); // 좋아요 상태가 1이면 꽉 찬 하트
			}
		}
		return "recipe/recipeDetail";
	}

	@GetMapping("/likeUp")
	@ResponseBody
	public String likeUp(@ModelAttribute RecLikeVO rvo, Model model) {
		log.info("likeUp 호출");
		String value = "";

		RecLikeVO like = recipeService1.findLike(rvo);
		if (like == null) {
			recipeService1.insertLike(rvo);
			recipeService1.updateLike(rvo);
			value = "첫좋아요";
		} else if (like.getRcplike_status() == 1) {
			recipeService1.cancleLike(rvo);
			value = "좋아요취소";
		} else if (like.getRcplike_status() == 0) {
			recipeService1.updateLike(rvo);
			value = "다시좋아요";
		} else {
			value = "실패";
		}

		return value;
	}
	
}
