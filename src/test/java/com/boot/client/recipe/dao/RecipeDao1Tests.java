package com.boot.client.recipe.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.boot.client.member.vo.MemberVO;
import com.boot.recipe.info.vo.RecipeVO;
import com.boot.recipe.like.vo.RecLikeVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class RecipeDao1Tests {
	
	@Setter(onMethod_ = @Autowired)
	private RecipeDao1 recipeDao1;
	
	/*@Test
	public void testRecipeList() {
		log.info("recipeList() 메소드 실행");
		
		RecipeVO rvo = new RecipeVO();
		
		rvo.setSearch("rcp_nm");
		rvo.setKeyword("황태");
		
		List<RecipeVO> list = recipeDao1.recipeList(rvo);
		for(RecipeVO vo : list) {
			log.info(vo.toString());
		}
	}*/
	/*@Test
	public void testRecipeList() {
		RecipeVO rvo = new RecipeVO();
		
		rvo.setPageNum(1);
		rvo.setAmount(12);
		
		List<RecipeVO> list = recipeDao1.recipeList(rvo);
		for(RecipeVO vo : list) {
			log.info(vo.toString());
		}
	}*/
	
	/*@Test
	public void testRecipeDetail() {
		RecipeVO rvo = new RecipeVO();
		
		rvo.setRcp_seq(111);
		RecipeVO recipe = recipeDao1.recipeDetail(rvo);
		
		log.info(recipe.toString());
		
	}*/
	
	/*@Test
	public void testFindLike() {
		RecLikeVO rvo = new RecLikeVO();
		
		rvo.setRcp_seq(398);
		rvo.setM_num(2);
		
		int lvo = recipeDao1.findLike(rvo);
		
		log.info(Integer.toString(lvo));
	}*/
	
	/*@Test
	public void testGetLike() {
		
		RecLikeVO lvo = recipeDao1.getLike();
		
		log.info(lvo.toString());
	}*/
	
	/*@Test
	public void testInsertLike() {
		RecLikeVO rvo = new RecLikeVO();
		
		rvo.setRcp_seq(739);
		rvo.setM_num(2);
		
		int count = recipeDao1.insertLike(rvo);
		
		log.info(Integer.toString(count));
	}*/
	
	/*@Test
	public void testUpdateLike() {
		RecLikeVO rvo = new RecLikeVO();
		MemberVO mvo = new MemberVO();
		
		mvo.setM_num(2);
		rvo.setRcplike_status(1);
		
		int count = recipeDao1.updateLike(rvo);
		log.info(Integer.toString(count));
	}*/
	
	@Test
	public void testLikeCnt() {
		
		RecipeVO rvo = new RecipeVO();
		rvo.setRcp_seq(740);
		
		int lvo = recipeDao1.likeCnt(rvo);
		log.info(Integer.toString(lvo));
	}
}
