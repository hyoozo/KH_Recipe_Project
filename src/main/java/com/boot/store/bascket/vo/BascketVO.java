package com.boot.store.bascket.vo;

import com.boot.store.items.vo.ItemsVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class BascketVO extends ItemsVO{
	private int b_num; // 장바구니 번호
	private int m_num; // 회원번호
	private int i_num; // 제품 번호
}
