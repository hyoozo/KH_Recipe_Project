package com.boot.client.member.vo;

import com.boot.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class MemberVO extends CommonVO{
	private int m_num; // 회원번호
	private String m_name; // 이름
	private String m_id; // 아이디
	private String m_pwd; // 비밀번호
	private String m_phone; // 전화번호
	private String m_email; // 이메일
	private String m_zip;	//우편번호
	private String m_address; // 주소
	private String m_reg_day; // 등록일
	private String m_rec_day; // 최근로그인
}
