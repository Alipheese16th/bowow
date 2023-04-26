package com.lec.bowow.service;

import javax.servlet.http.HttpSession;

import com.lec.bowow.model.Member;

public interface MemberService {
	public int memberIdConfirm(String memberId);
	public int memberMailConfirm(String memberEmail);
	public int joinMember(Member member);
	public String loginCheck(String memberId, String memberPw, HttpSession session);
	public String searchIdMember(String memberEmail);
	public String searchPwMember(String memberId);
	public Member getDetailMember(String memberId);
	public Member modifyMember(Member member, HttpSession session);
	public int deleteMember(String memberId, HttpSession session);
}
