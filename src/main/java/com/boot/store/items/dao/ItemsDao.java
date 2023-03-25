package com.boot.store.items.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.boot.store.items.vo.ItemsVO;

@Mapper
public interface ItemsDao {
	public List<ItemsVO> itemsList(ItemsVO vo);
	public int insertItems(ItemsVO vo);
	
	public ItemsVO itemsDetail(ItemsVO vo); 
}
