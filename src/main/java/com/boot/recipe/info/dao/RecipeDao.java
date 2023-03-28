package com.boot.recipe.info.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.client.refrigerator.vo.FridgeVO;
import com.boot.recipe.info.vo.RecipeVO;
import com.boot.recipe.ingredient.vo.IngredientVO;
import com.boot.recipe.manual.vo.RecipeManualVO;

@Mapper
public interface RecipeDao {
	public int insertRecipeInfo(RecipeVO rvo);
	public int insertRecipeManual(RecipeManualVO rvo);
	
	public List<RecipeVO> searchRecipe(IngredientVO ivo);
	
}
