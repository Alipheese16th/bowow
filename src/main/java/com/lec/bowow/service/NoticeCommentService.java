package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.lec.bowow.model.NoticeComment;

public interface NoticeCommentService {
	
	public List<NoticeComment> ncList(int noticeNum, String commentPageNum);
	public int ncTotCnt(int noticeNum);
	
	public int ncWrite(NoticeComment noticeComment, HttpServletRequest request);
	
	public int ncUpdate(NoticeComment noticeComment);
	public int ncDelete(int ncNum);
}
