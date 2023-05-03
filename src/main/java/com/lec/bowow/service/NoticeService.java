package com.lec.bowow.service;

import java.util.List;
import com.lec.bowow.model.Notice;
import com.lec.bowow.util.Paging;

public interface NoticeService {
	
	public List<Notice> getNoticeList(String pageNum, String type, String search);
	public Paging getPaging(String pageNum, String type, String search);
	public String writeNotice(Notice notice);
	public Notice contentNotice(int noticeNum);
	public Notice getNotice(int noticeNum);
	public int modifyNotice(Notice notice);
	public int deleteNotice(int noticeNum);
}
