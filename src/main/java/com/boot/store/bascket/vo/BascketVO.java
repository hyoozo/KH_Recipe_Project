package com.boot.store.bascket.vo;

import com.boot.client.member.vo.MemberVO;
import com.boot.store.items.vo.ItemsVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BascketVO{
	private int b_num; // 장바구니 번호
	private MemberVO mvo; // 회원번호
	private ItemsVO ivo; // 제품 번호
	private int b_quan; // 수량
}
