package com.boot.client.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.client.community.board.vo.CommunityVO;
import com.boot.client.member.vo.MemberVO;
import com.boot.recipe.info.vo.RecipeVO;
import com.boot.store.orderList.vo.OrderListVO;

@Mapper
public interface MemberDao {
	public MemberVO loginProcess(MemberVO mvo);
	
	public int idChk(MemberVO mvo);
	
	public int joinProcess(MemberVO mvo);
	
	public MemberVO myPage(MemberVO mvo);
	
	public int updatePwdConfirm(MemberVO mvo);
	
	public int memberUpdate(MemberVO mvo);
	
	public int memberDelete(MemberVO mvo);
	
	public List<RecipeVO> recipeCheck(Integer m_num);
	public List<CommunityVO> commCheck(Integer m_num);
}
