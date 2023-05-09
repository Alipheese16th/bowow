package com.lec.bowow.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.lec.bowow.dao.CouponDao;
import com.lec.bowow.dao.MemberDao;
import com.lec.bowow.model.Coupon;
import com.lec.bowow.model.Member;
import com.lec.bowow.util.Paging;
@Service
public class MemverServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private CouponDao couponDao;
	
	@Autowired
	private JavaMailSender mailSender;
	@Override
	public int memberIdConfirm(String memberId) {
		return memberDao.memberIdConfirm(memberId);
	}
	@Override
	public int memberMailConfirm(String memberEmail) {
		return memberDao.memberMailConfirm(memberEmail);
	}
	@Override
	public int joinMember(final Member member, String memberBirthTemp, HttpSession session) {
		
		System.out.println("회원가입진행");
		System.out.println(memberBirthTemp);
		if(memberBirthTemp != null && !memberBirthTemp.equals("")) {
			member.setMemberBirth(Date.valueOf(memberBirthTemp));
		}
		System.out.println(member);
		int result = memberDao.joinMember(member); // 회원가입 처리
		
		if(result != 0) { // 회원가입 성공시
			session.setAttribute("memberId", member.getMemberId()); // 세션에 정보저장
			MimeMessagePreparator message = new MimeMessagePreparator() {
				String content = "<style>.body{\r\n" + 
						"			font-family: 'Pretendard-Regular', 'sans-serif';\r\n" + 
						"		}</style>"+
						"	<div class=\"body\" style=\"background:#f2f2f2; padding:25px;\">\r\n" + 
						"		<div style=\"width:600px; margin: 0 auto; background:#fff; padding:40px; \">\r\n" + 
						"			<img src=\"http://localhost:8099/bowow/img/bowow_logo.png\" style=\"width:200px; height:auto;margin:0; padding:0;\">\r\n" + 
						"			<br><br>\r\n" + 
						"			<h1>회원가입에 감사드립니다.</h1>\r\n" + 
						"			<p style=\"line-height:25px;\">회원가입 감사 <b>10% 쿠폰</b>을 발급해 드렸으니,<br>\r\n" + 
						"			마이페이지를 통해서 확인하시길 바랍니다.</p>\r\n" + 
						"			<a href=\"마이페이지링크\" style=\"color:#BE8D6E;text-decoration:none;\">쿠폰 확인하기 ></a>\r\n" + 
						"			<hr color=\"#000\" style=\"margin-bottom:30px; margin-top:30px;\">\r\n" + 
						"			<div>\r\n" + 
						"				<table style=\"width:100%;\">\r\n" + 
						"					<tr>\r\n" + 
						"						<td>아이디</td>\r\n" + 
						"						<td>"+ member.getMemberId() +"</td>\r\n" + 
						"					</tr>\r\n" + 
						"					<tr>\r\n" + 
						"						<td>가입일</td>\r\n" + 
						"						<td>"+ new Date(System.currentTimeMillis())+"</td>\r\n" + 
						"					</tr>\r\n" + 
						"					<tr style=\"height: 10px;\"><td></td></tr>\r\n" + 
						"					<tr style=\"width: 100%;height: 1px;background: #f2f2f2;\"><td colspan=\"3\"></td></tr>\r\n" + 
						"					<tr style=\"height: 10px;\"><td></td></tr>\r\n" + 
						"					<tr>\r\n" + 
						"						<td>회원혜택</td>\r\n" + 
						"					</tr>\r\n" + 
						"					<tr>\r\n" + 
						"						<td>- 회원등급별 다양한 이벤트 및 쿠폰 제공</td>\r\n" + 
						"					</tr>\r\n" + 
						"					<tr>\r\n" + 
						"						<td>- 쇼핑 구매액의 5% 포인트 적립</td>\r\n" + 
						"					</tr>\r\n" + 
						"					<tr style=\"height: 10px;\"><td></td></tr>\r\n" + 
						"					<tr style=\"width: 100%;height: 1px;background: #f2f2f2;\"><td colspan=\"3\"></td></tr>\r\n" + 
						"					<tr style=\"text-align: center;\">\r\n" + 
						"						<td colspan=\"5\">\r\n" + 
						"							<button onclick=\"location.href='홈페이지 메인주소링크'\" style=\"background: #BE8D6E;color: #fff;outline: none;border: none;height: 50px;border-radius: 5px;padding:0px 15px 0 15px;margin-top: 30px;font-family: 'Pretendard-Regular'; font-size:15px;\">회원 혜택 더 알아보기</button>\r\n" + 
						"						</td>\r\n" + 
						"					</tr>	\r\n" + 
						"				</table>\r\n" + 
						"			</div>\r\n" + 
						"		</div>\r\n" + 
						"	</div>";
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					// 받을 메일 설정 
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMemberEmail()));
					//mimeMessage.setFrom(new InternetAddress("sykim789456@gmail.com"));
					mimeMessage.setSubject("[BOWOW]" + member.getMemberName() + "님 회원가입 감사합니다.");
					mimeMessage.setText(content, "utf-8", "html");
				}
			};
			
			mailSender.send(message); // 메일 전송
			Coupon coupon = new Coupon();
			coupon.setMemberId(member.getMemberId());
			coupon.setCouponName("회원가입쿠폰");
			coupon.setCouponDiscount(2000);
			couponDao.insertCoupon(coupon); // 쿠폰증정
		} //회원가입 성공시
		return result;
	}
	
	@Override
	public String loginCheck(String memberId, String memberPw, HttpSession session) {
		String result = "로그인 성공";
		Member member = memberDao.getDetailMember(memberId);
		
		if(member==null) {
			result = "유효하지 않은 아이디입니다.";
		}else if(!member.getMemberPw().equals(memberPw)) {
			result = "비밀번호가 일치하지 않습니다.";
		}else {	
			session.removeAttribute("admin");
			session.setAttribute("member", member);
			
//			Date now = new Date(System.currentTimeMillis());
//	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//	        String nowstr = format.format(now);
//	        System.out.println(nowstr);
//			String memstr = format.format(member.getMemberBirth());
//			System.out.println(memstr);
//			if(nowstr.equals(memstr)) {
//				System.out.println("오늘이 생일");
//				Coupon coupon = new Coupon();
//				coupon.setMemberId(member.getMemberId());
//				coupon.setCouponName("생일축하쿠폰");
//				coupon.setCouponDiscount(4000);
//				couponDao.insertCoupon(coupon); // 쿠폰증정
//			}
			

		} 
		return result;
	}
  
	@Override
	public String searchIdMember(String memberName, String memberEmail) {
		Member member = new Member();
		member.setMemberName(memberName);
		member.setMemberEmail(memberEmail);
		String findIdResult = memberDao.searchIdMember(member);
//		Member member = memberDao.searchIDgetMember(memberName);
//		if(member==null) {
//			findIdResult = "가입 시 입력하신 회원 정보가 맞는지 다시 한번 확인해 주세요.";
//		}else if(!member.getMemberName().equals(memberName) || !member.getMemberEmail().equals(memberEmail)){
//			findIdResult = "가입 시 입력하신 회원 정보가 맞는지 다시 한번 확인해 주세요.";
//		}
		return findIdResult;
	}
	@Override
	public String searchPwMember(final String memberId, final String memberEmail) {
		final Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberEmail(memberEmail);
		String findPwResult = memberDao.searchPwMember(member);
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<head>\n" + 
					"	<link href=\"https://webfontworld.github.io/pretendard/Pretendard.css\" rel=\"stylesheet\">\n" + 
					"</head>\n" + 
					"<body style=\"margin:0;padding:0; text-align:center;font-size: 14px; font-family: 'Pretendard';\">\n" + 
					"	<div style=\"background:#fff; padding:25px;width:300px; margin: 0 auto;text-align:center;font-size: 14px; font-family: 'Pretendard';\">\n" + 
					"		<div>\n" + 
					"			<img src=\"http://localhost:8098/bowow/img/bowow_logo.png\" style=\"width:200px; height:auto;margin:0; padding:0;\">\n" + 
					"			<br><br>\n" + 
					"			<p>"+ memberId +"님 안녕하세요 BOWOW입니다.<br>요청하신 <b>비밀번호</b>를 안내드립니다.</p>\n" + 
					"			<p style=\"font-weight: 600;margin-top:20px;\">"+ memberDao.searchPwMember(member) +"</p>\n" + 
					"		</div>\n" + 
					"	</div>\n" + 
					"</body>";
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// 받을 메일 설정 
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(memberEmail));
				//mimeMessage.setFrom(new InternetAddress("sykim789456@gmail.com"));
				mimeMessage.setSubject("[BOWOW] 비밀번호를 안내드립니다.");
				mimeMessage.setText(content, "utf-8", "html");
			}
		};
		mailSender.send(message); // 메일 전송
		return findPwResult;
	}
	@Override
	public Member getDetailMember(String memberId) {
		return memberDao.getDetailMember(memberId);
	}
	@Override
	public int modifyMember(Member member, HttpSession session, String oldMemberPw, String memberBirthTemp) {
		System.out.println(memberBirthTemp);
		if(memberBirthTemp != null && !memberBirthTemp.equals("")) {
			member.setMemberBirth(Date.valueOf(memberBirthTemp));
		}
		if(member.getMemberPw().equals("")) {
			member.setMemberPw(oldMemberPw);
		}
		System.out.println(member);
		System.out.println(member.getMemberPw());
		session.setAttribute("member", member);
		System.out.println("회원정보수정완료");
		return memberDao.modifyMember(member);
	}
	@Override
	public int deleteMember(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		session.invalidate();
		return memberDao.deleteMember(member.getMemberId());
	}
	
	@Override
	public List<Coupon> couponList(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		if(member==null) {
			return null;
		}else {
			Coupon coupon = new Coupon();
			coupon.setMemberId(member.getMemberId());
			return couponDao.couponList(member.getMemberId());
		}	
	}
	@Override
	public String memberGrade(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		return memberDao.memberGrade(member.getMemberId());
	}
	@Override
	public int couponTotCnt(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		return memberDao.couponTotCnt(member.getMemberId());
	}

}
