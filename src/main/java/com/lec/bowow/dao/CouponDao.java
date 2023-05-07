package com.lec.bowow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.Coupon;

@Mapper
public interface CouponDao {
	public List<Coupon> couponList(String memberId);
	public int insertCoupon(Coupon coupon);
	
}
