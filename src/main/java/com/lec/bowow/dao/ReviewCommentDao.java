package com.lec.bowow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.ReviewComment;

@Mapper
public interface ReviewCommentDao {
	public List<ReviewComment> rcommentList(ReviewComment reviewComment);
	public int rcommentTotCnt(int reviewNum);
	public int rcommentWrite(ReviewComment reviewComment);
	public int rcommentModify(ReviewComment reviewComment);
	public ReviewComment getRcomment(int commentNum);
	public int rcommentDelete(int commentNum);
}
