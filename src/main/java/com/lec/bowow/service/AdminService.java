package com.lec.bowow.service;

import javax.servlet.http.HttpSession;

import com.lec.bowow.model.Admin;

public interface AdminService {
	public String adminLogin(String adminId, String adminPw, HttpSession httpSession);
	public Admin getAdmin(String adminId);
}
