package com.lec.bowow.service;

import java.util.List;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import com.lec.bowow.dao.InquiryDao;
import com.lec.bowow.model.Inquiry;
import com.lec.bowow.model.Member;
@Service
public class InquiryServiceImple implements InquiryService {
	@Autowired
	private InquiryDao inquiryDao;
	@Autowired
	private JavaMailSender mailSender;
	@Override
	public List<Inquiry> inquiryList(Inquiry inquiry, String pageNum) {
		//Paging paging = new Paging(inquiryDao.totCntInquiry(), pageNum);
		return inquiryDao.inquiryList(inquiry);
	}
	@Override
	public int totCntInquiry() {
		return inquiryDao.totCntInquiry();
	}
	@Override
	public int writeInquiry(Inquiry inquiry, HttpSession httpSession) {
		Member member = (Member) httpSession.getAttribute("member");
		inquiry.setMemberId(member.getMemberId());
		return inquiryDao.writeInquiry(inquiry);
	}
	@Override
	public Inquiry contentInquiry(int inquiryNum) {
		return inquiryDao.contentInquiry(inquiryNum);
	}
	@Override
	public int modifyInquiry(Inquiry inquiry) {
		return inquiryDao.modifyInquiry(inquiry);
	}
	@Override
	public int deleteInquiry(int inquiryNum) {
		return inquiryDao.deleteInquiry(inquiryNum);
	}
	@Override
	public int replyInquiry(final Inquiry inquiry, HttpSession session) {
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<style>.body{\r\n" + 
					"			font-family: 'Pretendard-Regular', 'sans-serif';\r\n" + 
					"		}</style>"+
					"	<div class=\"body\" style=\"background:#f2f2f2; padding:25px;\">\r\n" + 
					"		<div style=\"width:600px; margin: 0 auto; background:#fff; padding:40px; \">\r\n" + 
					"			<img src=\"http://localhost:8094/bowow/img/bowow_logo.png\" style=\"width:200px; height:auto;margin:0; padding:0;\">\r\n" + 
					"			<br><br>\r\n" + 
					"			<h1>1:1문의 글에 답변이 등록되었습니다.</h1>\r\n" + 
					"			<p style=\"line-height:25px;\">답변 받으신 글은 1:1문의 게시판에서도,<br>\r\n" + 
					"			확인이 가능하오니, 참조 부탁드립니다.</p>\r\n" + 
					"			<a href=\"1:1문의 게시판 바로가기\" style=\"color:#BE8D6E;text-decoration:none;\">쿠폰 확인하기 ></a>\r\n" + 
					"			<hr color=\"#000\" style=\"margin-bottom:30px; margin-top:30px;\">\r\n" + 
					"			<div>\r\n" + 
					"				<table style=\"width:100%;\">\r\n" + 
					"					<tr>\r\n" + 
					"						<td>제목</td>\r\n" + 
					"						<td>"+ inquiry.getInquiryTitle() +"</td>\r\n" + 
					"					</tr>\r\n" + 
					"					<tr style=\"height: 10px;\"><td></td></tr>\r\n" + 
					"					<tr style=\"width: 100%;height: 1px;background: #f2f2f2;\"><td colspan=\"3\"></td></tr>\r\n" + 
					"					<tr style=\"height: 10px;\"><td></td></tr>\r\n" + 
					"					<tr>\r\n" + 
					"						<td>내용</td>\r\n" + 
					"						<td>"+ inquiry.getInquiryContent() +"</td>\r\n" + 
					"					</tr>\r\n" + 
					"					<tr style=\"height: 10px;\"><td></td></tr>\r\n" + 
					"					<tr style=\"width: 100%;height: 1px;background: #f2f2f2;\"><td colspan=\"3\"></td></tr>\r\n" + 
					"					<tr style=\"text-align: center;\">\r\n" + 
					"						<td colspan=\"5\">\r\n" + 
					"							<button onclick=\"location.href='메인페이지'\" style=\"background: #BE8D6E;color: #fff;outline: none;border: none;height: 50px;border-radius: 5px;padding:0px 15px 0 15px;margin-top: 30px;font-family: 'Pretendard-Regular'; font-size:15px;\">홈페이지 바로 가기</button>\r\n" + 
					"						</td>\r\n" + 
					"					</tr>	\r\n" + 
					"				</table>\r\n" + 
					"			</div>\r\n" + 
					"		</div>\r\n" + 
					"	</div>";
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// 받을 메일 설정 
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(inquiry.getInquiryEmail()));
				mimeMessage.setFrom(new InternetAddress("sykim789456@gmail.com"));
				mimeMessage.setSubject("[BOWOW]" + inquiry.getMemberId() + "님 문의 하신 글에 답변 드립니다.");
				mimeMessage.setText(content, "utf-8", "html");
			}
		};
		mailSender.send(message); // 메일 전송
		inquiryDao.preReplyInquiry(inquiry);
		return inquiryDao.replyInquiry(inquiry);
	}
	@Override
	public List<Inquiry> replyInquiryList(int inquiryNum) {
		return inquiryDao.replyInquiryList(inquiryNum);
	}
}
