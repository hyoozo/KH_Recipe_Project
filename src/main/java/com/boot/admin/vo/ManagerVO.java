package com.boot.admin.vo;

import lombok.Data;

@Data
public class ManagerVO {
	private int mng_no; // 관리자 번호
	private String mng_id; // 관리자 아이디
	private String mng_pwd; // 관리자 비밀번호
	private String mng_name; // 관리자 이름
	private String mng_lev; // 관리자 등급
	private String mng_email; // 관리자 이메일
	private String mng_phone; // 관리자 전화번호
}
