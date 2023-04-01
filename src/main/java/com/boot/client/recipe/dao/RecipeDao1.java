package com.boot.client.recipe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.recipe.info.vo.RecipeVO;
import com.boot.recipe.like.vo.RecLikeVO;
import com.boot.recipe.manual.vo.RecipeManualVO;

@Mapper
public interface RecipeDao1 {
	// 사용자
	public List<RecipeVO> recipeList(RecipeVO rvo);
	public int recipeCnt(RecipeVO rvo);
	public RecipeVO recipeDetail(RecipeVO rvo);
	
	public RecLikeVO findLike(RecLikeVO lvo);
	public int insertLike(RecLikeVO lvo);
	public int updateLike(RecLikeVO lvo);
	public int cancleLike(RecLikeVO lvo);
	
	public int likeCnt(RecipeVO rvo);
	
	// 관리자
	
	public int recipeInsert(RecipeVO rvo);
	public int recipeManualInsert(RecipeManualVO cvo);
	public int recipeUpdate(RecipeVO rvo);
	public int recipeManualUpdate(RecipeManualVO cvo);
	public int recipeDelete(RecipeVO rvo);
	public int recipeManualDelete(RecipeManualVO cvo);
	public int recipeLikeDelete(RecipeVO rvo);
	 
	
	//public RecLikeVO getLike();
	
}
