package com.boot.recipe.info.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.recipe.info.service.RecipeService;
import com.boot.recipe.info.vo.RecipeVO;
import com.boot.recipe.ingredient.vo.IngredientVO;

import lombok.Setter;

@Controller
@RequestMapping("/recipe/*")
public class RecipeController {
	
	@Setter(onMethod_ = @Autowired)
	private RecipeService recipeService;
	
	@GetMapping("/list")
	public String searchRecipe(@ModelAttribute IngredientVO ivo, Model model) {
		List<RecipeVO> list = recipeService.searchRecipe(ivo);
		
		model.addAttribute("recipe", list);
		
		return "recipe/list";
	}
}
