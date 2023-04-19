package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.bowow.dao.NoticeDao;
import com.lec.bowow.model.Notice;
import com.lec.bowow.util.Paging;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao noticeDao;
	@Override
	public List<Notice> noticeList(String pageNum) {
		return null;
	}
	@Override
	public int totCntNotice() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int writeNotice(Notice notice, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Notice contentNotice(int noticeNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyNotice(Notice notice, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(int noticeNum) {
		// TODO Auto-generated method stub
		return 0;
	}

}
