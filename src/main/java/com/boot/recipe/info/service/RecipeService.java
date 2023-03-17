package com.boot.recipe.info.service;

import java.util.List;

import com.boot.recipe.info.vo.RecipeVO;
import com.boot.recipe.ingredient.vo.IngredientVO;
import com.boot.recipe.manual.vo.RecipeManualVO;

public interface RecipeService {
	public int insertRecipe(RecipeVO rvo);
	public int insertRecipeManual(RecipeManualVO rvo);
	
	public List<RecipeVO> searchRecipe(IngredientVO ivo);
}
