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
		Paging paging = new Paging(noticeDao.totCntNotice(), pageNum);
		Notice notice = new Notice();
		notice.setStartRow(paging.getStartRow());
		notice.setEndRow(paging.getEndRow());
		return noticeDao.noticeList(notice);
	}
	@Override
	public int totCntNotice() {
		return noticeDao.totCntNotice();
	}
	@Override
	public int writeNotice(Notice notice) {
		return noticeDao.writeNotice(notice);
	}
	@Override
	public Notice contentNotice(int noticeNum) {
		return noticeDao.contentNotice(noticeNum);
	}
	@Override
	public int modifyNotice(Notice notice) {
		return noticeDao.modifyNotice(notice);
	}

	@Override
	public int deleteNotice(int noticeNum) {
		return noticeDao.deleteNotice(noticeNum);
	}
}
