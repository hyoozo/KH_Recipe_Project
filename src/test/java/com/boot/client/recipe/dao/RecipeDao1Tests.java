package com.boot.client.recipe.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.boot.recipe.info.vo.RecipeVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class RecipeDao1Tests {
	
	@Setter(onMethod_ = @Autowired)
	private RecipeDao1 recipeDao1;
	
	@Test
	public void testRecipeList() {
		log.info("recipeList() 메소드 실행");
		List<RecipeVO> list = recipeDao1.recipeList();
		for(RecipeVO vo : list) {
			log.info(vo.toString());
		}
	}
}
