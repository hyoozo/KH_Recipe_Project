package com.boot.client.refrigerator.memo;

import com.boot.client.member.vo.MemberVO;

import lombok.Data;

@Data
public class Memo {
	private int memo_num;
	private String memo_content;
	private MemberVO member;
	//private int m_num;
}
