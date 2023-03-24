package com.boot.common.vo;

import lombok.Data;

@Data
public class CommonVO {
	private String search = "";
	private String keyword = "";
	
	private int pageNum = 0;
	private int amount = 0;
	
	public CommonVO() {
		this(1, 12);
	}
	
	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
