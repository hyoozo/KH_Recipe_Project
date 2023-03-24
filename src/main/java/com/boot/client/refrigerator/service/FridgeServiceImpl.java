package com.boot.client.refrigerator.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.client.refrigerator.dao.FridgeDAO;
import com.boot.client.refrigerator.vo.IngredientVO;
import com.boot.client.refrigerator.vo.Main_ingredientVO;

import lombok.Setter;

@Service
public class FridgeServiceImpl implements FridgeService {
	
	@Setter(onMethod_=@Autowired)
	private FridgeDAO friDao;

	@Override
	public List<IngredientVO> recommendRecipe(String igr_name)throws Exception {
		List<IngredientVO> list = null;
		list = friDao.recommendRecipe(igr_name);
		return list;
	}

	@Override
	public List<IngredientVO> igrList() {
		List<IngredientVO> list = new ArrayList<>();;
		list = friDao.igrList();
		return list;
	}
	
	@Override
	public List<IngredientVO> searchIgr(String igr_name) {
		List<IngredientVO> list = null;
		list = friDao.searchIgr(igr_name);
		return list;
	}
	
}
