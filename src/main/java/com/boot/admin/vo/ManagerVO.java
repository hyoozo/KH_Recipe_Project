package com.boot.admin.vo;

import com.boot.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class ManagerVO extends CommonVO{
	private int rnum;
	private int mng_num; // 관리자 번호
	private String mng_id; // 관리자 아이디
	private String mng_pwd; // 관리자 비밀번호
	private String mng_name; // 관리자 이름
	private String mng_lev; // 관리자 등급
	private String mng_email; // 관리자 이메일
	private String mng_phone; // 관리자 전화번호
}
