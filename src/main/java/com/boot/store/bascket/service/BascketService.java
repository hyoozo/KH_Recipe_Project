package com.boot.store.bascket.service;

import java.util.List;

import com.boot.client.member.vo.MemberVO;
import com.boot.store.bascket.vo.BascketVO;

public interface BascketService {
	public List<BascketVO> bascketList(MemberVO vo);
	public int insertBascket(BascketVO vo);
	public int deleteBascket(BascketVO vo);
	public int duplicatedBascket(BascketVO vo);
}
