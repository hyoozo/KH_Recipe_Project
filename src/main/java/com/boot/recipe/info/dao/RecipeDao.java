package com.boot.recipe.info.dao;

import org.apache.ibatis.annotations.Mapper;

import com.boot.recipe.info.vo.RecipeVO;
import com.boot.recipe.manual.vo.RecipeManualVO;

@Mapper
public interface RecipeDao {
	public int insertRecipeInfo(RecipeVO rvo);
	public int insertRecipeManual(RecipeManualVO rvo);
}
