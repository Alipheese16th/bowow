package com.lec.bowow.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.bowow.model.Qna;
import com.lec.bowow.service.QnaService;
import com.lec.bowow.util.Paging;

@Controller
@RequestMapping("qna")
public class QnaController {
	@Autowired
	private QnaService qnaService;
	@RequestMapping(value="list", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(String pageNum, Model model) {
		model.addAttribute("qnaList", qnaService.qnaList(pageNum));
		model.addAttribute("paging", new Paging(qnaService.totCntQna(), pageNum));
		return "qna/list";
	}
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String write(String pageNum, Model model) {
		model.addAttribute("qnaList", qnaService.qnaList(pageNum));
		return "qna/write";
	}
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(Qna qna, HttpServletRequest request, Model model) {
		model.addAttribute("writeQResult", qnaService.writeQna(qna, request));
		return "forward:list.do";
	}
	@RequestMapping(value="content", method= {RequestMethod.GET,RequestMethod.POST})
	public String content(int qnaNum, Model model) {
		model.addAttribute("contentQna", qnaService.contentQna(qnaNum));
		return "qna/content";
	}
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modify(int qnaNum, String pageNum, Qna qna, Model model) {
		model.addAttribute("qna", qnaService.modifyReplyQnaView(qnaNum));
		model.addAttribute("qnaList", qnaService.qnaList(pageNum));
		 return "qna/modify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modify(Qna qna, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("modifyQResult", qnaService.modifyQna(qna, request));
		} catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("modifyOResult", "수정 실패");
		}
		return "forward:content.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int qnaNum, Model model) {
		model.addAttribute("deleteQResult", qnaService.deleteQna(qnaNum));
		return "forward:list.do";
	}
	@RequestMapping(value="reply", method=RequestMethod.GET)
	public String reply(int qnaNum, String pageNum, Model model) {
		model.addAttribute("qna", qnaService.modifyReplyQnaView(qnaNum));
		model.addAttribute("qnaList", qnaService.qnaList(pageNum));
		return "qna/reply";
	}
	@RequestMapping(value="reply", method=RequestMethod.POST)
	public String reply(Qna qna, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("replyQResult", qnaService.replyQna(qna, request));
		} catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("replyQResult", "답변 작성이 실패되었습니다");
		}
		return "forward:list.do";
	}
}
