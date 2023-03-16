package com.boot.client.recipe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.recipe.info.vo.RecipeVO;

@Mapper
public interface RecipeDao1 {
	public List<RecipeVO> recipeList();
}
