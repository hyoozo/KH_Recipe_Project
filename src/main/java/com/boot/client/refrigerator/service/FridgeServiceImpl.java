package com.boot.client.refrigerator.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.client.member.vo.MemberVO;
import com.boot.client.refrigerator.dao.FridgeDAO;
import com.boot.client.refrigerator.vo.FridgeVO;
import com.boot.client.refrigerator.vo.IngredientVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FridgeServiceImpl implements FridgeService {
	
	@Setter(onMethod_=@Autowired)
	private FridgeDAO friDao;

	@Override
	public List<IngredientVO> recommendRecipe(String igr_name)throws Exception {
		List<IngredientVO> list = new ArrayList<>();
		list = friDao.recommendRecipe(igr_name);
		return list;
	}

	@Override
	public List<IngredientVO> igrList() {
		List<IngredientVO> list = new ArrayList<>();
		list = friDao.igrList();
		return list;
	}
	
	@Override
	public List<IngredientVO> searchIgr(String igr_name) {
		List<IngredientVO> list = new ArrayList<>();
		list = friDao.searchIgr(igr_name);
		return list;
	}
	
	

	@Override
	public int fridgeIgrInsert(int m_num, int igr_num) {
		int result = friDao.fridgeIgrInsert(m_num, igr_num);
		log.info("fridgeIgrInsert ::: result========" + result);
		return result;
	}

	@Override
	public List<FridgeVO> memberIgrList(MemberVO member) {
		
		return friDao.memberIgrList(member);
	}

	@Override
	public int memberIgrDelete(int fridge_num) {
		int result = 0;
		result = friDao.memberIgrDelete(fridge_num);
		return result;
	}

	@Override
	public int fridgeSelect(FridgeVO fridge) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	
	
}
