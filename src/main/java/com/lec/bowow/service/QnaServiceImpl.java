package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.bowow.dao.QnaDao;
import com.lec.bowow.model.Qna;
import com.lec.bowow.util.Paging;
@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaDao qnaDao;
	@Override
	public List<Qna> qnaList(String pageNum) {
		Paging paging = new Paging(qnaDao.totCntQna(), pageNum);
		Qna qna = new Qna();
		qna.setStartRow(paging.getStartRow());
		qna.setEndRow(paging.getEndRow());
		return qnaDao.qnaList(qna);
	}
	@Override
	public int totCntQna() {
		return qnaDao.totCntQna();
	}
	@Override
	public int writeQna(Qna qna, HttpServletRequest request) {
		qna.setQnaIp(request.getRemoteAddr());
//		String uploadPath = mRequest.getRealPath("qnaFileImage/");
//		Iterator<String> params = mRequest.getFileNames();
//		String qimg = "";
//		if(params.hasNext()) {
//			String param = params.next();
//			MultipartFile mFile = mRequest.getFile(param);
//			qimg = mFile.getOriginalFilename();
//			if(qimg!=null && !qimg.equals("")) {
//				if(new File(uploadPath+qimg).exists()) {
//					qimg = System.currentTimeMillis()+"_"+qimg;
//				}
//				try {
//					mFile.transferTo(new File(uploadPath+qimg));
//					System.out.println("서버파일 : " + uploadPath + qimg);
//				} catch (Exception e) {
//					System.out.println(e.getMessage());
//				}
//			}
//		}
//		qna.setQnaImage(qimg);
		return qnaDao.writeQna(qna);
	}
	@Override
	public Qna contentQna(int qnaNum) {
		return qnaDao.contentQna(qnaNum);
	}
	@Override
	public Qna modifyReplyQnaView(int qnaNum) {
		return qnaDao.contentQna(qnaNum);
	}
	@Override
	public int modifyQna(Qna qna, HttpServletRequest request) {
		qna.setQnaIp(request.getRemoteAddr());
		return qnaDao.modifyQna(qna);
	}
	@Override
	public int deleteQna(int qnaNum) {
		return qnaDao.deleteQna(qnaNum);
	}
	@Override
	public int replyQna(Qna qna, HttpServletRequest request) {
		qnaDao.preReplyQna(qna);
		qna.setQnaIp(request.getRemoteAddr());
		return qnaDao.replyQna(qna);
	}
}
