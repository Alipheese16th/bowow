package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.lec.bowow.model.Qna;

public interface QnaService {
	public List<Qna> qnaList(String pageNum);
	public int totCntQna();
	public int writeQna(Qna qna, HttpServletRequest request);
	public Qna contentQna(int qnaNum);
	public Qna modifyReplyQnaView(int qnaNum);
	public int modifyQna(Qna qna, HttpServletRequest request);
	public int deleteQna(int qnaNum);
	public int replyQna(Qna qna, HttpServletRequest request);
}
