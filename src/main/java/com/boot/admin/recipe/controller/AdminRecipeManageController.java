package com.boot.admin.recipe.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.boot.client.recipe.service.RecipeService1;
import com.boot.common.vo.PageDTO;
import com.boot.recipe.info.vo.RecipeVO;
import com.boot.recipe.manual.vo.RecipeManualVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/recipe/*")
@Slf4j
public class AdminRecipeManageController {
	
	@Setter(onMethod_ = @Autowired)
	private RecipeService1 recipeService1;
	
	@GetMapping("recipeList")
	public String recipeList(@ModelAttribute RecipeVO rvo, Model model, HttpSession session) {
		
		if (session.getAttribute("adminLogin") == null) {
	        return "redirect:/admin/loginForm";
	    }
		
		log.info("recipeList() 호출");
		
		List<RecipeVO> recipeList = recipeService1.recipeList(rvo);
		model.addAttribute("recipeList", recipeList);
		
		int total = recipeService1.recipeCnt(rvo);
		model.addAttribute("pageMaker", new PageDTO(rvo, total));
		
		return "admin/recipe/recipeList";
	}
	
	@GetMapping("InsertForm")
	public String insertForm(HttpSession session) {
		if (session.getAttribute("adminLogin") == null) {
	        return "redirect:/admin/loginForm";
	    }
		log.info("insertForm() 호출");
		return "admin/recipe/recipeInsertForm";
	}
	
	@PostMapping("recipeInsert")
	public String recipeInsert(@ModelAttribute RecipeVO rvo, @ModelAttribute RecipeManualVO cvo,
	@RequestParam("file") MultipartFile file,
	@RequestParam("file01") MultipartFile file01,
	@RequestParam("file02") MultipartFile file02,
	@RequestParam("file03") MultipartFile file03,
	@RequestParam("file04") MultipartFile file04,
	@RequestParam("file05") MultipartFile file05,
	@RequestParam("file06") MultipartFile file06) throws Exception {
		
		log.info("recipeInsert() 호출");
		log.info("rvo" + rvo.toString());
		
		int result = 0;
		String url = "";
		
		result = recipeService1.recipeInsert(rvo, cvo);
		if(result >= 1) {
			url = "/admin/recipe/recipeList";
		} else {
			url = "/admin/recipe/InsertForm";
		}
		return "redirect:"+url;
	}
	
	@GetMapping("recipeDetail")
	public String recipeDetail(@ModelAttribute RecipeVO rvo, Model model, HttpSession session) {
		
		if (session.getAttribute("adminLogin") == null) {
	        return "redirect:/admin/loginForm";
	    }
		
		log.info("recipeDetail() 호출");
		
		RecipeVO detail = recipeService1.recipeDetail(rvo);
		log.info(detail.toString());
		
		model.addAttribute("detail", detail);
		
		return "admin/recipe/recipeDetail";
		
	}
	
	@GetMapping("updateForm")
	public String updateForm(@ModelAttribute RecipeVO rvo, Model model, HttpSession session) {
		
		if (session.getAttribute("adminLogin") == null) {
	        return "redirect:/admin/loginForm";
	    }
		
		log.info("updateForm() 호출");
		
		RecipeVO detail = recipeService1.recipeDetail(rvo);
		log.info(detail.toString());
		
		model.addAttribute("detail", detail);
		
		return "admin/recipe/updateForm";
	}
	
	@PostMapping("recipeUpdate")
	private String recipeUpdate(@ModelAttribute RecipeVO rvo, @ModelAttribute RecipeManualVO cvo,
			@RequestParam("file") MultipartFile file,
			@RequestParam("file01") MultipartFile file01,
			@RequestParam("file02") MultipartFile file02,
			@RequestParam("file03") MultipartFile file03,
			@RequestParam("file04") MultipartFile file04,
			@RequestParam("file05") MultipartFile file05,
			@RequestParam("file06") MultipartFile file06) throws Exception {
		log.info("recipeUpdate() 호출");
		log.info(rvo.toString());
		log.info(cvo.toString());
		
		int result = 0;
		String url = "";
		result = recipeService1.recipeUpdate(rvo, cvo);
		
		if(result >= 1) {
			url = "/admin/recipe/recipeList";
		} else {
			url = "/admin/recipe/updateForm";
		}
		
		return "redirect:"+url;
	}
	
	@GetMapping("recipeDelete")
	public String recipeDelete(@ModelAttribute RecipeVO rvo, @ModelAttribute RecipeManualVO cvo) throws Exception {
		int result = 0;
		
		log.info("recipeDelete() 호출");
		
		log.info(cvo.toString());
		
		String url = "";
		result = recipeService1.recipeDelete(rvo, cvo);
		
		if(result >= 1) {
			url = "/admin/recipe/recipeList";
		}else {
			url = "/admin/recipe/recipeDetail";
		}
		return "redirect:"+url;
	}
}
