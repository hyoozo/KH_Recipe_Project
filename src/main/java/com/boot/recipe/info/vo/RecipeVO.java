package com.boot.recipe.info.vo;

import com.boot.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class RecipeVO extends CommonVO{
	int rcp_seq;
	String rcp_nm;			// 메뉴명
	String rcp_pat2;		// 분류
	double info_eng;		// 칼로리
	String att_file_no_mk;	// 이미지
	String rcp_parts_dtls;	// 재료
	
	private String manual01;
	private String manual_img01;
	private String manual02;
	private String manual_img02;
	private String manual03;
	private String manual_img03;
	private String manual04;
	private String manual_img04;
	private String manual05;
	private String manual_img05;
	private String manual06;
	private String manual_img06;
}
