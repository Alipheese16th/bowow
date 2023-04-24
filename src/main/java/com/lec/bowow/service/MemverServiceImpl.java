package com.lec.bowow.service;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import com.lec.bowow.dao.MemberDao;
import com.lec.bowow.model.Member;
@Service
public class MemverServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private JavaMailSender mailSender;
	@Override
	public int midConfirm(String memberId) {
		return memberDao.midConfirm(memberId);
	}
	@Override
	public int joinMember(final Member member) {
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<div style=\\\"width:500px; margin:0 auto;\\\">\\r\\n\" + \r\n" + 
					"					\"		<h1>\"+ member.getMname() + \"님의 회원가입 감사합니다.</h1>\\r\\n\" + \r\n" + 
					"					\"		<p>아무개 사이트에서만 쓰실 수 있는 감사쿠폰을 드립니다.</p>\\r\\n\" + \r\n" + 
					"					\"		<img src=\\\"https://t1.daumcdn.net/daumtop_chanel/op/20200723055344399.png\\\" alt=\\\"daum로고\\\">\\r\\n\" + \r\n" + 
					"					\"		<hr color=\\\"red\\\">\\r\\n\" + \r\n" + 
					"					\"		<span style=\\\"color:red;\\\">빨간 글씨 부분</span><br>\\r\\n\" + \r\n" + 
					"					\"		<span style=\\\"color:blue;\\\">파란 글씨 부분</span>\\r\\n\" + \r\n" + 
					"					\"		<p><img src=\\\"http://localhost:8090/ch19_sch/img/coupon.jpg\\\" alt=\\\"쿠폰\\\"></p>\\r\\n\" + \r\n" + 
					"					\"		<p align=\\\"center\\\">서울시 어떤구 몰라 17길 51 어떤빌딩 4층</p>\\r\\n\" + \r\n" + 
					"					\"	</div>";
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// 받을 메일 설정 
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMemberEmail()));
				mimeMessage.setSubject("[HTML 가입인사]" + member.getMemberName() + "님 회원가입 감사합니다.");
				mimeMessage.setText(content, "utf-8", "html");
			}
		};
		mailSender.send(message); // 메일 전송
		return memberDao.joinMember(member);
	}
	@Override
	public String loginCheck(String memberId, String memberPw, HttpSession session) {
		String result = "로그인 성공";
		Member member = memberDao.getDetailMember(memberId);
		if(member==null) {
			result = "유효하지 않은 아이디입니다.";
		}else if(member.getMemberPw().equals(memberPw)) {
			result = "비밀번호가 일치하지 않습니다.";
		}else {			
			session.setAttribute("member", member);
		}
		return result;
	}
	@Override
	public String searchIdMember(String memberEmail) {
		return memberDao.searchIdMember(memberEmail);
	}
	@Override
	public String searchPwMember(String memberId) {
		return memberDao.searchPwMember(memberId);
	}
	@Override
	public Member getDetailMember(String memberId) {
		return memberDao.getDetailMember(memberId);
	}
	@Override
	public Member modifyMember(Member member, HttpSession session) {
		return memberDao.modifyMember(member);
	}
	@Override
	public int deleteMember(String memberId, HttpSession session) {
		return memberDao.deleteMember(memberId);
	}
}
