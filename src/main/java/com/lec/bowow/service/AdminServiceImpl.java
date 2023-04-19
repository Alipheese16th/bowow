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
		String result = "������ �α��� ����";
		Admin admin = adminDao.getAdmin(adminId);
		if(admin == null) {
			result = "������ ���̵� �ƴմϴ�";
		} else if(! admin.getAdminPw().equals(adminPw)) {
			result = "��й�ȣ�� ���� �ʽ��ϴ�";
		} else {
			httpSession.setAttribute("admin", admin);
		}
		return result;
	}
	@Override
	public Admin getAdmin(String adminId) {
		return adminDao.getAdmin(adminId);
	}
}
