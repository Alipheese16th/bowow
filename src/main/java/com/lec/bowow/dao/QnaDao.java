package com.lec.bowow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.Qna;

@Mapper
public interface QnaDao {
	public List<Qna> qnaAList();
	public List<Qna> qnaList(Qna qna);
	public int totCntQna(Qna qna);
	public int writeQna(Qna qna);
	public void hitUpQna(int qnaNum);
	public Qna contentQna(int qnaNum);
	public int modifyQna(Qna qna);
	public int deleteQna(int qnaNum);
	public void preReplyQna(Qna qna);
	public int replyQna(Qna qna);
	public Qna modifyReplyQnaView(int qnaNum);
	
	// 해당 상품코드의 qna리스트 출력
	public List<Qna> productQnaList(Qna qna);
	public int productQnaTotCnt(String productCode);
}
