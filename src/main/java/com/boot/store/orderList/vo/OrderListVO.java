package com.boot.store.orderList.vo;

import com.boot.client.member.vo.MemberVO;
import com.boot.store.items.vo.ItemsVO;
import com.boot.store.order.vo.OrderVO;

import lombok.Data;

@Data
public class OrderListVO {
	private int ol_num; // 주문항목 번호
	private OrderVO ovo; // 주문번호
	private MemberVO mvo; // 회원번호
	private ItemsVO ivo; // 제품번호
	private int  ol_quan; // 수량
}
