package org.gasan.dao;

import org.gasan.domain.MemberVO;

public interface MemberDAO {
	
	 
	
	//가입과 권한 조인
	public MemberVO read(String userid);
	
	//회원가입
	public void createMember(MemberVO vo) throws Exception;
	public void createMemberAuth(MemberVO vo) throws Exception;
	
	
	//회원 탈퇴
	public void memberDelete(MemberVO vo) throws Exception;
	
	
	//회원 정보 수정
	public void memberUpdate(MemberVO vo)throws Exception;
	
	
	//아이디 중복 체크
	public int idChk(MemberVO vo) throws Exception;

	
	//이메일 인증키
	public void createAuthKey(String userEmail, String authKey) throws Exception;

	//이메일 인증
	public void userAuth(String userEmail) throws Exception;
	
}
