package com.boot.recipe.info.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.recipe.info.dao.RecipeDao;
import com.boot.recipe.info.vo.RecipeVO;
import com.boot.recipe.ingredient.vo.IngredientVO;
import com.boot.recipe.manual.vo.RecipeManualVO;

import lombok.Setter;

@Service
public class RecipeServiceImpl implements RecipeService {
	
	@Setter(onMethod_ = @Autowired)
	private RecipeDao recipeDao;
	
	@Override
	public int insertRecipe(RecipeVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertRecipeManual(RecipeManualVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List<RecipeVO> searchRecipe(IngredientVO ivo) {
		
		List<RecipeVO> list = recipeDao.searchRecipe(ivo);
		
		return list;
		
	}

}
