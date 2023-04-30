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
	public Member searchIDgetMember(String memberName);
	public String searchPwMember(String memberId);
	public Member getDetailMember(String memberId);
	public Member modifyMember(Member member, HttpSession session);
	public int deleteMember(String memberId, HttpSession session);
	
	//쿠폰리스트
	public List<Coupon> couponList(HttpSession session);
}
