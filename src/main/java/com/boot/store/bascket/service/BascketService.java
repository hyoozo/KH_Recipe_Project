package com.boot.store.bascket.service;

import java.util.List;

import com.boot.store.bascket.vo.BascketVO;

public interface BascketService {
	public List<BascketVO> bascketList(BascketVO vo);
	public int insertBascket(BascketVO vo);
}
