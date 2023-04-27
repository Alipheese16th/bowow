package com.lec.bowow.dao;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.annotations.Mapper;
import com.lec.bowow.model.Admin;
import com.lec.bowow.model.Qna;

@Mapper
public interface AdminDao {
	public List<Admin> adminList();
	public Admin getAdmin(String adminId);
}
