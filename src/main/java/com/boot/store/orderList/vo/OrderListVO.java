package com.boot.store.orderList.vo;

import com.boot.client.member.vo.MemberVO;
import com.boot.common.vo.CommonVO;
import com.boot.store.items.vo.ItemsVO;
import com.boot.store.order.vo.OrderVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class OrderListVO extends CommonVO{
	private int ol_num; // 주문 리스트 번호
	private String ol_state; // 주문 상태
	private int  ol_quan; // 수량
	
	private OrderVO ovo; // 주문번호
	private MemberVO mvo; // 회원번호
	private ItemsVO ivo; // 제품번호
}
