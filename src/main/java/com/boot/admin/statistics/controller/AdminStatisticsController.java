package com.boot.admin.statistics.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.admin.statistics.service.StatisticsService;
import com.boot.common.vo.StatisticsDTO;

import lombok.Setter;

@Controller
@RequestMapping("/admin/store/statistics/")
public class AdminStatisticsController {
	
	@Setter(onMethod_ = @Autowired)
	private StatisticsService statisticsService;
	
	@GetMapping("/chart")
	public String chart() {
		return "admin/store/statistics/charts";
	}
	
	@PostMapping("/saleChart")
	@ResponseBody
	public List<StatisticsDTO> saleChart(StatisticsDTO dto){
		
		
		return statisticsService.saleStatistics(dto);
	}
	
	@PostMapping("/countChart")
	@ResponseBody
	public List<StatisticsDTO> countChart(StatisticsDTO dto){
		
		
		return statisticsService.countStatistics(dto);
	}
}
