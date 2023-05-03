package com.lec.bowow.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.lec.bowow.dao.NoticeDao;
import com.lec.bowow.model.Notice;
import com.lec.bowow.util.Paging;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao noticeDao;
	
	// 공지사항 리스트 (검색 가능)
	@Override
	public List<Notice> getNoticeList(String pageNum, String type, String search) {
		if(type == null || type.equals("")) {
			Paging paging = getPaging(pageNum, type, search);
			Notice notice = new Notice();
			notice.setStartRow(paging.getStartRow());
			notice.setEndRow(paging.getEndRow());
			return noticeDao.noticeListAll(notice);
		}else if(type.equals("full")) {
			Paging paging = getPaging(pageNum, type, search);
			Notice notice = new Notice();
			notice.setStartRow(paging.getStartRow());
			notice.setEndRow(paging.getEndRow());
			notice.setSearch(search);
			return noticeDao.noticeListFull(notice);
		}else if(type.equals("title")) {
			Paging paging = getPaging(pageNum, type, search);
			Notice notice = new Notice();
			notice.setStartRow(paging.getStartRow());
			notice.setEndRow(paging.getEndRow());
			notice.setSearch(search);
			return noticeDao.noticeListTitle(notice);
		}else if(type.equals("content")) {
			Paging paging = getPaging(pageNum, type, search);
			Notice notice = new Notice();
			notice.setStartRow(paging.getStartRow());
			notice.setEndRow(paging.getEndRow());
			notice.setSearch(search);
			return noticeDao.noticeListContent(notice);
		}else if(type.equals("writer")) {
			Paging paging = getPaging(pageNum, type, search);
			Notice notice = new Notice();
			notice.setStartRow(paging.getStartRow());
			notice.setEndRow(paging.getEndRow());
			notice.setSearch(search);
			return noticeDao.noticeListWriter(notice);
		}else {
			Paging paging = getPaging(pageNum, type, search);
			Notice notice = new Notice();
			notice.setStartRow(paging.getStartRow());
			notice.setEndRow(paging.getEndRow());
			return noticeDao.noticeListAll(notice);
		}
	}
	@Override
	public Paging getPaging(String pageNum, String type, String search) {
		if(type == null || type.equals("")) {
			return new Paging(noticeDao.totCntNoticeAll(), pageNum, 10, 5);
		}else if(type.equals("full")) {
			return new Paging(noticeDao.totCntNoticeFull(search), pageNum, 10, 5);
		}else if(type.equals("title")) {
			return new Paging(noticeDao.totCntNoticeTitle(search), pageNum, 10, 5);
		}else if(type.equals("content")) {
			return new Paging(noticeDao.totCntNoticeContent(search), pageNum, 10, 5);
		}else if(type.equals("writer")) {
			return new Paging(noticeDao.totCntNoticeWriter(search), pageNum, 10, 5);
		}else {
			return new Paging(noticeDao.totCntNoticeAll(), pageNum, 10, 5);
		}
	}
	// 공지 상세보기
	@Override
	public Notice contentNotice(int noticeNum) {
		// 조회수 업
		noticeDao.noticeHitUp(noticeNum);
		return noticeDao.contentNotice(noticeNum);
	}
	// 공지 작성
	@Override
	public String writeNotice(Notice notice) {
		int result = noticeDao.writeNotice(notice);
		if(result == 0) {
			return "공지 작성 실패 - "+notice;
		}else {
			return null;
		}
	}
	// 공지 수정
	@Override
	public int modifyNotice(Notice notice) {
		return noticeDao.modifyNotice(notice);
	}
	// 공지 삭제
	@Override
	public int deleteNotice(int noticeNum) {
		return noticeDao.deleteNotice(noticeNum);
	}
	// 관리자 공지사항 수정용 정보 얻기
	@Override
	public Notice getNotice(int noticeNum) {
		return noticeDao.contentNotice(noticeNum);
	}
	
}
