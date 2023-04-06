package com.boot.store.items.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.boot.store.items.vo.ItemsVO;

@Mapper
public interface ItemsDao {
	public List<ItemsVO> itemsList(ItemsVO vo);
	public int insertItems(ItemsVO vo);
	public ItemsVO itemsDetail(ItemsVO vo); 
	public int updateItemsQuan(ItemsVO vo);
	public int itemsCnt();
	public int updateItem(ItemsVO vo);
	public int deleteItem(ItemsVO vo);
}
