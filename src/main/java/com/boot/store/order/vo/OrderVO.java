package com.boot.store.order.vo;

import com.boot.client.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderVO {
	private String imp_uid; // imp 고유 번호
	private String pay_method; // 결제 수단
	private String merchant_uid; // 주문 번호
	private String name; // 주문명
	private String amount; // 결제 금액
	private String order_day; // 주문 날짜
	
	private MemberVO mvo;
}
