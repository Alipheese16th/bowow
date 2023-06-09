package com.lec.bowow.service;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.lec.bowow.dao.AdminDao;
import com.lec.bowow.model.Admin;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public String adminLogin(String adminId, String adminPw, HttpSession httpSession) {
		String result = "관리자 로그인 성공";
		Admin admin = adminDao.getAdmin(adminId);
		if(admin == null) {
			result = "유효하지 않은 아이디 입니다";
		} else if(! admin.getAdminPw().equals(adminPw)) {
			result = "비밀번호가 맞지 않습니다";
		} else {
			httpSession.removeAttribute("member");
			httpSession.setAttribute("admin", admin);
		}
		return result;
	}
	@Override
	public Admin getAdmin(String adminId) {
		return adminDao.getAdmin(adminId);
	}
}
