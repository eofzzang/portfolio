package org.gasan.service;

import javax.inject.Inject;

import org.gasan.dao.MemberDAO;
import org.gasan.domain.MemberVO;
import org.gasan.util.MailHandler;
import org.gasan.util.TempKey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class CommonServiceImpl implements CommonService {

	@Inject MemberDAO dao;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwEncoder;
	private JavaMailSender mailSender;
	
	
	@Transactional
	@Override
	public void customSignup(MemberVO vo) throws Exception{
		// TODO Auto-generated method stub
		vo.setUserpw(pwEncoder.encode(vo.getUserpw()));
		log.info("User Security PW" + vo.getUserpw());
		dao.createMember(vo);
		dao.createMemberAuth(vo);
		String key = new TempKey().getKey(50, false); // 인증키 생성
		dao.createAuthKey(vo.getUserEmail(), key); // 인증키 DB저장
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[홈페이지 이메일 인증]"); // 메일제목
		sendMail.setText( // 메일내용
				"<h1>메일인증</h1>" +
				"<a href='http://localhost:8080/emailConfirm?userEmail=" + vo.getUserEmail() +
				"&key=" + key +
				"' target='_blenk'>이메일 인증 확인</a>");
		sendMail.setFrom("koittih@gmail.com", "운영자"); // 보낸이
		sendMail.setTo(vo.getUserEmail()); // 받는이
		sendMail.send();
	}
	
	
	//아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}
	
	@Override
	public void userAuth(String userEmail) throws Exception {
		dao.userAuth(userEmail);
	}
	
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		//받은 vo를 DAO로 보내줍니다.
		vo.setUserpw(pwEncoder.encode(vo.getUserpw()));
		dao.memberUpdate(vo);
	}
	
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		dao.memberDelete(vo);
	}

}
