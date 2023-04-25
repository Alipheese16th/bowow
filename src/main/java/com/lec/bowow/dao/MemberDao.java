package com.lec.bowow.dao;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.Member;

@Mapper
public interface MemberDao {
	public int memberIdConfirm(String memberId);
	public int joinMember(Member member);
	public String searchIdMember(String memberEmail);
	public String searchPwMember(String memberId);
	public Member getDetailMember(String memberId);
	public Member modifyMember(Member member);
	public int deleteMember(String memberId);
}
