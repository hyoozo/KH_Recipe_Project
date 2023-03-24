package com.boot.client.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.client.recipe.dao.RecipeDao1;
import com.boot.recipe.info.vo.RecipeVO;
import com.boot.recipe.like.vo.RecLikeVO;

import lombok.Setter;

@Service
public class RecipeService1Imlp implements RecipeService1 {
	
	@Setter(onMethod_ = @Autowired)
	private RecipeDao1 recipeDao1;

	@Override
	public List<RecipeVO> recipeList(RecipeVO rvo) {
		List<RecipeVO> list = null;
		list = recipeDao1.recipeList(rvo);
		return list;
	}

	@Override
	public int recipeCnt(RecipeVO rvo) {
		return recipeDao1.recipeCnt(rvo);
	}

	@Override
	public RecipeVO recipeDetail(RecipeVO rvo) {
		RecipeVO detail = null;
		detail = recipeDao1.recipeDetail(rvo);
		return detail;
	}

	@Override
	public RecLikeVO findLike(RecLikeVO lvo) {
		return recipeDao1.findLike(lvo);
	}

	@Override
	public int insertLike(RecLikeVO lvo) {
		return recipeDao1.insertLike(lvo);
	}
	
	@Override
	public int updateLike(RecLikeVO lvo) {
		return recipeDao1.updateLike(lvo);
	}

	@Override
	public int cancleLike(RecLikeVO lvo) {
		return recipeDao1.cancleLike(lvo);
	}

	@Override
	public int likeCnt(RecipeVO rvo) {
		return recipeDao1.likeCnt(rvo);
	}
	
	
	
}
