package com.boot.store.bascket.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.client.member.vo.MemberVO;
import com.boot.store.bascket.vo.BascketVO;

@Mapper
public interface BascketDao {
	public List<BascketVO> bascketList(MemberVO vo);
	public int insertBascket(BascketVO vo);
	public int deleteBascket(BascketVO vo);
	public int duplicatedBascket(BascketVO vo);
}
