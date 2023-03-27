package com.boot.client.refrigerator.vo;

import com.boot.recipe.info.vo.RecipeVO;

import lombok.Data;

@Data
public class Main_ingredientVO {
	private int main_igr_num;
	private RecipeVO rcp_seq;
	private IngredientVO igr_num;
	

}
