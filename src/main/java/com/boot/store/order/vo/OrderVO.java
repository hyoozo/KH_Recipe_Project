package com.boot.store.order.vo;

import lombok.Data;

@Data
public class OrderVO {
	private int o_num; // 주문번호;
	private int m_num; // 회원번호
	private String order_day; // 주문일
	private String o_state; // 주문상태
}
