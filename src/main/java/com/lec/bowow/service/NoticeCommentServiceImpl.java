package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.bowow.dao.NoticeCommentDao;
import com.lec.bowow.model.NoticeComment;
import com.lec.bowow.util.Paging;

@Service
public class NoticeCommentServiceImpl implements NoticeCommentService {
	
	@Autowired
	private NoticeCommentDao noticeCommentDao;
	
	@Override
	public List<NoticeComment> ncList(int noticeNum, String commentPageNum) {
		Paging paging = new Paging(ncTotCnt(noticeNum),commentPageNum, 10, 5);
		NoticeComment nc = new NoticeComment();
		nc.setNoticeNum(noticeNum);
		nc.setStartRow(paging.getStartRow());
		nc.setEndRow(paging.getEndRow());
		return noticeCommentDao.ncList(nc);
	}
	@Override
	public int ncTotCnt(int noticeNum) {
		return noticeCommentDao.ncTotCnt(noticeNum);
	}

	@Override
	public int ncWrite(NoticeComment noticeComment, HttpServletRequest request) {
		noticeComment.setNcIp(request.getRemoteAddr());
		return noticeCommentDao.ncWrite(noticeComment);
	}

	@Override
	public int ncUpdate(NoticeComment noticeComment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int ncDelete(int ncNum) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
