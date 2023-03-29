package com.boot.store.order.vo;

import com.boot.client.member.vo.MemberVO;

import lombok.Data;

@Data
public class OrderVO {
	private int o_num; // 주문번호;
	private MemberVO mvo; // 회원번호
	private String order_day; // 주문일
	private String o_state; // 주문상태
}
