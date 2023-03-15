package com.boot.recipe.like.vo;

import lombok.Data;

@Data
public class RecLikeVO {
	private int m_num; // 회원번호
	private int rcp_seq; // 레시피 번호
	private int r_like; // 좋아요
}
