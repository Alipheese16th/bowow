package com.lec.bowow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.Coupon;
import com.lec.bowow.model.Member;

@Mapper
public interface MemberDao {
	public int memberIdConfirm(String memberId);
	public int memberMailConfirm(String memberEmail);
	public int joinMember(Member member);
	public String searchIdMember(Member member);
	public String searchPwMember(Member member);
	public Member getDetailMember(String memberId);
	public int modifyMember(Member member);
	public int deleteMember(String memberId);
	public void joinCoupon(Coupon coupon);
	//쿠폰
	public List<Coupon> couponList(String memberId);
	public String memberGrade(String memberId);
	public int couponTotCnt(String memberId);
}
