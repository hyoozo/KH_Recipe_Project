package com.boot.refrigerator.member.vo;

import lombok.Data;

@Data
public class R_F_MngVO {
	private int m_num; // 회원번호
	private int f_num; // 재료 번호
	private String exp_date; // 유통기한
}
