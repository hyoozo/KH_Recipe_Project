package com.boot.client.refrigerator.service;

import java.util.ArrayList;
import java.util.List;

import com.boot.client.member.vo.MemberVO;
import com.boot.client.refrigerator.memo.Memo;
import com.boot.client.refrigerator.vo.FridgeVO;
import com.boot.client.refrigerator.vo.IngredientVO;
import com.boot.client.refrigerator.vo.Main_ingredientVO;
import com.boot.recipe.info.vo.RecipeVO;

public interface FridgeService {
	public List<IngredientVO> recommendRecipe(String igr_name) throws Exception;
	public List<IngredientVO> igrList();
	public List<IngredientVO> searchIgr(String igr_name);
	public List<FridgeVO> memberIgrList(MemberVO member);
	public int fridgeIgrInsert(int m_num,int igr_num);
	public int memberIgrDelete(int igr_num, int m_num);
	public int fridgeSelect(int igr_num, int m_num);
	//public RecipeVO recommendDetail(RecipeVO rvo);
	public List<RecipeVO> selectRecommend(ArrayList<Integer> array);
	public int memoUpdate(Memo memo);
	public Memo memoSelect(Memo memo);
}
