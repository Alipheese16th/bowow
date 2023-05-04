package com.lec.bowow.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.lec.bowow.model.NoticeComment;

@Mapper
public interface NoticeCommentDao {
	
	public List<NoticeComment> ncList(NoticeComment noticeComment);
	public int ncTotCnt(int noticeNum);
	public int ncWrite(NoticeComment noticeComment);
	public NoticeComment getNc(int ncNum);
	
	public int ncUpdate(NoticeComment noticeComment);
	public int ncDelete(int ncNum);
}
