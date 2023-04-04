package com.boot.admin.statistics.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.store.order.service.OrderService;
import com.boot.store.orderList.service.OrderListService;

import lombok.Setter;

@Controller
@RequestMapping("/admin/store/statistics/")
public class AdminStatisticsController {
	
	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;
	
	@Setter(onMethod_ = @Autowired)
	private OrderListService orderListService;
	
	@GetMapping("/chart")
	public String chart() {
		return "admin/store/statistics/charts";
	}
	
}
