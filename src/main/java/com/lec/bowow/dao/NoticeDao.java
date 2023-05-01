package com.lec.bowow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.Notice;

@Mapper
public interface NoticeDao {
	
	// 공지사항 리스트 (기본)
	public List<Notice> noticeListAll(Notice notice);
	public int totCntNoticeAll();
	// 공지사항 검색 (전체)
	public List<Notice> noticeListFull(Notice notice);
	public int totCntNoticeFull(String search);
	// 공지사항 검색 (제목)
	public List<Notice> noticeListTitle(Notice notice);
	public int totCntNoticeTitle(String search);
	// 공지사항 검색 (내용)
	public List<Notice> noticeListContent(Notice notice);
	public int totCntNoticeContent(String search);
	// 공지사항 검색 (작성자)
	public List<Notice> noticeListWriter(Notice notice);
	public int totCntNoticeWriter(String search);
	
	public Notice contentNotice(int noticeNum);
	public void noticeHitUp(int noticeNum);
	
	public int writeNotice(Notice notice);
	public int modifyNotice(Notice notice);
	public int deleteNotice(int noticeNum);
}
