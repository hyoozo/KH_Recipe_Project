package com.boot.client.refrigerator.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.client.member.vo.MemberVO;
import com.boot.client.refrigerator.vo.FridgeVO;
import com.boot.client.refrigerator.vo.IngredientVO;
import com.boot.recipe.info.vo.RecipeVO;

@Mapper
public interface FridgeDAO {
	public List<IngredientVO> recommendRecipe(String igr_name);
	public List<IngredientVO> igrList();
	public List<IngredientVO> searchIgr(String igr_name);
	public List<FridgeVO> memberIgrList(MemberVO member);
	public int fridgeIgrInsert(int m_num, int igr_num);
	public int memberIgrDelete(int igr_num, int m_num);
	public int fridgeSelect(int igr_num, int m_num);
	public List<RecipeVO> selectRecommend(ArrayList<Integer> array);
}
