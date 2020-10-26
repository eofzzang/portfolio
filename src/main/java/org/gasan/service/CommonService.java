package org.gasan.service;

import org.gasan.domain.MemberVO;

public interface CommonService {

	//회원가입
	public void customSignup(MemberVO vo) throws Exception;
	
	//회원정보수정
	public void memberUpdate(MemberVO vo) throws Exception;
	
	//회원탈퇴
	public void memberDelete(MemberVO vo) throws Exception;
	
	//아이디 체크
	public int idChk(MemberVO vo) throws Exception;
	
	//이메일 유저 인증
	public void userAuth(String userEmail) throws Exception;
}
