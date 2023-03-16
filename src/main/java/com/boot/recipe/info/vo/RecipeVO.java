package com.boot.recipe.info.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RecipeVO {
	int rcp_seq;
	String rcp_nm;			// 메뉴명
	String rcp_pat2;		// 분류
	double info_eng;		// 칼로리
	String att_file_no_mk;	// 이미지
	String rcp_parts_dtls;	// 재료
}
