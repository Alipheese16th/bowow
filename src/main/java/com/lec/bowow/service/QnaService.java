package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.lec.bowow.model.Product;
import com.lec.bowow.model.Qna;

public interface QnaService {
	public List<Qna> qnaList();
	public List<Qna> qnaList(Qna qna, String pageNum);
	public int totCntQna(Qna qna);
	public int writeQna(Qna qna, HttpServletRequest request, HttpSession httpSession);
	public Qna contentQna(int qnaNum);
	public int modifyQna(Qna qna, HttpServletRequest request, HttpSession httpSession);
	public int deleteQna(int qnaNum);
	public int replyQna(Qna qna, HttpServletRequest request, HttpSession httpSession);
}
