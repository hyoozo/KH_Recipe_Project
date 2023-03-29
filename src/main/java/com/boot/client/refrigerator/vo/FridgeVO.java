package com.boot.client.refrigerator.vo;

import com.boot.client.member.vo.MemberVO;

import lombok.Data;

@Data
public class FridgeVO { //냉장고테이블
	private int fridge_num;
	private MemberVO m_num;
	private IngredientVO igr_num;

}
