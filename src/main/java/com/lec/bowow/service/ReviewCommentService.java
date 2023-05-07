package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lec.bowow.model.ReviewComment;

public interface ReviewCommentService {
	public List<ReviewComment> rcommentList(int reviewNum, String commentPageNum, Model model);
	public void rcommentWrite(ReviewComment reviewComment, HttpServletRequest request, Model model);
	public void rcommentModify(ReviewComment reviewComment, HttpServletRequest request);
	public ReviewComment getRcomment(int commentNum);
	public int rcommentDelete(int commentNum);
}
