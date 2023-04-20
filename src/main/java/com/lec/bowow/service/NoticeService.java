package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.lec.bowow.model.Notice;

public interface NoticeService {
	public List<Notice> noticeList(String pageNum);
	public int totCntNotice();
	public int writeNotice(Notice notice);
	public Notice contentNotice(int noticeNum);
	public int modifyNotice(Notice notice);
	public int deleteNotice(int noticeNum);
}