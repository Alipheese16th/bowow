package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lec.bowow.model.Admin;

public interface AdminService {
	public List<Admin> mainList();
	public String adminLogin(String adminId, String adminPw, HttpSession httpSession);
	public Admin getAdmin(String adminId);
}
