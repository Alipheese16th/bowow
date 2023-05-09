package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lec.bowow.model.Coupon;
import com.lec.bowow.model.Member;

public interface MemberService {
	public int memberIdConfirm(String memberId);
	public int memberMailConfirm(String memberEmail);
	public int joinMember(Member member, String memberBirthTemp, HttpSession session);
	public String loginCheck(String memberId, String memberPw, HttpSession session);
	public String searchIdMember(String memberName, String memberEmail);
	public String searchPwMember(String memberId, String memberEmail);
	public Member getDetailMember(String memberId);
	public int modifyMember(Member member, HttpSession session, String oldMemberPw, String memberBirthTemp);
	public int deleteMember(HttpSession session);
	
	//쿠폰리스트
	public List<Coupon> couponList(HttpSession session);
	public String memberGrade(HttpSession session);
	public int couponTotCnt(HttpSession session);
}
