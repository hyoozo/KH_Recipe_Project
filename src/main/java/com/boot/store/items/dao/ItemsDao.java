package com.boot.store.items.dao;

import org.apache.ibatis.annotations.Mapper;

import com.boot.store.items.vo.ItemsVO;

@Mapper
public interface ItemsDao {
	public int insertItems(ItemsVO vo);
}
