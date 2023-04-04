package com.boot.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StatisticsDTO {
	private String i_parts;
	private int sum;
	private double percent;
	
	private String start;
	private String end;
}
