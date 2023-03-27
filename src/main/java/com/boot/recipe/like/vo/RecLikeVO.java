package com.boot.recipe.like.vo;

import lombok.Data;

@Data
public class RecLikeVO {
	private int rcplike_id; // 좋아요 번호
	private int m_num; // 회원번호
	private int rcp_seq; // 레시피 번호
	private int rcplike_status; // 좋아요
}
