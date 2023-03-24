package com.boot.client.refrigerator.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.client.refrigerator.vo.IngredientVO;
import com.boot.client.refrigerator.vo.Main_ingredientVO;

@Mapper
public interface FridgeDAO {
	public List<IngredientVO> recommendRecipe(String igr_name)throws Exception;
	
	public List<IngredientVO> igrList();
	public List<IngredientVO> searchIgr(String igr_name);
	
	//public int fridge_igrList(int m_num, int igr_num);
	
}
