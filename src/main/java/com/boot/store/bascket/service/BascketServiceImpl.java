package com.boot.store.bascket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.store.bascket.dao.BascketDao;
import com.boot.store.bascket.vo.BascketVO;

import lombok.Setter;

@Service
public class BascketServiceImpl implements BascketService {

	@Setter(onMethod_ = @Autowired)
	private BascketDao bascketDao;
	
	@Override
	public List<BascketVO> bascketList(BascketVO vo) {
		List<BascketVO> list = bascketDao.bascketList(vo);
		
		return list;
	}

	@Override
	public int insertBascket(BascketVO vo) {
		int result = 0;
		result = bascketDao.insertBascket(vo);
		return result;
	}

}
