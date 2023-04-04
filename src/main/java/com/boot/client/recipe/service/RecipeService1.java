package com.boot.client.recipe.service;

import java.io.IOException;
import java.util.List;

import com.boot.recipe.info.vo.RecipeVO;
import com.boot.recipe.like.vo.RecLikeVO;
import com.boot.recipe.manual.vo.RecipeManualVO;

public interface RecipeService1 {
	public List<RecipeVO> recipeList(RecipeVO rvo);
	public int recipeCnt(RecipeVO rvo);
	public RecipeVO recipeDetail(RecipeVO rvo);
	
	public RecLikeVO findLike(RecLikeVO lvo);
	public int insertLike(RecLikeVO lvo);
	public int updateLike(RecLikeVO lvo);
	public int cancleLike(RecLikeVO lvo);
	
	public int likeCnt(RecipeVO rvo);
	
	//public RecLikeVO getLike();
	public int recipeInsert(RecipeVO rvo, RecipeManualVO cvo) throws Exception;
	public int recipeUpdate(RecipeVO rvo, RecipeManualVO cvo) throws Exception;
	public int recipeDelete(RecipeVO rvo, RecipeManualVO cvo) throws Exception;
	
}
