package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lec.bowow.dao.ReviewCommentDao;
import com.lec.bowow.model.ReviewComment;
import com.lec.bowow.util.Paging;

@Service
public class ReviewCommentServiceImpl implements ReviewCommentService {
	@Autowired
	private ReviewCommentDao reviewCommentDao;
	@Override
	public List<ReviewComment> rcommentList(int reviewNum, String commentPageNum, Model model) {
		ReviewComment reviewComment = new ReviewComment();
		Paging paging = new Paging(reviewCommentDao.rcommentTotCnt(reviewNum), commentPageNum, 5, 5);
		reviewComment.setReviewNum(reviewNum);
		reviewComment.setStartRow(paging.getStartRow());
		reviewComment.setEndRow(paging.getEndRow());
		model.addAttribute("comPaging", paging);
		return reviewCommentDao.rcommentList(reviewComment);
	}
	@Override
	public void rcommentWrite(ReviewComment reviewComment, HttpServletRequest request, Model model) {
		reviewComment.setCommentIp(request.getRemoteAddr());
		int result = reviewCommentDao.rcommentWrite(reviewComment);
		if(result==1) {
			model.addAttribute("rcommentResult", "댓글이 등록되었습니다");
		}else {
			model.addAttribute("rcommentResult", "댓글 등록이 실패되었습니다");
		}
	}
	@Override
	public ReviewComment getRcomment(int commentNum) {
		return reviewCommentDao.getRcomment(commentNum);
	}
	@Override
	public void rcommentModify(ReviewComment reviewComment, HttpServletRequest request) {
		reviewComment.setCommentIp(request.getRemoteAddr());
		int result = reviewCommentDao.rcommentModify(reviewComment);
		if(result==1) {
			System.out.println(reviewComment.getCommentNum()+"번 글 수정 완료");
		}else {
			System.out.println(reviewComment.getCommentNum()+"번 글 수정 실패");
		}
	}
	@Override
	public int rcommentDelete(int commentNum) {
		return reviewCommentDao.rcommentDelete(commentNum);
	}
}
