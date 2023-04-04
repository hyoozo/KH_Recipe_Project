package com.boot.client.community.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.client.community.board.dao.Commu_YtbDao;
import com.boot.client.community.youtube.vo.Commu_YtbVO;

import lombok.Setter;

@Service
public class Commu_YtbServiceImpl implements Commu_YtbService {
	
	@Setter(onMethod_ = @Autowired)
	private Commu_YtbDao commu_YtbDao;

	@Override
	public List<Commu_YtbVO> Ytb() {
		List<Commu_YtbVO> result = null;
		
		result = commu_YtbDao.Ytb();
		
		return result;
	}

	
	
}
