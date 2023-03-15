package com.boot.recipe.info.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RecipeVO {
	int rcp_seq;
	String rcp_nm;
	String rcp_pat2;
	double info_eng;
	String att_file_no_mk;
	String rcp_parts_dtls;
}
