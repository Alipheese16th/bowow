package com.lec.bowow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.Notice;

@Mapper
public interface NoticeDao {
	public List<Notice> noticeList(Notice notice);
	public int totCntNotice(Notice notice);
	public int writeNotice(Notice notice);
	public Notice contentNotice(int noticeNum);
	public int modifyNotice(Notice notice);
	public int deleteNotice(int noticeNum);
}
