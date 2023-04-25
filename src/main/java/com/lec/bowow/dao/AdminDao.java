package com.lec.bowow.dao;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.Admin;

@Mapper
public interface AdminDao {
	public Admin getAdmin(String adminId);
}
