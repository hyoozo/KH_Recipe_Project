package com.boot.admin.statistics.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.common.vo.StatisticsDTO;

@Mapper
public interface StatisticsDAO {
	public List<StatisticsDTO> saleStatistics(StatisticsDTO dto);
	
	public List<StatisticsDTO> countStatistics(StatisticsDTO dto);
}
