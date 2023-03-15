package com.boot.store.bascket.vo;

import lombok.Data;

@Data
public class BascketVO {
	private int b_num; // 장바구니 번호
	private int m_num; // 회원번호
	private int i_num; // 제품 번호
	private int b_quan; // 수량
}
