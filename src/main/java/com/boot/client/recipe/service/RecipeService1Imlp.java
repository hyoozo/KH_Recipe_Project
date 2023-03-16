package com.boot.client.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.client.recipe.dao.RecipeDao1;
import com.boot.recipe.info.vo.RecipeVO;

import lombok.Setter;

@Service
public class RecipeService1Imlp implements RecipeService1 {
	
	@Setter(onMethod_ = @Autowired)
	private RecipeDao1 recipeDao1;

	@Override
	public List<RecipeVO> recipeList() {
		List<RecipeVO> list = null;
		list = recipeDao1.recipeList();
		return list;
	}
	
	
}
