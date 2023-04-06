package com.boot.client.member.service;


import java.util.List;

import com.boot.client.member.vo.MemberVO;
import com.boot.recipe.info.vo.RecipeVO;
import com.boot.store.orderList.vo.OrderListVO;

public interface MemberService {
	public MemberVO loginProcess(MemberVO mvo);
	
	public int idChk(MemberVO mvo);
	
	public int joinProcess(MemberVO mvo);
	
	public MemberVO myPage(MemberVO mvo);
	
	public int updatePwdConfirm(MemberVO mvo);
	
	public int memberUpdate(MemberVO mvo);
	
	public int memberDelete(MemberVO mvo);
	
	public int insertForm(MemberVO mvo);
	
	public List<RecipeVO> recipeCheck(Integer m_num);
	public List<OrderListVO> orderCheck(Integer m_num);
}
