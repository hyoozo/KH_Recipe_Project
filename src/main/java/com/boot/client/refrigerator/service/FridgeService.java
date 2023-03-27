package com.boot.client.refrigerator.service;

import java.util.List;

import com.boot.client.refrigerator.vo.IngredientVO;
import com.boot.client.refrigerator.vo.Main_ingredientVO;

public interface FridgeService {
	public List<IngredientVO> recommendRecipe(String igr_name) throws Exception;
	
	public List<IngredientVO> igrList();
	public List<IngredientVO> searchIgr(String igr_name);

}
