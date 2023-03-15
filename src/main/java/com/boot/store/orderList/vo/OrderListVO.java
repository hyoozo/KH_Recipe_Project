package com.boot.store.orderList.vo;

import lombok.Data;

@Data
public class OrderListVO {
	private int ol_num; // 주문항목 번호
	private int o_num; // 주문번호
	private int m_num; // 회원번호
	private int i_num; // 제품번호
	private int  ol_quan; // 수량
}
