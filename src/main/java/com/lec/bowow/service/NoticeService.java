package com.lec.bowow.service;

import java.util.List;
import com.lec.bowow.model.Notice;
import com.lec.bowow.util.Paging;

public interface NoticeService {
	
	
	public List<Notice> getNoticeList(String pageNum, String type, String search);
	public Paging getPaging(String pageNum, String type, String search);
	
	
//	// 공지사항 리스트 (기본)
//	public List<Notice> noticeListAll(String pageNum);
//	public int totCntNoticeAll();
//	// 공지사항 검색 (전체)
//	public List<Notice> noticeListFull(String pageNum, String search);
//	public int totCntNoticeFull(String search);
//	// 공지사항 검색 (제목)
//	public List<Notice> noticeListTitle(String pageNum, String search);
//	public int totCntNoticeTitle(String search);
//	// 공지사항 검색 (내용)
//	public List<Notice> noticeListContent(String pageNum, String search);
//	public int totCntNoticeContent(String search);
//	// 공지사항 검색 (작성자)
//	public List<Notice> noticeListWriter(String pageNum, String search);
//	public int totCntNoticeWriter(String search);
	
	
	public int writeNotice(Notice notice);
	public Notice contentNotice(int noticeNum);
	public int modifyNotice(Notice notice);
	public int deleteNotice(int noticeNum);
}
