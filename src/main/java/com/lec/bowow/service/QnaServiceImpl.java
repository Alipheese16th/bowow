package com.lec.bowow.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.lec.bowow.dao.QnaDao;
import com.lec.bowow.model.Admin;
import com.lec.bowow.model.Member;
import com.lec.bowow.model.Qna;
import com.lec.bowow.util.Paging;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaDao qnaDao;
	@Override
	public List<Qna> qnaList() {
		return qnaDao.qnaAList();
	}
	@Override
	public List<Qna> qnaList(Qna qna, String pageNum) {
		Paging paging = new Paging(qnaDao.totCntQna(qna), pageNum);
		qna.setStartRow(paging.getStartRow());
		qna.setEndRow(paging.getEndRow());
		return qnaDao.qnaList(qna);
	}
	@Override
	public int totCntQna(Qna qna) {
		return qnaDao.totCntQna(qna);
	}
	@Override
	public int writeQna(Qna qna, HttpServletRequest request, HttpSession httpSession) {
		qna.setQnaIp(request.getRemoteAddr());
		Member member = (Member) httpSession.getAttribute("member");
		if(member == null) {
			return -1;
		}else {
			qna.setMemberId(member.getMemberId());
			return qnaDao.writeQna(qna);
			
		}
	}
	@Override
	public Qna contentQna(int qnaNum) {
		qnaDao.hitUpQna(qnaNum);
		return qnaDao.contentQna(qnaNum);
	}
	@Override
	public int modifyQna(Qna qna, HttpServletRequest request, HttpSession httpSession) {
		qna.setQnaIp(request.getRemoteAddr());
		return qnaDao.modifyQna(qna);
	}
	@Override
	public int deleteQna(int qnaNum) {
		return qnaDao.deleteQna(qnaNum);
	}
	@Override
	public int replyQna(Qna qna, HttpServletRequest request, HttpSession httpSession) {
		qnaDao.preReplyQna(qna);
		Admin admin = (Admin) httpSession.getAttribute("admin");
		qna.setQnaIp(request.getRemoteAddr());
		qna.setAdminId(admin.getAdminId());
		return qnaDao.replyQna(qna);
	}
}
