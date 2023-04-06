package com.boot.admin.statistics.service;

import java.util.List;

import com.boot.common.vo.StatisticsDTO;

public interface StatisticsService {
	public List<StatisticsDTO> saleStatistics(StatisticsDTO dto);
	
	public List<StatisticsDTO> countStatistics(StatisticsDTO dto);
}
