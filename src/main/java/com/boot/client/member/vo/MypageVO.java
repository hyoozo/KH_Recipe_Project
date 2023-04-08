package com.boot.client.member.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper=false)
@Data
public class MypageVO {
	private int rcp_seq;
	private String rcp_nm;			// 메뉴명
	private String rcp_pat2;		// 분류
	private double info_eng;		// 칼로리
	private String att_file_no_mk;	// 이미지
	private String rcp_parts_dtls;	// 재료
	
	private String IGR_NAME; //메인재료
	
	

}
