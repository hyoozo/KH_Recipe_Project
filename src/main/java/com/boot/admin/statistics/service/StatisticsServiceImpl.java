package com.boot.admin.statistics.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.admin.statistics.dao.StatisticsDAO;
import com.boot.common.vo.StatisticsDTO;

import lombok.Setter;

@Service
public class StatisticsServiceImpl implements StatisticsService {

	@Setter(onMethod_ = @Autowired)
	private StatisticsDAO statisticsDAO;
	
	@Override
	public List<StatisticsDTO> saleStatistics(StatisticsDTO dto) {
		List<StatisticsDTO> list = statisticsDAO.saleStatistics(dto);
		
		return list;
	}

	@Override
	public List<StatisticsDTO> countStatistics(StatisticsDTO dto) {
		List<StatisticsDTO> list = statisticsDAO.countStatistics(dto);
		
		return list;	
	}

}
