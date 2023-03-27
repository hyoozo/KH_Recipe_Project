package com.boot.store.bascket.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.store.bascket.vo.BascketVO;

@Mapper
public interface BascketDao {
	public List<BascketVO> bascketList(BascketVO vo);
	public int insertBascket(BascketVO vo);
}
