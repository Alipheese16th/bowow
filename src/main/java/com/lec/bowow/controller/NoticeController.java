package com.lec.bowow.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.lec.bowow.model.Notice;
import com.lec.bowow.model.NoticeComment;
import com.lec.bowow.service.NoticeCommentService;
import com.lec.bowow.service.NoticeService;
import com.lec.bowow.util.Paging;

@Controller
@RequestMapping("notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private NoticeCommentService noticeCommentService;
	
	// 공지리스트
	@RequestMapping(value="list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(Model model, String pageNum, String type, String search) {
		model.addAttribute("noticeList", noticeService.getNoticeList(pageNum, type, search));
		model.addAttribute("paging", noticeService.getPaging(pageNum, type, search));
		return "notice/noticeList";
	}
	// 공지상세보기 (댓글리스트)
	@RequestMapping(value="content", method = {RequestMethod.GET,RequestMethod.POST})
	public String content(Model model, int noticeNum, String pageNum, String type, String search, String commentPageNum) {
		model.addAttribute("noticeList", noticeService.getNoticeList(pageNum, type, search));
		model.addAttribute("paging", noticeService.getPaging(pageNum, type, search));
		model.addAttribute("notice",noticeService.contentNotice(noticeNum));
		
		model.addAttribute("commentList",noticeCommentService.ncList(noticeNum, commentPageNum));
		model.addAttribute("commentPaging",new Paging(noticeCommentService.ncTotCnt(noticeNum),commentPageNum,10,5));
		
		return "notice/content";
	}
	// 공지 작성form
	@RequestMapping(value="write", method = RequestMethod.GET)
	public String write() {
		return "notice/write";
	}
	// 공지 작성처리
	@RequestMapping(value="write", method = RequestMethod.POST)
	public String write(Model model, Notice notice, String ad) {
		model.addAttribute("noticeWriteResult",noticeService.writeNotice(notice));
		return "forward:list.do";
	}
	// 공지댓글 작성
	@RequestMapping(value="ncWrite", method = RequestMethod.POST)
	public String ncWrite(Model model, NoticeComment noticeComment, HttpServletRequest request) {
		model.addAttribute("ncWriteResult",noticeCommentService.ncWrite(noticeComment, request));
		return "forward:content.do";
	}
	// 공지댓글 수정
	@RequestMapping(value="ncModify", method=RequestMethod.GET)
	public String ncModify(Model model, int ncNum) {
		model.addAttribute("nc",noticeCommentService.getNc(ncNum));
		return null;
	}
	
	
	
	
	///////////////////////////////////////////////// 관리자
	// 관리자 공지 등록
	@RequestMapping(value="noticeWrite", method = RequestMethod.GET)
	public String noticeWrite() {
		return "admin/noticeWrite";
	}
	// 관리자 공지 등록처리
	@RequestMapping(value="noticeWrite", method = RequestMethod.POST)
	public String noticeWrite(Model model, Notice notice) {
		model.addAttribute("noticeWriteResult",noticeService.writeNotice(notice));
		return "forward:manage.do";
	}
	// 관리자 공지 관리
	@RequestMapping(value="manage", method = {RequestMethod.GET, RequestMethod.POST})
	public String manage(Model model, String pageNum, String type, String search) {
		model.addAttribute("noticeList", noticeService.getNoticeList(pageNum, type, search));
		model.addAttribute("paging", noticeService.getPaging(pageNum, type, search));
		return "admin/noticeManage";
	}
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete(int noticeNum) {
		noticeService.deleteNotice(noticeNum);
		return "forward:manage.do";
	}
	@RequestMapping(value="modify", method = RequestMethod.GET)
	public String modify(Model model, int noticeNum) {
		model.addAttribute("notice",noticeService.getNotice(noticeNum));
		return "admin/noticeModify";
	}
	@RequestMapping(value="modify", method = RequestMethod.POST)
	public String modify(Model model, Notice notice) {
		noticeService.modifyNotice(notice);
		return "forward:manage.do";
	}
	
}
