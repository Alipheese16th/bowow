package com.lec.bowow.service;

import java.sql.Date;
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
import com.lec.bowow.model.Admin;
import com.lec.bowow.model.Inquiry;
import com.lec.bowow.model.Member;
import com.lec.bowow.util.Paging;
@Service
public class InquiryServiceImple implements InquiryService {
	@Autowired
	private InquiryDao inquiryDao;
	@Autowired
	private JavaMailSender mailSender;
	@Override
	public List<Inquiry> inquiryList(Inquiry inquiry, String pageNum) {
		Paging paging = new Paging(inquiryDao.totCntInquiry(), pageNum);
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
//	@Override
//	public int replyInquiry(Inquiry inquiry, HttpSession session) {
//		MimeMessagePreparator message = new MimeMessagePreparator() {
//			String content = "<style>.body{\r\n" + 
//					"			font-family: 'Pretendard-Regular', 'sans-serif';\r\n" + 
//					"		}</style>"+
//					"	<div class=\"body\" style=\"background:#f2f2f2; padding:25px;\">\r\n" + 
//					"		<div style=\"width:600px; margin: 0 auto; background:#fff; padding:40px; \">\r\n" + 
//					"			<img src=\"http://localhost:8098/bowow/img/bowow_logo.png\" style=\"width:200px; height:auto;margin:0; padding:0;\">\r\n" + 
//					"			<br><br>\r\n" + 
//					"			<h1>회원가입에 감사드립니다.</h1>\r\n" + 
//					"			<p style=\"line-height:25px;\">회원가입 감사 <b>10% 쿠폰</b>을 발급해 드렸으니,<br>\r\n" + 
//					"			마이페이지를 통해서 확인하시길 바랍니다.</p>\r\n" + 
//					"			<a href=\"마이페이지링크\" style=\"color:#BE8D6E;text-decoration:none;\">쿠폰 확인하기 ></a>\r\n" + 
//					"			<hr color=\"#000\" style=\"margin-bottom:30px; margin-top:30px;\">\r\n" + 
//					"			<div>\r\n" + 
//					"				<table style=\"width:100%;\">\r\n" + 
//					"					<tr>\r\n" + 
//					"						<td>아이디</td>\r\n" + 
////					"						<td>"+ member.getMemberId() +"</td>\r\n" + 
////					"					</tr>\r\n" + 
////					"					<tr>\r\n" + 
////					"						<td>가입일</td>\r\n" + 
////					"						<td>"+ new Date(System.currentTimeMillis())+"</td>\r\n" + 
//					"					</tr>\r\n" + 
//					"					<tr style=\"height: 10px;\"><td></td></tr>\r\n" + 
//					"					<tr style=\"width: 100%;height: 1px;background: #f2f2f2;\"><td colspan=\"3\"></td></tr>\r\n" + 
//					"					<tr style=\"height: 10px;\"><td></td></tr>\r\n" + 
//					"					<tr>\r\n" + 
//					"						<td>회원혜택</td>\r\n" + 
//					"					</tr>\r\n" + 
//					"					<tr>\r\n" + 
//					"						<td>- 회원등급별 다양한 이벤트 및 쿠폰 제공</td>\r\n" + 
//					"					</tr>\r\n" + 
//					"					<tr>\r\n" + 
//					"						<td>- 쇼핑 구매액의 5% 포인트 적립</td>\r\n" + 
//					"					</tr>\r\n" + 
//					"					<tr style=\"height: 10px;\"><td></td></tr>\r\n" + 
//					"					<tr style=\"width: 100%;height: 1px;background: #f2f2f2;\"><td colspan=\"3\"></td></tr>\r\n" + 
//					"					<tr style=\"text-align: center;\">\r\n" + 
//					"						<td colspan=\"5\">\r\n" + 
//					"							<button onclick=\"location.href='홈페이지 메인주소링크'\" style=\"background: #BE8D6E;color: #fff;outline: none;border: none;height: 50px;border-radius: 5px;padding:0px 15px 0 15px;margin-top: 30px;font-family: 'Pretendard-Regular'; font-size:15px;\">회원 혜택 더 알아보기</button>\r\n" + 
//					"						</td>\r\n" + 
//					"					</tr>	\r\n" + 
//					"				</table>\r\n" + 
//					"			</div>\r\n" + 
//					"		</div>\r\n" + 
//					"	</div>";
//			@Override
//			public void prepare(MimeMessage mimeMessage) throws Exception {
//				// 받을 메일 설정 
//				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMemberEmail()));
//				//mimeMessage.setFrom(new InternetAddress("sykim789456@gmail.com"));
//				mimeMessage.setSubject("[BOWOW]" + member.getMemberName() + "님 회원가입 감사합니다.");
//				mimeMessage.setText(content, "utf-8", "html");
//			}
//		};
//		mailSender.send(message); // 메일 전송
//		return inquiryDao.replyInquiry(inquiry);
//	}
}
