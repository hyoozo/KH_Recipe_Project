package com.boot.client.recipe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.recipe.info.vo.RecipeVO;
import com.boot.recipe.like.vo.RecLikeVO;

@Mapper
public interface RecipeDao1 {
	public List<RecipeVO> recipeList(RecipeVO rvo);
	public int recipeCnt(RecipeVO rvo);
	public RecipeVO recipeDetail(RecipeVO rvo);
	
	public RecLikeVO findLike(RecLikeVO lvo);
	public int insertLike(RecLikeVO lvo);
	public int updateLike(RecLikeVO lvo);
	public int cancleLike(RecLikeVO lvo);
	
	public int likeCnt(RecipeVO rvo);
	
	//public RecLikeVO getLike();
	
}
