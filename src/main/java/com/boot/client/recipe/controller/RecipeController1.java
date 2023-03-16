package com.boot.client.recipe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.client.recipe.service.RecipeService1;
import com.boot.recipe.info.vo.RecipeVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/recipe/*")
@Slf4j
public class RecipeController1 {
	
	@Setter(onMethod_ = @Autowired)
	private RecipeService1 recipeService1;
	
	@GetMapping("/recipeList")
	public String recipeList(Model model) {
		log.info("recipeList() 호출");
		
		List<RecipeVO> recipeList = recipeService1.recipeList();
		model.addAttribute("recipeList", recipeList);
		
		return "recipe/recipeList";
	}
}
